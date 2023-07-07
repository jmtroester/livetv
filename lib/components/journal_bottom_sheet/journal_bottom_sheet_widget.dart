import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/level_up_sheet/level_up_sheet_widget.dart';
import '/components/send_journal_to_chat/send_journal_to_chat_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_bottom_sheet_model.dart';
export 'journal_bottom_sheet_model.dart';

class JournalBottomSheetWidget extends StatefulWidget {
  const JournalBottomSheetWidget({
    Key? key,
    this.verseRef,
    this.journalEntry,
    this.dateString,
    this.isEdit,
  }) : super(key: key);

  final String? verseRef;
  final String? journalEntry;
  final String? dateString;
  final bool? isEdit;

  @override
  _JournalBottomSheetWidgetState createState() =>
      _JournalBottomSheetWidgetState();
}

class _JournalBottomSheetWidgetState extends State<JournalBottomSheetWidget> {
  late JournalBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<JournalEntriesRecord>>(
      future: queryJournalEntriesRecordOnce(
        queryBuilder: (journalEntriesRecord) => journalEntriesRecord
            .where('journal_date_string', isEqualTo: widget.dateString)
            .where('journal_writer', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<JournalEntriesRecord> containerJournalEntriesRecordList =
            snapshot.data!;
        final containerJournalEntriesRecord =
            containerJournalEntriesRecordList.isNotEmpty
                ? containerJournalEntriesRecordList.first
                : null;
        return Container(
          width: double.infinity,
          height: 330.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3B1D2429),
                offset: Offset(0.0, -3.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('JOURNAL_BOTTOM_SHEET_SAVE_BTN_ON_TAP');
                    if (widget.isEdit!) {
                      logFirebaseEvent('Button_backend_call');

                      await containerJournalEntriesRecord!.reference
                          .update(createJournalEntriesRecordData(
                        journalEntry: widget.journalEntry,
                      ));
                      logFirebaseEvent('Button_backend_call');

                      await ActivityLogRecord.collection
                          .doc()
                          .set(createActivityLogRecordData(
                            activity: 'Edited Journal for ${widget.dateString}',
                            time: getCurrentTimestamp,
                            user: currentUserDisplayName,
                            showUser: true,
                            journalEntry:
                                containerJournalEntriesRecord!.reference,
                          ));
                    } else {
                      logFirebaseEvent('Button_backend_call');

                      var journalEntriesRecordReference =
                          JournalEntriesRecord.collection.doc();
                      await journalEntriesRecordReference
                          .set(createJournalEntriesRecordData(
                        journalDate: getCurrentTimestamp,
                        journalEntry: widget.journalEntry,
                        journalVerse: widget.verseRef,
                        journalWriter: currentUserReference,
                        journalDateString: widget.dateString,
                      ));
                      _model.newJournal =
                          JournalEntriesRecord.getDocumentFromData(
                              createJournalEntriesRecordData(
                                journalDate: getCurrentTimestamp,
                                journalEntry: widget.journalEntry,
                                journalVerse: widget.verseRef,
                                journalWriter: currentUserReference,
                                journalDateString: widget.dateString,
                              ),
                              journalEntriesRecordReference);
                      if (valueOrDefault(currentUserDocument?.points, 0) >=
                          86) {
                        logFirebaseEvent('Button_backend_call');

                        await currentUserReference!.update({
                          'points': FieldValue.increment(-(85)),
                          'level_id': FieldValue.increment(1),
                        });
                        logFirebaseEvent('Button_bottom_sheet');
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0x00000000),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: 400.0,
                                child: LevelUpSheetWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        logFirebaseEvent('Button_haptic_feedback');
                        HapticFeedback.vibrate();
                        logFirebaseEvent('Button_backend_call');

                        await ActivityLogRecord.collection
                            .doc()
                            .set(createActivityLogRecordData(
                              activity:
                                  'Leveled Up: ${valueOrDefault(currentUserDocument?.levelId, 0).toString()}',
                              time: getCurrentTimestamp,
                              user: currentUserDisplayName,
                              showUser: true,
                              journalEntry: _model.newJournal!.reference,
                            ));
                      } else {
                        logFirebaseEvent('Button_backend_call');

                        await currentUserReference!.update({
                          'points': FieldValue.increment(15),
                        });
                        logFirebaseEvent('Button_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'You\'ve been awarded 15 points!',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 6000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        );
                        logFirebaseEvent('Button_haptic_feedback');
                        HapticFeedback.heavyImpact();
                      }

                      logFirebaseEvent('Button_backend_call');

                      await ActivityLogRecord.collection
                          .doc()
                          .set(createActivityLogRecordData(
                            activity:
                                'Created Journal for ${widget.dateString}',
                            time: getCurrentTimestamp,
                            user: currentUserDisplayName,
                            showUser: true,
                            journalEntry: _model.newJournal!.reference,
                          ));
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update({
                        'item_3': FieldValue.arrayUnion([
                          functions.pullDateFromTimeStamp(getCurrentTimestamp)
                        ]),
                      });
                    }

                    logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed(
                      'DailyDevoInfo',
                      queryParameters: {
                        'dateString': serializeParam(
                          widget.dateString,
                          ParamType.String,
                        ),
                        'initialTab': serializeParam(
                          2,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );

                    setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'l61t7i1h' /* Save */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFFF0000),
                    textStyle: FlutterFlowTheme.of(context).titleSmall,
                    elevation: 4.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'JOURNAL_BOTTOM_SHEET_SAVE_AND_SEND_JOURN');
                      if (widget.isEdit!) {
                        logFirebaseEvent('Button_backend_call');

                        await containerJournalEntriesRecord!.reference
                            .update(createJournalEntriesRecordData(
                          journalEntry: widget.journalEntry,
                        ));
                        logFirebaseEvent('Button_backend_call');

                        await ActivityLogRecord.collection
                            .doc()
                            .set(createActivityLogRecordData(
                              activity:
                                  'Edited Journal for ${widget.dateString}',
                              time: getCurrentTimestamp,
                              user: currentUserDisplayName,
                              showUser: true,
                              journalEntry:
                                  containerJournalEntriesRecord!.reference,
                            ));
                      } else {
                        logFirebaseEvent('Button_backend_call');

                        var journalEntriesRecordReference =
                            JournalEntriesRecord.collection.doc();
                        await journalEntriesRecordReference
                            .set(createJournalEntriesRecordData(
                          journalDate: getCurrentTimestamp,
                          journalEntry: widget.journalEntry,
                          journalVerse: widget.verseRef,
                          journalWriter: currentUserReference,
                          journalDateString: widget.dateString,
                        ));
                        _model.newJournal2 =
                            JournalEntriesRecord.getDocumentFromData(
                                createJournalEntriesRecordData(
                                  journalDate: getCurrentTimestamp,
                                  journalEntry: widget.journalEntry,
                                  journalVerse: widget.verseRef,
                                  journalWriter: currentUserReference,
                                  journalDateString: widget.dateString,
                                ),
                                journalEntriesRecordReference);
                        if (valueOrDefault(currentUserDocument?.points, 0) >=
                            86) {
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!.update({
                            'points': FieldValue.increment(-(85)),
                            'level_id': FieldValue.increment(1),
                          });
                          logFirebaseEvent('Button_bottom_sheet');
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x00000000),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height: 400.0,
                                  child: LevelUpSheetWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          logFirebaseEvent('Button_haptic_feedback');
                          HapticFeedback.vibrate();
                          logFirebaseEvent('Button_backend_call');

                          await ActivityLogRecord.collection
                              .doc()
                              .set(createActivityLogRecordData(
                                activity:
                                    'Leveled Up: ${valueOrDefault(currentUserDocument?.levelId, 0).toString()}',
                                time: getCurrentTimestamp,
                                user: currentUserDisplayName,
                                showUser: true,
                                journalEntry: _model.newJournal!.reference,
                              ));
                        } else {
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!.update({
                            'points': FieldValue.increment(15),
                          });
                          logFirebaseEvent('Button_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You\'ve been awarded 15 points!',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 6000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          );
                          logFirebaseEvent('Button_haptic_feedback');
                          HapticFeedback.heavyImpact();
                        }

                        logFirebaseEvent('Button_backend_call');

                        await ActivityLogRecord.collection
                            .doc()
                            .set(createActivityLogRecordData(
                              activity:
                                  'Created Journal for ${widget.dateString}',
                              time: getCurrentTimestamp,
                              user: currentUserDisplayName,
                              showUser: true,
                              journalEntry: _model.newJournal2!.reference,
                            ));
                      }

                      logFirebaseEvent('Button_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Color(0x00000000),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 480.0,
                              child: SendJournalToChatWidget(
                                verseRef: widget.verseRef,
                                journalEntry: widget.journalEntry,
                                dateString: widget.dateString,
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'ygxe2me4' /* Save and Send Journal to Someo... */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                      elevation: 4.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'JOURNAL_BOTTOM_SHEET_SAVE_AND_POST_JOURN');
                      if (widget.isEdit!) {
                        logFirebaseEvent('Button_backend_call');

                        await containerJournalEntriesRecord!.reference
                            .update(createJournalEntriesRecordData(
                          journalEntry: widget.journalEntry,
                        ));
                        logFirebaseEvent('Button_backend_call');

                        await ActivityLogRecord.collection
                            .doc()
                            .set(createActivityLogRecordData(
                              activity:
                                  'Edited Journal for ${widget.dateString}',
                              time: getCurrentTimestamp,
                              user: currentUserDisplayName,
                              showUser: true,
                              journalEntry:
                                  containerJournalEntriesRecord!.reference,
                            ));
                      } else {
                        logFirebaseEvent('Button_backend_call');

                        var journalEntriesRecordReference =
                            JournalEntriesRecord.collection.doc();
                        await journalEntriesRecordReference
                            .set(createJournalEntriesRecordData(
                          journalDate: getCurrentTimestamp,
                          journalEntry: widget.journalEntry,
                          journalVerse: widget.verseRef,
                          journalWriter: currentUserReference,
                          journalDateString: widget.dateString,
                        ));
                        _model.newJournal3 =
                            JournalEntriesRecord.getDocumentFromData(
                                createJournalEntriesRecordData(
                                  journalDate: getCurrentTimestamp,
                                  journalEntry: widget.journalEntry,
                                  journalVerse: widget.verseRef,
                                  journalWriter: currentUserReference,
                                  journalDateString: widget.dateString,
                                ),
                                journalEntriesRecordReference);
                        if (valueOrDefault(currentUserDocument?.points, 0) >=
                            86) {
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!.update({
                            'points': FieldValue.increment(-(85)),
                            'level_id': FieldValue.increment(1),
                          });
                          logFirebaseEvent('Button_bottom_sheet');
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x00000000),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height: 400.0,
                                  child: LevelUpSheetWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          logFirebaseEvent('Button_haptic_feedback');
                          HapticFeedback.vibrate();
                          logFirebaseEvent('Button_backend_call');

                          await ActivityLogRecord.collection
                              .doc()
                              .set(createActivityLogRecordData(
                                activity:
                                    'Leveled Up: ${valueOrDefault(currentUserDocument?.levelId, 0).toString()}',
                                time: getCurrentTimestamp,
                                user: currentUserDisplayName,
                                showUser: true,
                                journalEntry: _model.newJournal!.reference,
                              ));
                        } else {
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!.update({
                            'points': FieldValue.increment(15),
                          });
                          logFirebaseEvent('Button_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You\'ve been awarded 15 points!',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 6000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          );
                          logFirebaseEvent('Button_haptic_feedback');
                          HapticFeedback.heavyImpact();
                        }

                        logFirebaseEvent('Button_backend_call');

                        await ActivityLogRecord.collection
                            .doc()
                            .set(createActivityLogRecordData(
                              activity:
                                  'Created Journal for ${widget.dateString}',
                              time: getCurrentTimestamp,
                              user: currentUserDisplayName,
                              showUser: true,
                              journalEntry: _model.newJournal3!.reference,
                            ));
                      }

                      logFirebaseEvent('Button_backend_call');

                      await SocialPostsRecord.collection
                          .doc()
                          .set(createSocialPostsRecordData(
                            content:
                                '${currentUserDisplayName} posted a journal from ${containerJournalEntriesRecord!.journalDateString} regarding verse ${containerJournalEntriesRecord!.journalVerse}.  -  ${containerJournalEntriesRecord!.journalEntry}',
                            postedBy: currentUserReference,
                            postedTime: getCurrentTimestamp,
                            isVideoPost: false,
                          ));
                      logFirebaseEvent('Button_backend_call');

                      await ActivityLogRecord.collection
                          .doc()
                          .set(createActivityLogRecordData(
                            activity:
                                'Posted Journal to Social Feed for ${widget.dateString}',
                            time: getCurrentTimestamp,
                            user: currentUserDisplayName,
                          ));
                      logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('socialFeed');

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'oasbdwqv' /* Save and Post Journal to Socia... */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                      elevation: 4.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'JOURNAL_BOTTOM_SHEET_CANCEL_BTN_ON_TAP');
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'td0z3e41' /* Cancel */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).lineColor,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 4.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
