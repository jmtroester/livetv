import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'help_sheet_model.dart';
export 'help_sheet_model.dart';

class HelpSheetWidget extends StatefulWidget {
  const HelpSheetWidget({Key? key}) : super(key: key);

  @override
  _HelpSheetWidgetState createState() => _HelpSheetWidgetState();
}

class _HelpSheetWidgetState extends State<HelpSheetWidget> {
  late HelpSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpSheetModel());

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

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Material(
              color: Colors.transparent,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                width: double.infinity,
                height: 400.0,
                constraints: BoxConstraints(
                  maxWidth: 500.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color(0xFFF1F4F8),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SelectionArea(
                                  child: AutoSizeText(
                                FFLocalizations.of(context).getText(
                                  'f8i53ees' /* Help me grow...
(Pick One) */
                                  ,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.85,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '3qgitfqt' /* Studying the Bible */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'esm3pcbl' /* Praying */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '8zi177o6' /* Forgiveness */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'fnifpx6g' /* Joy */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'hsxerr9e' /* Patience */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'a41uw3m2' /* Gratitude */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '3n0qkb5e' /* Compassion */,
                                            ))
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.choiceChipsValue =
                                                  val?.first),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor: Color(0xFF323B45),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: Colors.white,
                                                    ),
                                            iconColor: Colors.white,
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: Colors.white,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: Color(0xFF323B45),
                                                    ),
                                            iconColor: Color(0xFF323B45),
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                          ),
                                          chipSpacing: 5.0,
                                          rowSpacing: 12.0,
                                          multiselect: false,
                                          alignment: WrapAlignment.spaceAround,
                                          controller: _model
                                                  .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'HELP_SHEET_COMP_SUBMIT_BTN_ON_TAP');
                                            if (_model.choiceChipsValue ==
                                                'Studying the Bible') {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var discipleshipHelpRecordReference1 =
                                                  DiscipleshipHelpRecord
                                                      .collection
                                                      .doc();
                                              await discipleshipHelpRecordReference1
                                                  .set(
                                                      createDiscipleshipHelpRecordData(
                                                user: currentUserReference,
                                                dateStarted:
                                                    getCurrentTimestamp,
                                                dateStartedString: functions
                                                    .pullDateFromTimeStamp(
                                                        getCurrentTimestamp),
                                                helpType: 'Studying the Bible',
                                                completed: false,
                                              ));
                                              _model.newStudyingtheBible =
                                                  DiscipleshipHelpRecord
                                                      .getDocumentFromData(
                                                          createDiscipleshipHelpRecordData(
                                                            user:
                                                                currentUserReference,
                                                            dateStarted:
                                                                getCurrentTimestamp,
                                                            dateStartedString: functions
                                                                .pullDateFromTimeStamp(
                                                                    getCurrentTimestamp),
                                                            helpType:
                                                                'Studying the Bible',
                                                            completed: false,
                                                          ),
                                                          discipleshipHelpRecordReference1);
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await ActivityLogRecord.collection
                                                  .doc()
                                                  .set(
                                                      createActivityLogRecordData(
                                                    activity:
                                                        'Selected Help for ${_model.choiceChipsValue}',
                                                    time: getCurrentTimestamp,
                                                    user:
                                                        currentUserDisplayName,
                                                    showUser: true,
                                                  ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                discipleshipHelpCurrent: _model
                                                    .newStudyingtheBible!
                                                    .reference,
                                                discipleshipHelpName:
                                                    'Studying the Bible',
                                              ));
                                            }
                                            if (_model.choiceChipsValue ==
                                                'Praying') {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var discipleshipHelpRecordReference2 =
                                                  DiscipleshipHelpRecord
                                                      .collection
                                                      .doc();
                                              await discipleshipHelpRecordReference2
                                                  .set(
                                                      createDiscipleshipHelpRecordData(
                                                user: currentUserReference,
                                                dateStarted:
                                                    getCurrentTimestamp,
                                                dateStartedString: functions
                                                    .pullDateFromTimeStamp(
                                                        getCurrentTimestamp),
                                                helpType: 'Praying',
                                                completed: false,
                                              ));
                                              _model.newPraying = DiscipleshipHelpRecord
                                                  .getDocumentFromData(
                                                      createDiscipleshipHelpRecordData(
                                                        user:
                                                            currentUserReference,
                                                        dateStarted:
                                                            getCurrentTimestamp,
                                                        dateStartedString: functions
                                                            .pullDateFromTimeStamp(
                                                                getCurrentTimestamp),
                                                        helpType: 'Praying',
                                                        completed: false,
                                                      ),
                                                      discipleshipHelpRecordReference2);
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await ActivityLogRecord.collection
                                                  .doc()
                                                  .set(
                                                      createActivityLogRecordData(
                                                    activity:
                                                        'Selected Help for ${_model.choiceChipsValue}',
                                                    time: getCurrentTimestamp,
                                                    user:
                                                        currentUserDisplayName,
                                                    showUser: true,
                                                  ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                discipleshipHelpCurrent: _model
                                                    .newPraying!.reference,
                                                discipleshipHelpName: 'Praying',
                                              ));
                                            }
                                            if (_model.choiceChipsValue ==
                                                'Forgiveness') {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var discipleshipHelpRecordReference3 =
                                                  DiscipleshipHelpRecord
                                                      .collection
                                                      .doc();
                                              await discipleshipHelpRecordReference3
                                                  .set(
                                                      createDiscipleshipHelpRecordData(
                                                user: currentUserReference,
                                                dateStarted:
                                                    getCurrentTimestamp,
                                                dateStartedString: functions
                                                    .pullDateFromTimeStamp(
                                                        getCurrentTimestamp),
                                                helpType: 'Forgiveness',
                                                completed: false,
                                              ));
                                              _model.newForgiveness =
                                                  DiscipleshipHelpRecord
                                                      .getDocumentFromData(
                                                          createDiscipleshipHelpRecordData(
                                                            user:
                                                                currentUserReference,
                                                            dateStarted:
                                                                getCurrentTimestamp,
                                                            dateStartedString: functions
                                                                .pullDateFromTimeStamp(
                                                                    getCurrentTimestamp),
                                                            helpType:
                                                                'Forgiveness',
                                                            completed: false,
                                                          ),
                                                          discipleshipHelpRecordReference3);
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await ActivityLogRecord.collection
                                                  .doc()
                                                  .set(
                                                      createActivityLogRecordData(
                                                    activity:
                                                        'Selected Help for ${_model.choiceChipsValue}',
                                                    time: getCurrentTimestamp,
                                                    user:
                                                        currentUserDisplayName,
                                                    showUser: true,
                                                  ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                discipleshipHelpCurrent: _model
                                                    .newForgiveness!.reference,
                                                discipleshipHelpName:
                                                    'Forgiveness',
                                              ));
                                            }
                                            if (_model.choiceChipsValue ==
                                                'Joy') {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var discipleshipHelpRecordReference4 =
                                                  DiscipleshipHelpRecord
                                                      .collection
                                                      .doc();
                                              await discipleshipHelpRecordReference4
                                                  .set(
                                                      createDiscipleshipHelpRecordData(
                                                user: currentUserReference,
                                                dateStarted:
                                                    getCurrentTimestamp,
                                                dateStartedString: functions
                                                    .pullDateFromTimeStamp(
                                                        getCurrentTimestamp),
                                                helpType: 'Joy',
                                                completed: false,
                                              ));
                                              _model.newJoy = DiscipleshipHelpRecord
                                                  .getDocumentFromData(
                                                      createDiscipleshipHelpRecordData(
                                                        user:
                                                            currentUserReference,
                                                        dateStarted:
                                                            getCurrentTimestamp,
                                                        dateStartedString: functions
                                                            .pullDateFromTimeStamp(
                                                                getCurrentTimestamp),
                                                        helpType: 'Joy',
                                                        completed: false,
                                                      ),
                                                      discipleshipHelpRecordReference4);
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await ActivityLogRecord.collection
                                                  .doc()
                                                  .set(
                                                      createActivityLogRecordData(
                                                    activity:
                                                        'Selected Help for ${_model.choiceChipsValue}',
                                                    time: getCurrentTimestamp,
                                                    user:
                                                        currentUserDisplayName,
                                                    showUser: true,
                                                  ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                discipleshipHelpCurrent:
                                                    _model.newJoy!.reference,
                                                discipleshipHelpName: 'Joy',
                                              ));
                                            }
                                            if (_model.choiceChipsValue ==
                                                'Patience') {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var discipleshipHelpRecordReference5 =
                                                  DiscipleshipHelpRecord
                                                      .collection
                                                      .doc();
                                              await discipleshipHelpRecordReference5
                                                  .set(
                                                      createDiscipleshipHelpRecordData(
                                                user: currentUserReference,
                                                dateStarted:
                                                    getCurrentTimestamp,
                                                dateStartedString: functions
                                                    .pullDateFromTimeStamp(
                                                        getCurrentTimestamp),
                                                helpType: 'Patience',
                                                completed: false,
                                              ));
                                              _model.newPatience =
                                                  DiscipleshipHelpRecord
                                                      .getDocumentFromData(
                                                          createDiscipleshipHelpRecordData(
                                                            user:
                                                                currentUserReference,
                                                            dateStarted:
                                                                getCurrentTimestamp,
                                                            dateStartedString: functions
                                                                .pullDateFromTimeStamp(
                                                                    getCurrentTimestamp),
                                                            helpType:
                                                                'Patience',
                                                            completed: false,
                                                          ),
                                                          discipleshipHelpRecordReference5);
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await ActivityLogRecord.collection
                                                  .doc()
                                                  .set(
                                                      createActivityLogRecordData(
                                                    activity:
                                                        'Selected Help for ${_model.choiceChipsValue}',
                                                    time: getCurrentTimestamp,
                                                    user:
                                                        currentUserDisplayName,
                                                    showUser: true,
                                                  ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                discipleshipHelpCurrent: _model
                                                    .newPatience!.reference,
                                                discipleshipHelpName:
                                                    'Patience',
                                              ));
                                            }
                                            if (_model.choiceChipsValue ==
                                                'Gratitude') {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var discipleshipHelpRecordReference6 =
                                                  DiscipleshipHelpRecord
                                                      .collection
                                                      .doc();
                                              await discipleshipHelpRecordReference6
                                                  .set(
                                                      createDiscipleshipHelpRecordData(
                                                user: currentUserReference,
                                                dateStarted:
                                                    getCurrentTimestamp,
                                                dateStartedString: functions
                                                    .pullDateFromTimeStamp(
                                                        getCurrentTimestamp),
                                                helpType: 'Gratitude',
                                                completed: false,
                                              ));
                                              _model.newGratitude =
                                                  DiscipleshipHelpRecord
                                                      .getDocumentFromData(
                                                          createDiscipleshipHelpRecordData(
                                                            user:
                                                                currentUserReference,
                                                            dateStarted:
                                                                getCurrentTimestamp,
                                                            dateStartedString: functions
                                                                .pullDateFromTimeStamp(
                                                                    getCurrentTimestamp),
                                                            helpType:
                                                                'Gratitude',
                                                            completed: false,
                                                          ),
                                                          discipleshipHelpRecordReference6);
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await ActivityLogRecord.collection
                                                  .doc()
                                                  .set(
                                                      createActivityLogRecordData(
                                                    activity:
                                                        'Selected Help for ${_model.choiceChipsValue}',
                                                    time: getCurrentTimestamp,
                                                    user:
                                                        currentUserDisplayName,
                                                    showUser: true,
                                                  ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                discipleshipHelpCurrent: _model
                                                    .newGratitude!.reference,
                                                discipleshipHelpName:
                                                    'Gratitude',
                                              ));
                                            }
                                            if (_model.choiceChipsValue ==
                                                'Compassion') {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              var discipleshipHelpRecordReference7 =
                                                  DiscipleshipHelpRecord
                                                      .collection
                                                      .doc();
                                              await discipleshipHelpRecordReference7
                                                  .set(
                                                      createDiscipleshipHelpRecordData(
                                                user: currentUserReference,
                                                dateStarted:
                                                    getCurrentTimestamp,
                                                dateStartedString: functions
                                                    .pullDateFromTimeStamp(
                                                        getCurrentTimestamp),
                                                helpType: 'Compassion',
                                                completed: false,
                                              ));
                                              _model.newCompassion =
                                                  DiscipleshipHelpRecord
                                                      .getDocumentFromData(
                                                          createDiscipleshipHelpRecordData(
                                                            user:
                                                                currentUserReference,
                                                            dateStarted:
                                                                getCurrentTimestamp,
                                                            dateStartedString: functions
                                                                .pullDateFromTimeStamp(
                                                                    getCurrentTimestamp),
                                                            helpType:
                                                                'Compassion',
                                                            completed: false,
                                                          ),
                                                          discipleshipHelpRecordReference7);
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await ActivityLogRecord.collection
                                                  .doc()
                                                  .set(
                                                      createActivityLogRecordData(
                                                    activity:
                                                        'Selected Help for ${_model.choiceChipsValue}',
                                                    time: getCurrentTimestamp,
                                                    user:
                                                        currentUserDisplayName,
                                                    showUser: true,
                                                  ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                discipleshipHelpCurrent: _model
                                                    .newCompassion!.reference,
                                                discipleshipHelpName:
                                                    'Compassion',
                                              ));
                                            }
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed('Home');

                                            setState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'w0smw7iq' /* Submit */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 200.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 4.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'HELP_SHEET_COMP_CLOSE_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          var discipleshipHelpRecordReference =
                                              DiscipleshipHelpRecord.collection
                                                  .doc();
                                          await discipleshipHelpRecordReference
                                              .set(
                                                  createDiscipleshipHelpRecordData(
                                            user: currentUserReference,
                                            dateStarted: getCurrentTimestamp,
                                            dateStartedString:
                                                functions.pullDateFromTimeStamp(
                                                    getCurrentTimestamp),
                                            helpType: 'Cancel',
                                          ));
                                          _model.newCancel = DiscipleshipHelpRecord
                                              .getDocumentFromData(
                                                  createDiscipleshipHelpRecordData(
                                                    user: currentUserReference,
                                                    dateStarted:
                                                        getCurrentTimestamp,
                                                    dateStartedString: functions
                                                        .pullDateFromTimeStamp(
                                                            getCurrentTimestamp),
                                                    helpType: 'Cancel',
                                                  ),
                                                  discipleshipHelpRecordReference);
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            discipleshipHelpCurrent:
                                                _model.newCancel!.reference,
                                            discipleshipHelpName: 'Cancel',
                                          ));
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          setState(() {
                                            FFAppState().blur = false;
                                          });
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('Home');

                                          logFirebaseEvent(
                                              'Button_start_periodic_action');
                                          _model.discipleshipReminder =
                                              InstantTimer.periodic(
                                            duration: Duration(
                                                milliseconds: 604800000),
                                            callback: (timer) async {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                'discipleship_help_current':
                                                    FieldValue.delete(),
                                                'discipleship_help_name':
                                                    FieldValue.delete(),
                                              });
                                              logFirebaseEvent(
                                                  'Button_stop_periodic_action');
                                              _model.discipleshipReminder
                                                  ?.cancel();
                                            },
                                            startImmediately: false,
                                          );

                                          setState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'ltydup9q' /* Close */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 200.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .overlay,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          elevation: 4.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
