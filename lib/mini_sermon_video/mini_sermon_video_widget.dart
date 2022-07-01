import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniSermonVideoWidget extends StatefulWidget {
  const MiniSermonVideoWidget({Key key}) : super(key: key);

  @override
  _MiniSermonVideoWidgetState createState() => _MiniSermonVideoWidgetState();
}

class _MiniSermonVideoWidgetState extends State<MiniSermonVideoWidget>
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
        parameters: {'screen_name': 'MiniSermonVideo'});
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
              logFirebaseEvent('MINI_SERMON_VIDEO_arrow_back_rounded_ICN');
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
              child: StreamBuilder<List<FrontVideosRecord>>(
                stream: queryFrontVideosRecord(
                  queryBuilder: (frontVideosRecord) =>
                      frontVideosRecord.orderBy('video_id', descending: true),
                ),
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
                  List<FrontVideosRecord> listViewFrontVideosRecordList =
                      snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewFrontVideosRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewFrontVideosRecord =
                          listViewFrontVideosRecordList[listViewIndex];
                      return AuthUserStreamWidget(
                        child: Badge(
                          badgeContent: Text(
                            'NEW',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                          ),
                          showBadge:
                              !((currentUserDocument?.shortsWatched?.toList() ??
                                      [])
                                  .contains(listViewFrontVideosRecord.videoId)),
                          shape: BadgeShape.circle,
                          badgeColor: FlutterFlowTheme.of(context).primaryColor,
                          elevation: 4,
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          position: BadgePosition.topEnd(),
                          animationType: BadgeAnimationType.scale,
                          toAnimate: true,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'MINI_SERMON_VIDEO_PAGE_videoCard_ON_TAP');
                                logFirebaseEvent('videoCard_Navigate-To');
                                context.pushNamed(
                                  'videoPage',
                                  queryParams: {
                                    'videoLink': serializeParam(
                                        listViewFrontVideosRecord.videoLink,
                                        ParamType.String),
                                    'videoName': serializeParam(
                                        listViewFrontVideosRecord.videoName,
                                        ParamType.String),
                                    'videoURL': serializeParam(
                                        listViewFrontVideosRecord.urlString,
                                        ParamType.String),
                                  }.withoutNulls,
                                );
                                logFirebaseEvent('videoCard_Backend-Call');

                                final usersUpdateData = {
                                  'shorts_watched': FieldValue.arrayUnion(
                                      [listViewFrontVideosRecord.videoId]),
                                };
                                await currentUserReference
                                    .update(usersUpdateData);
                                logFirebaseEvent('videoCard_Backend-Call');

                                final activityLogCreateData =
                                    createActivityLogRecordData(
                                  activity:
                                      'Mini-Sermon - ${listViewFrontVideosRecord.videoName}',
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
                                        listViewFrontVideosRecord
                                            .videoThumbnail,
                                        width: 120,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          130, 0, 12, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewFrontVideosRecord.videoName,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                listViewFrontVideosRecord
                                                    .videoLength,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
