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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioPodcastWidget extends StatefulWidget {
  const AudioPodcastWidget({Key key}) : super(key: key);

  @override
  _AudioPodcastWidgetState createState() => _AudioPodcastWidgetState();
}

class _AudioPodcastWidgetState extends State<AudioPodcastWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'listViewOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1.025,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 800,
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
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AudioPodcast'});
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
              logFirebaseEvent('AUDIO_PODCAST_arrow_back_rounded_ICN_ON_');
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
                  height: 70,
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
              child: StreamBuilder<List<NonSermonPodcastRecord>>(
                stream: queryNonSermonPodcastRecord(
                  queryBuilder: (nonSermonPodcastRecord) =>
                      nonSermonPodcastRecord.orderBy('podcast_id',
                          descending: true),
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
                  List<NonSermonPodcastRecord>
                      listViewNonSermonPodcastRecordList = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewNonSermonPodcastRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewNonSermonPodcastRecord =
                          listViewNonSermonPodcastRecordList[listViewIndex];
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
                          showBadge: (currentUserDocument
                                      ?.nonSermonPodcastsWatched
                                      ?.toList() ??
                                  [])
                              .contains(
                                  listViewNonSermonPodcastRecord.podcastId),
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
                                    'AUDIO_PODCAST_PAGE_videoCard_ON_TAP');
                                logFirebaseEvent('videoCard_Launch-U-R-L');
                                await launchURL(
                                    listViewNonSermonPodcastRecord.podcastUrl);
                                logFirebaseEvent('videoCard_Backend-Call');

                                final usersUpdateData = {
                                  'non_sermon_podcasts_watched':
                                      FieldValue.arrayUnion([
                                    listViewNonSermonPodcastRecord.podcastId
                                  ]),
                                };
                                await currentUserReference
                                    .update(usersUpdateData);
                                logFirebaseEvent('videoCard_Backend-Call');

                                final activityLogCreateData =
                                    createActivityLogRecordData(
                                  activity:
                                      'User clicked on the non sermon podcast ${listViewNonSermonPodcastRecord.podcastName} to view it on the podcast page',
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.8, -0.35),
                                      child: Container(
                                        width: 55,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x230E151B),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: FaIcon(
                                          FontAwesomeIcons.solidPlayCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
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
                                            listViewNonSermonPodcastRecord
                                                .podcastName,
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
                                                listViewNonSermonPodcastRecord
                                                    .meta,
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
                  ).animated([
                    animationsMap['listViewOnPageLoadAnimation'],
                    animationsMap['listViewOnActionTriggerAnimation']
                  ]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
