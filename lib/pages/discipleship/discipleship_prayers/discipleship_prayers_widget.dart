import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'discipleship_prayers_model.dart';
export 'discipleship_prayers_model.dart';

class DiscipleshipPrayersWidget extends StatefulWidget {
  const DiscipleshipPrayersWidget({Key? key}) : super(key: key);

  @override
  _DiscipleshipPrayersWidgetState createState() =>
      _DiscipleshipPrayersWidgetState();
}

class _DiscipleshipPrayersWidgetState extends State<DiscipleshipPrayersWidget> {
  late DiscipleshipPrayersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscipleshipPrayersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'discipleshipPrayers'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DISCIPLESHIP_PRAYERS_discipleshipPrayers');
      logFirebaseEvent('discipleshipPrayers_backend_call');

      await ActivityLogRecord.collection.doc().set(createActivityLogRecordData(
            activity: 'Prayers',
            time: getCurrentTimestamp,
            user: currentUserDisplayName,
            showUser: true,
          ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'discipleshipPrayers',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            endDrawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.endDrawerModel,
                updateCallback: () => setState(() {}),
                child: EndDrawerWidget(),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'DISCIPLESHIP_PRAYERS_Icon_2ntqavzq_ON_TA');
                    logFirebaseEvent('Icon_navigate_back');
                    context.pop();
                    logFirebaseEvent('Icon_haptic_feedback');
                    HapticFeedback.selectionClick();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'DISCIPLESHIP_PRAYERS_Icon_60sgo1q0_ON_TA');
                        logFirebaseEvent('Icon_drawer');
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: Icon(
                        Icons.settings_outlined,
                        color: Color(0xFFE8602F),
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/LiveTV_Logo_White.png',
                      width: 150.0,
                      height: 100.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7.0,
                        color: Color(0x2F1D2429),
                        offset: Offset(0.0, 3.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'zgqguwus' /* Prayers */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<PrayersRecord>>(
                                        stream: queryPrayersRecord(
                                          queryBuilder: (prayersRecord) =>
                                              prayersRecord
                                                  .where('is_public',
                                                      isEqualTo: true)
                                                  .orderBy('time_submitted',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PrayersRecord>
                                              listViewPrayersRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listViewPrayersRecordList
                                                .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewPrayersRecord =
                                                  listViewPrayersRecordList[
                                                      listViewIndex];
                                              return Visibility(
                                                visible: !functions
                                                    .checkToSeeIfDateIsBehindAnother(
                                                        listViewPrayersRecord
                                                            .expiration,
                                                        getCurrentTimestamp),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'DISCIPLESHIP_PRAYERS_Container_i1p562sp_');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'viewPrayer',
                                                        queryParameters: {
                                                          'prayerRef':
                                                              serializeParam(
                                                            listViewPrayersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      logFirebaseEvent(
                                                          'Container_backend_call');

                                                      await ActivityLogRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createActivityLogRecordData(
                                                            activity:
                                                                'Viewed Prayer for ${listViewPrayersRecord.userDisplayName}',
                                                            time:
                                                                getCurrentTimestamp,
                                                            user:
                                                                currentUserDisplayName,
                                                            showUser: true,
                                                            prayer:
                                                                listViewPrayersRecord
                                                                    .reference,
                                                          ));
                                                      logFirebaseEvent(
                                                          'Container_haptic_feedback');
                                                      HapticFeedback
                                                          .selectionClick();
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 64.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: () {
                                                            if (listViewPrayersRecord
                                                                    .prayedForBy
                                                                    .contains(
                                                                        currentUserReference) &&
                                                                functions.checkToSeeIfDateIsBehindAnother(
                                                                    getCurrentTimestamp,
                                                                    listViewPrayersRecord
                                                                        .expiration)) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            } else if (listViewPrayersRecord
                                                                    .prayedForBy
                                                                    .contains(
                                                                        currentUserReference) &&
                                                                functions.checkToSeeIfDateIsBehindAnother(
                                                                    listViewPrayersRecord
                                                                        .expiration,
                                                                    getCurrentTimestamp)) {
                                                              return Color(
                                                                  0xFFFF0000);
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon;
                                                            }
                                                          }(),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: () {
                                                                  if (listViewPrayersRecord
                                                                          .prayedForBy
                                                                          .contains(
                                                                              currentUserReference) &&
                                                                      functions.checkToSeeIfDateIsBehindAnother(
                                                                          getCurrentTimestamp,
                                                                          listViewPrayersRecord
                                                                              .expiration)) {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary;
                                                                  } else if (listViewPrayersRecord
                                                                          .prayedForBy
                                                                          .contains(
                                                                              currentUserReference) &&
                                                                      functions.checkToSeeIfDateIsBehindAnother(
                                                                          listViewPrayersRecord
                                                                              .expiration,
                                                                          getCurrentTimestamp)) {
                                                                    return Color(
                                                                        0xFFFF0000);
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor;
                                                                  }
                                                                }(),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .prayingHands,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    listViewPrayersRecord
                                                                        .userDisplayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Prayed for by ${listViewPrayersRecord.prayedForBy.length.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          if (listViewPrayersRecord
                                                                  .user ==
                                                              currentUserReference)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'DISCIPLESHIP_PRAYERS_Icon_1n58m73e_ON_TA');
                                                                  logFirebaseEvent(
                                                                      'Icon_haptic_feedback');
                                                                  HapticFeedback
                                                                      .heavyImpact();
                                                                  logFirebaseEvent(
                                                                      'Icon_alert_dialog');
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Are you sure?'),
                                                                                content: Text('This action of deleting cannot be undone.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Confirm'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');
                                                                    await listViewPrayersRecord
                                                                        .reference
                                                                        .delete();
                                                                    return;
                                                                  } else {
                                                                    return;
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            ),
                                                          if (listViewPrayersRecord
                                                                  .user !=
                                                              currentUserReference)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .keyboard_arrow_right_outlined,
                                                                color: Colors
                                                                    .black,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<PrayersRecord>>(
                                        stream: queryPrayersRecord(
                                          queryBuilder: (prayersRecord) =>
                                              prayersRecord
                                                  .where('is_public',
                                                      isEqualTo: true)
                                                  .orderBy('time_submitted',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PrayersRecord>
                                              listViewPrayersRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listViewPrayersRecordList
                                                .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewPrayersRecord =
                                                  listViewPrayersRecordList[
                                                      listViewIndex];
                                              return Visibility(
                                                visible: functions
                                                        .checkToSeeIfDateIsBehindAnother(
                                                            listViewPrayersRecord
                                                                .expiration,
                                                            getCurrentTimestamp) &&
                                                    (listViewPrayersRecord
                                                            .user ==
                                                        currentUserReference) &&
                                                    functions.checkToSeeIfDateIsBehindAnother(
                                                        getCurrentTimestamp,
                                                        functions.add14Days(
                                                            listViewPrayersRecord
                                                                .expiration)),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'DISCIPLESHIP_PRAYERS_Container_ptuh6nq7_');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'viewPrayer',
                                                        queryParameters: {
                                                          'prayerRef':
                                                              serializeParam(
                                                            listViewPrayersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      logFirebaseEvent(
                                                          'Container_haptic_feedback');
                                                      HapticFeedback
                                                          .selectionClick();
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 64.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: () {
                                                            if (listViewPrayersRecord
                                                                    .prayedForBy
                                                                    .contains(
                                                                        currentUserReference) &&
                                                                functions.checkToSeeIfDateIsBehindAnother(
                                                                    getCurrentTimestamp,
                                                                    listViewPrayersRecord
                                                                        .expiration)) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            } else if (listViewPrayersRecord
                                                                    .prayedForBy
                                                                    .contains(
                                                                        currentUserReference) &&
                                                                functions.checkToSeeIfDateIsBehindAnother(
                                                                    listViewPrayersRecord
                                                                        .expiration,
                                                                    getCurrentTimestamp)) {
                                                              return Color(
                                                                  0xFFFF0000);
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon;
                                                            }
                                                          }(),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: () {
                                                                  if (listViewPrayersRecord
                                                                          .prayedForBy
                                                                          .contains(
                                                                              currentUserReference) &&
                                                                      functions.checkToSeeIfDateIsBehindAnother(
                                                                          getCurrentTimestamp,
                                                                          listViewPrayersRecord
                                                                              .expiration)) {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary;
                                                                  } else if (listViewPrayersRecord
                                                                          .prayedForBy
                                                                          .contains(
                                                                              currentUserReference) &&
                                                                      functions.checkToSeeIfDateIsBehindAnother(
                                                                          listViewPrayersRecord
                                                                              .expiration,
                                                                          getCurrentTimestamp)) {
                                                                    return Color(
                                                                        0xFFFF0000);
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor;
                                                                  }
                                                                }(),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .prayingHands,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    listViewPrayersRecord
                                                                        .userDisplayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Prayed for by ${listViewPrayersRecord.prayedForBy.length.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_right_outlined,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                          if (functions.checkToSeeIfDateIsBehindAnother(
                                                              listViewPrayersRecord
                                                                  .expiration,
                                                              getCurrentTimestamp))
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'DISCIPLESHIP_PRAYERS_Container_c5h8fgtx_');
                                                                logFirebaseEvent(
                                                                    'Container_backend_call');

                                                                await listViewPrayersRecord
                                                                    .reference
                                                                    .update(
                                                                        createPrayersRecordData(
                                                                  expiration: functions
                                                                      .add14Days(
                                                                          getCurrentTimestamp),
                                                                ));
                                                                logFirebaseEvent(
                                                                    'Container_alert_dialog');
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Success'),
                                                                      content: Text(
                                                                          'Your prayer has been renewed'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Close'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                logFirebaseEvent(
                                                                    'Container_backend_call');

                                                                await ActivityLogRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createActivityLogRecordData(
                                                                      activity:
                                                                          'Prayer Renewed',
                                                                      time:
                                                                          getCurrentTimestamp,
                                                                      user:
                                                                          currentUserDisplayName,
                                                                      showUser:
                                                                          true,
                                                                      prayer: listViewPrayersRecord
                                                                          .reference,
                                                                    ));
                                                                logFirebaseEvent(
                                                                    'Container_haptic_feedback');
                                                                HapticFeedback
                                                                    .selectionClick();
                                                              },
                                                              child: Container(
                                                                width: 80.0,
                                                                height: 64.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '5zoatio3' /* Expired

Do you want to renew? */
                                                                      ,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              10.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
