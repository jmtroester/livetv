import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FullSermonVideosCopyWidget extends StatefulWidget {
  const FullSermonVideosCopyWidget({Key key}) : super(key: key);

  @override
  _FullSermonVideosCopyWidgetState createState() =>
      _FullSermonVideosCopyWidgetState();
}

class _FullSermonVideosCopyWidgetState extends State<FullSermonVideosCopyWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 800,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(50, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FullSermonVideosCopy'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              logFirebaseEvent('FULL_SERMON_VIDEOS_COPY_arrow_back_round');
              logFirebaseEvent('IconButton_Navigate-Back');
              context.pop();
            },
          ),
          flexibleSpace: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Image.asset(
                  'assets/images/LiveTV_Logo_White.png',
                  width: 150,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
              child: FutureBuilder<ApiCallResponse>(
                future: FullSermonsCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitWave(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  final listViewFullSermonsResponse = snapshot.data;
                  return Builder(
                    builder: (context) {
                      final fullSermons = getJsonField(
                            (listViewFullSermonsResponse?.jsonBody ?? ''),
                            r'''$.data''',
                          )?.toList() ??
                          [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: fullSermons.length,
                        itemBuilder: (context, fullSermonsIndex) {
                          final fullSermonsItem = fullSermons[fullSermonsIndex];
                          return AuthUserStreamWidget(
                            child: Badge(
                              badgeContent: Text(
                                'NEW',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              showBadge: !((currentUserDocument?.sermonsWatched
                                          ?.toList() ??
                                      [])
                                  .contains(getJsonField(
                                fullSermonsItem,
                                r'''$.video_id''',
                              ))),
                              shape: BadgeShape.circle,
                              badgeColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              elevation: 4,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              position: BadgePosition.topEnd(),
                              animationType: BadgeAnimationType.scale,
                              toAnimate: true,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'FULL_SERMON_VIDEOS_COPY_videoCard_ON_TAP');
                                    logFirebaseEvent('videoCard_Navigate-To');
                                    context.pushNamed(
                                      'videoPage',
                                      queryParams: {
                                        'videoLink': serializeParam(
                                            getJsonField(
                                              fullSermonsItem,
                                              r'''$.video_link''',
                                            ),
                                            ParamType.String),
                                        'videoName': serializeParam(
                                            getJsonField(
                                              fullSermonsItem,
                                              r'''$.sermon_name''',
                                            ).toString(),
                                            ParamType.String),
                                        'audioLink': serializeParam(
                                            getJsonField(
                                              fullSermonsItem,
                                              r'''$.audio_link''',
                                            ).toString(),
                                            ParamType.String),
                                      }.withoutNulls,
                                    );
                                    logFirebaseEvent('videoCard_Backend-Call');

                                    final usersUpdateData = {
                                      'sermons_watched': FieldValue.arrayUnion([
                                        getJsonField(
                                          fullSermonsItem,
                                          r'''$.video_id''',
                                        )
                                      ]),
                                    };
                                    await currentUserReference
                                        .update(usersUpdateData);
                                    logFirebaseEvent('videoCard_Backend-Call');

                                    final activityLogCreateData =
                                        createActivityLogRecordData(
                                      activity:
                                          'User clicked on Full Sermon ${getJsonField(
                                        fullSermonsItem,
                                        r'''$.sermon_nam''',
                                      ).toString()} to navigate to the video specific screen to watch',
                                      time: getCurrentTimestamp,
                                      user: currentUserDisplayName,
                                    );
                                    await ActivityLogRecord.collection
                                        .doc()
                                        .set(activityLogCreateData);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x230E151B),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(0),
                                          ),
                                          child: Image.network(
                                            'https://api.flotiq.com/image/0x0/${functions.alterURL(getJsonField(
                                              fullSermonsItem,
                                              r'''$.sermon_thumbnail[:].dataUrl''',
                                            ).toString())}.webp',
                                            width: 160,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.9, 0.85),
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x230E151B),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  170, 0, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                getJsonField(
                                                  fullSermonsItem,
                                                  r'''$.sermon_name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AutoSizeText(
                                                    getJsonField(
                                                      fullSermonsItem,
                                                      r'''$.text''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animated([
                                  animationsMap['containerOnPageLoadAnimation']
                                ]),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
