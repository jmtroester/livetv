import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniSermonVideosOldWidget extends StatefulWidget {
  const MiniSermonVideosOldWidget({Key key}) : super(key: key);

  @override
  _MiniSermonVideosOldWidgetState createState() =>
      _MiniSermonVideosOldWidgetState();
}

class _MiniSermonVideosOldWidgetState extends State<MiniSermonVideosOldWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MiniSermonVideos_old'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async {
              logFirebaseEvent('MINI_SERMON_VIDEOS_OLD_Icon_ebxltis5_ON_');
              logFirebaseEvent('Icon_Navigate-Back');
              context.pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 24,
            ),
          ),
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Image.asset(
              'assets/images/LiveTV_Logo_White.png',
              width: 150,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('MINI_SERMON_VIDEOS_OLD_Icon_m7m1ktch_ON_');
                  logFirebaseEvent('Icon_Drawer');
                  scaffoldKey.currentState.openEndDrawer();
                },
                child: Icon(
                  Icons.settings_outlined,
                  color: Color(0xFFE8602F),
                  size: 30,
                ),
              ),
            ),
          ],
          elevation: 2,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          elevation: 16,
          child: EndDrawerWidget(),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
              List<FrontVideosRecord> columnFrontVideosRecordList =
                  snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(columnFrontVideosRecordList.length,
                      (columnIndex) {
                    final columnFrontVideosRecord =
                        columnFrontVideosRecordList[columnIndex];
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  columnFrontVideosRecord.videoName,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINI_SERMON_VIDEOS_OLD_Container_yrjlhyo');
                                    logFirebaseEvent('Container_Navigate-To');
                                    context.pushNamed(
                                      'videoPage',
                                      queryParams: {
                                        'videoLink': serializeParam(
                                            columnFrontVideosRecord.videoLink,
                                            ParamType.String),
                                        'videoName': serializeParam(
                                            columnFrontVideosRecord.videoName,
                                            ParamType.String),
                                      }.withoutNulls,
                                    );
                                    logFirebaseEvent('Container_Backend-Call');

                                    final usersUpdateData = {
                                      'shorts_watched': FieldValue.arrayUnion(
                                          [columnFrontVideosRecord.videoId]),
                                    };
                                    await currentUserReference
                                        .update(usersUpdateData);
                                    logFirebaseEvent('Container_Backend-Call');

                                    final activityLogCreateData =
                                        createActivityLogRecordData(
                                      activity:
                                          'User clicked on video to watch on the Mini Sermons page - ${columnFrontVideosRecord.videoName}',
                                      time: getCurrentTimestamp,
                                      user: currentUserDisplayName,
                                    );
                                    await ActivityLogRecord.collection
                                        .doc()
                                        .set(activityLogCreateData);
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 4,
                                    child: Container(
                                      height: 210,
                                      decoration: BoxDecoration(
                                        color: Color(0x89333333),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 6,
                                            color: Color(0x89333333),
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: AuthUserStreamWidget(
                                        child: Badge(
                                          badgeContent: Text(
                                            'NEW',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                ),
                                          ),
                                          showBadge: !((currentUserDocument
                                                      ?.shortsWatched
                                                      ?.toList() ??
                                                  [])
                                              .contains(columnFrontVideosRecord
                                                  .videoId)),
                                          shape: BadgeShape.circle,
                                          badgeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          elevation: 4,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14, 14, 14, 14),
                                          position: BadgePosition.topEnd(),
                                          animationType:
                                              BadgeAnimationType.scale,
                                          toAnimate: true,
                                          child: Image.network(
                                            columnFrontVideosRecord
                                                .videoThumbnail,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
