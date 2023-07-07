import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/broadcast_name/broadcast_name_widget.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'broadcast_listing_model.dart';
export 'broadcast_listing_model.dart';

class BroadcastListingWidget extends StatefulWidget {
  const BroadcastListingWidget({Key? key}) : super(key: key);

  @override
  _BroadcastListingWidgetState createState() => _BroadcastListingWidgetState();
}

class _BroadcastListingWidgetState extends State<BroadcastListingWidget> {
  late BroadcastListingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BroadcastListingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BroadcastListing'});
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
        title: 'Live Video',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              logFirebaseEvent('BROADCAST_LISTING_FloatingActionButton_i');
              logFirebaseEvent('FloatingActionButton_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: Container(
                      height: 400.0,
                      child: BroadcastNameWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.video_call,
            ),
            elevation: 8.0,
            label: Text(
              FFLocalizations.of(context).getText(
                'ymwhr6u7' /* Start Broadcast */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lato',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
            ),
          ),
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
                  logFirebaseEvent('BROADCAST_LISTING_Icon_lhnm6722_ON_TAP');
                  logFirebaseEvent('Icon_navigate_back');
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  size: 24.0,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'BROADCAST_LISTING_Icon_vgn95y54_ON_TAP');
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: FutureBuilder<List<MiscRecord>>(
                future: queryMiscRecordOnce(
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
                  List<MiscRecord> mainContainerMiscRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final mainContainerMiscRecord =
                      mainContainerMiscRecordList.isNotEmpty
                          ? mainContainerMiscRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 32.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1u9xzuov' /* Videos */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<LiveVideoRecord>>(
                                          stream: queryLiveVideoRecord(
                                            queryBuilder: (liveVideoRecord) =>
                                                liveVideoRecord.orderBy('time',
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
                                            List<LiveVideoRecord>
                                                listViewLiveVideoRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewLiveVideoRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewLiveVideoRecord =
                                                    listViewLiveVideoRecordList[
                                                        listViewIndex];
                                                return Padding(
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
                                                          'BROADCAST_LISTING_Container_wer58vaj_ON_');
                                                      if (listViewLiveVideoRecord
                                                          .isLive) {
                                                        logFirebaseEvent(
                                                            'Container_navigate_to');

                                                        context.pushNamed(
                                                          'ViewBroadcast',
                                                          queryParameters: {
                                                            'url':
                                                                serializeParam(
                                                              listViewLiveVideoRecord
                                                                  .url,
                                                              ParamType.String,
                                                            ),
                                                            'broadcastName':
                                                                serializeParam(
                                                              listViewLiveVideoRecord
                                                                  .name,
                                                              ParamType.String,
                                                            ),
                                                            'videoId':
                                                                serializeParam(
                                                              listViewLiveVideoRecord
                                                                  .videoId,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_backend_call');
                                                        _model.apiResultul4 =
                                                            await GetLiveStreamIdCall
                                                                .call(
                                                          playbackId:
                                                              valueOrDefault<
                                                                  String>(
                                                            functions
                                                                .getPlaybackIdFromUrl(
                                                                    listViewLiveVideoRecord
                                                                        .url),
                                                            'getPlaybackIdFromUrlResult',
                                                          ),
                                                        );
                                                        if ((_model.apiResultul4
                                                                ?.succeeded ??
                                                            true)) {
                                                          logFirebaseEvent(
                                                              'Container_backend_call');
                                                          _model.apiResult7q2 =
                                                              await GetPastLiveStreamCall
                                                                  .call(
                                                            streamId:
                                                                GetLiveStreamIdCall
                                                                    .streamId(
                                                              (_model.apiResultul4
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString(),
                                                          );
                                                          if ((_model
                                                                  .apiResult7q2
                                                                  ?.succeeded ??
                                                              true)) {
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                              'ViewBroadcast',
                                                              queryParameters: {
                                                                'url':
                                                                    serializeParam(
                                                                  functions.createUrlFromPlaybackId(
                                                                      GetPastLiveStreamCall
                                                                          .playbackId(
                                                                    (_model.apiResult7q2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString()),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'broadcastName':
                                                                    serializeParam(
                                                                  listViewLiveVideoRecord
                                                                      .name,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'videoId':
                                                                    serializeParam(
                                                                  listViewLiveVideoRecord
                                                                      .videoId,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_alert_dialog');
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Failed'),
                                                                  content: Text(
                                                                      'Failed at getPastLiveStream'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Failed'),
                                                                content: Text(
                                                                    'Failed at getLiveStreamId'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 64.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
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
                                                                          listViewLiveVideoRecord
                                                                              .name,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).headlineSmall,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              'relative',
                                                                              listViewLiveVideoRecord.time!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelSmall,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (listViewLiveVideoRecord
                                                                      .isLive)
                                                                    FaIcon(
                                                                      FontAwesomeIcons
                                                                          .broadcastTower,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (!(currentUserDocument
                                                                        ?.liveStreamsViewed
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    listViewLiveVideoRecord
                                                                        .videoId))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFDF3F3F),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(7.0),
                                                                        topLeft:
                                                                            Radius.circular(7.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.5,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'sdinch0n' /* NEW */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Lato',
                                                                              color: Colors.white,
                                                                              fontSize: 12.0,
                                                                            ),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
