import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'bible_study2_model.dart';
export 'bible_study2_model.dart';

class BibleStudy2Widget extends StatefulWidget {
  const BibleStudy2Widget({Key? key}) : super(key: key);

  @override
  _BibleStudy2WidgetState createState() => _BibleStudy2WidgetState();
}

class _BibleStudy2WidgetState extends State<BibleStudy2Widget>
    with TickerProviderStateMixin {
  late BibleStudy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BibleStudy2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bibleStudy2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BIBLE_STUDY2_bibleStudy2_ON_INIT_STATE');
      logFirebaseEvent('bibleStudy2_update_app_state');
      FFAppState().update(() {
        FFAppState().showChapterField = false;
        FFAppState().bookID = '';
      });
      logFirebaseEvent('bibleStudy2_update_app_state');
      FFAppState().update(() {
        FFAppState().showVerseField = false;
        FFAppState().chapterID = '';
      });
      logFirebaseEvent('bibleStudy2_update_app_state');
      FFAppState().update(() {
        FFAppState().showNext2 = false;
        FFAppState().showVerse = false;
      });
      logFirebaseEvent('bibleStudy2_update_app_state');
      FFAppState().update(() {
        FFAppState().showPrevVerses = false;
        FFAppState().verseNo = '';
      });
      logFirebaseEvent('bibleStudy2_update_app_state');
      FFAppState().update(() {
        FFAppState().verseID = 0;
        FFAppState().verseIDString = '';
      });
      logFirebaseEvent('bibleStudy2_update_app_state');
      FFAppState().update(() {
        FFAppState().verseRef = '';
        FFAppState().bibleStudyBook = '';
      });
      logFirebaseEvent('bibleStudy2_update_app_state');
      FFAppState().update(() {
        FFAppState().showResetButton = false;
        FFAppState().hideBookField = false;
      });
      logFirebaseEvent('bibleStudy2_refresh_database_request');
      setState(() => _model.apiRequestCompleter3 = null);
      await _model.waitForApiRequestCompleted3();
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        title: 'bibleStudy2',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                  logFirebaseEvent('BIBLE_STUDY2_PAGE_Icon_3dtpcuvm_ON_TAP');
                  logFirebaseEvent('Icon_navigate_to');

                  context.pushNamed('bibleStudy1');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StreamBuilder<List<BibleBookOverallRecord>>(
                    stream: queryBibleBookOverallRecord(
                      queryBuilder: (bibleBookOverallRecord) =>
                          bibleBookOverallRecord.orderBy('book_id'),
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
                      List<BibleBookOverallRecord>
                          containerBibleBookOverallRecordList = snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: AutoSizeText(
                                          FFLocalizations.of(context).getText(
                                            'togfuwmz' /* Read the text */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        percent: 0.25,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        lineHeight: 50.0,
                                        animation: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        backgroundColor: Color(0x3F95A1AC),
                                        center: Text(
                                          FFLocalizations.of(context).getText(
                                            '6fh6ddw0' /* 25% */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                        ),
                                        barRadius: Radius.circular(10.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'h5m621e1' /* Familiarize yourself with the ... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 20.0, 20.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'nngpe1ip' /* Select your verse: */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${FFAppState().bibleStudyBook} ${FFAppState().chapterID}:${FFAppState().verseNo}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 0.0),
                                child:
                                    StreamBuilder<List<BibleBookOverallRecord>>(
                                  stream: queryBibleBookOverallRecord(
                                    queryBuilder: (bibleBookOverallRecord) =>
                                        bibleBookOverallRecord.where('book_id',
                                            isEqualTo: FFAppState().bookIDInt),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    List<BibleBookOverallRecord>
                                        columnBibleBookOverallRecordList =
                                        snapshot.data!;
                                    final columnBibleBookOverallRecord =
                                        columnBibleBookOverallRecordList
                                                .isNotEmpty
                                            ? columnBibleBookOverallRecordList
                                                .first
                                            : null;
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (!FFAppState().hideBookField)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: FutureBuilder<
                                                  List<BibleBookOverallRecord>>(
                                                future:
                                                    queryBibleBookOverallRecordOnce(
                                                  queryBuilder:
                                                      (bibleBookOverallRecord) =>
                                                          bibleBookOverallRecord.where(
                                                              'book_name',
                                                              isEqualTo: _model
                                                                  .dropDownForBooksValue),
                                                  singleRecord: true,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<BibleBookOverallRecord>
                                                      bookRowBibleBookOverallRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final bookRowBibleBookOverallRecord =
                                                      bookRowBibleBookOverallRecordList
                                                              .isNotEmpty
                                                          ? bookRowBibleBookOverallRecordList
                                                              .first
                                                          : null;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownForBooksValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options:
                                                              containerBibleBookOverallRecordList
                                                                  .map((e) => e
                                                                      .bookName)
                                                                  .toList(),
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.dropDownForBooksValue =
                                                                      val),
                                                          width: 180.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '4cd2722d' /* Pick a Book then click -> */,
                                                          ),
                                                          fillColor:
                                                              Colors.white,
                                                          elevation: 4.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .black600,
                                                          borderWidth: 2.0,
                                                          borderRadius: 0.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
                                                        borderRadius: 0.0,
                                                        borderWidth: 2.0,
                                                        buttonSize: 50.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        icon: Icon(
                                                          Icons.arrow_forward,
                                                          color: Colors.white,
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'BIBLE_STUDY2_PAGE_BookButtonArrow_ON_TAP');
                                                          logFirebaseEvent(
                                                              'BookButtonArrow_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .bookID =
                                                                bookRowBibleBookOverallRecord!
                                                                    .bookId
                                                                    .toString();
                                                            FFAppState()
                                                                    .bibleStudyBook =
                                                                bookRowBibleBookOverallRecord!
                                                                    .bookName;
                                                          });
                                                          logFirebaseEvent(
                                                              'BookButtonArrow_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .lexiconPrefix =
                                                                bookRowBibleBookOverallRecord!
                                                                    .lexiconPrefix;
                                                            FFAppState()
                                                                    .showChapterField =
                                                                true;
                                                          });
                                                          logFirebaseEvent(
                                                              'BookButtonArrow_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .hideBookField =
                                                                true;
                                                          });
                                                          logFirebaseEvent(
                                                              'BookButtonArrow_refresh_database_request');
                                                          setState(() => _model
                                                                  .apiRequestCompleter2 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted2();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          if (FFAppState().showChapterField)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: (_model
                                                            .apiRequestCompleter2 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(
                                                              GetNumberOfChaptersKJVCall
                                                                  .call(
                                                            bookId: FFAppState()
                                                                .bookID,
                                                          )))
                                                    .future,
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final chapterRowGetNumberOfChaptersKJVResponse =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownForChaptersValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: functions
                                                              .getNumbersforChapterCount(
                                                                  GetNumberOfChaptersKJVCall
                                                                      .chapterCount(
                                                                chapterRowGetNumberOfChaptersKJVResponse
                                                                    .jsonBody,
                                                              ))
                                                              .map((e) =>
                                                                  e.toString())
                                                              .toList(),
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.dropDownForChaptersValue =
                                                                      val),
                                                          width: 180.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'og22ta4s' /* Pick a Chapter then click -> */,
                                                          ),
                                                          fillColor:
                                                              Colors.white,
                                                          elevation: 4.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .black600,
                                                          borderWidth: 2.0,
                                                          borderRadius: 0.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
                                                        borderRadius: 0.0,
                                                        borderWidth: 2.0,
                                                        buttonSize: 50.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        icon: Icon(
                                                          Icons.arrow_forward,
                                                          color: Colors.white,
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'BIBLE_STUDY2_arrow_forward_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .chapterID =
                                                                _model
                                                                    .dropDownForChaptersValue!;
                                                            FFAppState()
                                                                    .showVerseField =
                                                                true;
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .bookIDInt =
                                                                functions.convertStringtoInteger(
                                                                    FFAppState()
                                                                        .bookID);
                                                            FFAppState()
                                                                    .chapterIDInt =
                                                                functions.convertStringtoInteger(
                                                                    FFAppState()
                                                                        .chapterID);
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .showChapterField =
                                                                false;
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_refresh_database_request');
                                                          setState(() => _model
                                                                  .apiRequestCompleter1 =
                                                              null);
                                                          await _model
                                                              .waitForApiRequestCompleted1();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          if (FFAppState().showVerseField)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: (_model
                                                            .apiRequestCompleter1 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(
                                                              GetBibleChaptersKJVCall
                                                                  .call(
                                                            bookId: FFAppState()
                                                                .bookIDInt,
                                                            chapterId:
                                                                FFAppState()
                                                                    .chapterIDInt,
                                                            versionId: 'kjv',
                                                          )))
                                                    .future,
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final verseRowGetBibleChaptersKJVResponse =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownForVersesValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: (GetBibleChaptersKJVCall
                                                                  .verseNo(
                                                            verseRowGetBibleChaptersKJVResponse
                                                                .jsonBody,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList()!,
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.dropDownForVersesValue =
                                                                      val),
                                                          width: 180.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'eeypv66d' /* Pick a Verse then click -> */,
                                                          ),
                                                          fillColor:
                                                              Colors.white,
                                                          elevation: 4.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .black600,
                                                          borderWidth: 2.0,
                                                          borderRadius: 0.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
                                                        borderRadius: 0.0,
                                                        borderWidth: 2.0,
                                                        buttonSize: 50.0,
                                                        fillColor:
                                                            Color(0xFF199800),
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .check,
                                                          color: Colors.white,
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'BIBLE_STUDY2_PAGE_check_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .verseIDString =
                                                                '${functions.twoDigitBookIDforString(FFAppState().bookID)}${functions.createThreeDigitVerseId(FFAppState().chapterIDInt)}${functions.threeDigitVerseIDforString(functions.threeDigitVerseIDforString(_model.dropDownForVersesValue))}';
                                                            FFAppState()
                                                                    .verseRef =
                                                                '${FFAppState().bibleStudyBook} ${FFAppState().chapterIDInt.toString()}:${_model.dropDownForVersesValue}';
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .verseNo =
                                                                _model
                                                                    .dropDownForVersesValue!;
                                                            FFAppState()
                                                                    .showNext2 =
                                                                true;
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .showPrevVerses =
                                                                true;
                                                          });
                                                          logFirebaseEvent(
                                                              'IconButton_refresh_database_request');
                                                          setState(() => _model
                                                                  .apiRequestCompleter3 =
                                                              null);
                                                          logFirebaseEvent(
                                                              'IconButton_haptic_feedback');
                                                          HapticFeedback
                                                              .heavyImpact();
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');

                                                          await ActivityLogRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createActivityLogRecordData(
                                                                activity:
                                                                    'Study: Verse Inq - ${FFAppState().verseRef}',
                                                                time:
                                                                    getCurrentTimestamp,
                                                                user:
                                                                    currentUserDisplayName,
                                                                showUser: true,
                                                              ));
                                                          logFirebaseEvent(
                                                              'IconButton_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .showVerseField =
                                                                false;
                                                            FFAppState()
                                                                    .showResetButton =
                                                                true;
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          if (FFAppState().showResetButton)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'BIBLE_STUDY2_PAGE_RESET_VERSE_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .hideBookField =
                                                              false;
                                                          FFAppState()
                                                                  .showResetButton =
                                                              false;
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .bibleStudyBook = '';
                                                          FFAppState()
                                                              .chapterID = '';
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .verseIDString = '';
                                                          FFAppState()
                                                                  .showNext2 =
                                                              false;
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        FFAppState().update(() {
                                                          FFAppState().verseNo =
                                                              '';
                                                        });
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'qx987paf' /* Reset Verse */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 4.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 4.0,
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 5.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE8602F),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFE8602F),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: (_model
                                                          .apiRequestCompleter3 ??=
                                                      Completer<
                                                          ApiCallResponse>()
                                                        ..complete(
                                                            GetBibleVerseKJVCall
                                                                .call(
                                                          verseId: FFAppState()
                                                              .verseIDString,
                                                          versionId: 'kjv',
                                                        )))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final rowWithTextGetBibleVerseKJVResponse =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (FFAppState().showNext2)
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      AutoSizeText(
                                                                    GetBibleVerseKJVCall
                                                                        .text(
                                                                      rowWithTextGetBibleVerseKJVResponse
                                                                          .jsonBody,
                                                                    ).toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'BIBLE_STUDY2_PAGE_PREVIOUS_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context.pushNamed(
                                                                          'bibleStudy1');
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'wvxrdk7q' /* Previous */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_left,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          130.0,
                                                                      height:
                                                                          50.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                      elevation:
                                                                          4.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'BIBLE_STUDY2_PAGE_NEXT_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().verseText =
                                                                            GetBibleVerseKJVCall.text(
                                                                          rowWithTextGetBibleVerseKJVResponse
                                                                              .jsonBody,
                                                                        ).toString();
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Button_alert_dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Attention'),
                                                                                content: Text('Do you want to create a Bible study note for this verse?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('No'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Yes'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        var bibleStudyNotesRecordReference = BibleStudyNotesRecord
                                                                            .collection
                                                                            .doc();
                                                                        await bibleStudyNotesRecordReference
                                                                            .set(createBibleStudyNotesRecordData(
                                                                          user:
                                                                              currentUserReference,
                                                                          verseReference:
                                                                              FFAppState().verseRef,
                                                                          verseText:
                                                                              FFAppState().verseText,
                                                                        ));
                                                                        _model.newBibleStudyNote = BibleStudyNotesRecord.getDocumentFromData(
                                                                            createBibleStudyNotesRecordData(
                                                                              user: currentUserReference,
                                                                              verseReference: FFAppState().verseRef,
                                                                              verseText: FFAppState().verseText,
                                                                            ),
                                                                            bibleStudyNotesRecordReference);
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().bibleStudyNoteCreated =
                                                                              true;
                                                                          FFAppState().bibleStudyDoc = _model
                                                                              .newBibleStudyNote!
                                                                              .reference;
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await ActivityLogRecord
                                                                            .collection
                                                                            .doc()
                                                                            .set(createActivityLogRecordData(
                                                                              activity: 'Creates Bible Note for ${FFAppState().verseRef}',
                                                                              time: getCurrentTimestamp,
                                                                              user: currentUserDisplayName,
                                                                              showUser: true,
                                                                              bibleStudyDoc: _model.newBibleStudyNote!.reference,
                                                                            ));
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().bibleStudyNoteCreated =
                                                                              false;
                                                                        });
                                                                      }

                                                                      logFirebaseEvent(
                                                                          'Button_haptic_feedback');
                                                                      HapticFeedback
                                                                          .selectionClick();
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context.pushNamed(
                                                                          'bibleStudy3');

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      't2pkot84' /* Next */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          130.0,
                                                                      height:
                                                                          50.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                      elevation:
                                                                          4.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (FFAppState().showPrevVerses)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 0.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'y750bgjr' /* Previous notes on this verse */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (FFAppState().showPrevVerses)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: StreamBuilder<
                                                            List<
                                                                BibleStudyNotesRecord>>(
                                                          stream:
                                                              queryBibleStudyNotesRecord(
                                                            queryBuilder: (bibleStudyNotesRecord) => bibleStudyNotesRecord
                                                                .where('user',
                                                                    isEqualTo:
                                                                        currentUserReference)
                                                                .where(
                                                                    'verse_reference',
                                                                    isEqualTo:
                                                                        FFAppState()
                                                                            .verseRef),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<BibleStudyNotesRecord>
                                                                gridViewBibleStudyNotesRecordList =
                                                                snapshot.data!;
                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    3,
                                                                crossAxisSpacing:
                                                                    10.0,
                                                                mainAxisSpacing:
                                                                    10.0,
                                                                childAspectRatio:
                                                                    1.0,
                                                              ),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  gridViewBibleStudyNotesRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  gridViewIndex) {
                                                                final gridViewBibleStudyNotesRecord =
                                                                    gridViewBibleStudyNotesRecordList[
                                                                        gridViewIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                        'BIBLE_STUDY2_Container_bvi3snnm_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'bibleStudyNotes',
                                                                      queryParameters:
                                                                          {
                                                                        'bibleStudyRef':
                                                                            serializeParam(
                                                                          gridViewBibleStudyNotesRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        4.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          20.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFF1F4F8),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.stickyNote,
                                                                              color: Colors.black,
                                                                              size: 24.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                                                                              child: Text(
                                                                                gridViewBibleStudyNotesRecord.verseReference,
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: FlutterFlowTheme.of(context).black600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation']!);
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'p0sq1hrn' /*   */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
