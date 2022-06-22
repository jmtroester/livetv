import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/end_drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class VideoPageWidget extends StatefulWidget {
  const VideoPageWidget({
    Key key,
    this.videoLink,
    this.videoName,
    this.audioLink,
    this.videoThumbnail,
  }) : super(key: key);

  final String videoLink;
  final String videoName;
  final String audioLink;
  final String videoThumbnail;

  @override
  _VideoPageWidgetState createState() => _VideoPageWidgetState();
}

class _VideoPageWidgetState extends State<VideoPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'videoPage'});
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
              logFirebaseEvent('VIDEO_PAGE_PAGE_Icon_zh96fshh_ON_TAP');
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
                  logFirebaseEvent('VIDEO_PAGE_PAGE_Icon_4o1b3sqk_ON_TAP');
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('VIDEO_Container_gngiltrl_ON_TAP');
                      logFirebaseEvent('Container_Backend-Call');

                      final activityLogCreateData = createActivityLogRecordData(
                        activity:
                            'User clicked on video to watch - ${widget.videoName}',
                        time: getCurrentTimestamp,
                        user: currentUserDisplayName,
                      );
                      await ActivityLogRecord.collection
                          .doc()
                          .set(activityLogCreateData);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.videoName,
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 2,
                                          color: Color(0x89333333),
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                    child: FlutterFlowVideoPlayer(
                                      path: widget.videoLink,
                                      videoType: VideoType.network,
                                      autoPlay: false,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: true,
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
                  if ((widget.audioLink != null) && (widget.audioLink != ''))
                    Container(
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'VIDEO_LISTEN_TO_AUDIO_BTN_ON_TAP');
                                  logFirebaseEvent('Button_Launch-U-R-L');
                                  await launchURL(widget.audioLink);
                                  logFirebaseEvent('Button_Backend-Call');

                                  final activityLogCreateData =
                                      createActivityLogRecordData(
                                    activity:
                                        'User clicked on Listen to Audio Button on the video screen for: ${widget.videoName}',
                                    time: getCurrentTimestamp,
                                    user: currentUserDisplayName,
                                  );
                                  await ActivityLogRecord.collection
                                      .doc()
                                      .set(activityLogCreateData);
                                },
                                text: 'Listen to Audio',
                                icon: Icon(
                                  Icons.graphic_eq,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                      ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'VIDEO_PAGE_PAGE_SHARE_THIS_BTN_ON_TAP');
                                logFirebaseEvent('Button_Backend-Call');

                                final activityLogCreateData =
                                    createActivityLogRecordData(
                                  activity:
                                      'User clicked on share button on Video Page for: ${widget.videoName}',
                                  time: getCurrentTimestamp,
                                  user: currentUserDisplayName,
                                );
                                await ActivityLogRecord.collection
                                    .doc()
                                    .set(activityLogCreateData);
                                logFirebaseEvent('Button_Share');
                                await Share.share(
                                    'livetv://churchhome.online${GoRouter.of(context).location}');
                              },
                              text: 'Share This',
                              icon: Icon(
                                Icons.ios_share,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'VIDEO_PAGE_PAGE_POST_THIS_BTN_ON_TAP');
                                logFirebaseEvent('Button_Backend-Call');

                                final activityLogCreateData =
                                    createActivityLogRecordData(
                                  activity:
                                      'User clicked on Post This button on Video Page from: ${widget.videoName}',
                                  time: getCurrentTimestamp,
                                  user: currentUserDisplayName,
                                );
                                await ActivityLogRecord.collection
                                    .doc()
                                    .set(activityLogCreateData);
                                logFirebaseEvent('Button_Navigate-To');
                                context.pushNamed(
                                  'sharePost',
                                  queryParams: {
                                    'imageShare': serializeParam(
                                        widget.videoThumbnail,
                                        ParamType.String),
                                    'shareLink': serializeParam(
                                        'livetv://churchhome.online${GoRouter.of(context).location}',
                                        ParamType.String),
                                    'videoLink': serializeParam(
                                        widget.videoLink, ParamType.String),
                                    'videoName': serializeParam(
                                        widget.videoName, ParamType.String),
                                    'audioLink': serializeParam(
                                        widget.audioLink, ParamType.String),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Post This',
                              icon: Icon(
                                Icons.post_add_outlined,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'VIDEO_REMIND_ME_TO_WATCH_LATER_BTN_ON_TA');
                                logFirebaseEvent('Button_Backend-Call');

                                final activityLogCreateData =
                                    createActivityLogRecordData(
                                  activity:
                                      'User clicked on Remind Me Later Button on video screen for: ${widget.videoName}',
                                  time: getCurrentTimestamp,
                                  user: currentUserDisplayName,
                                );
                                await ActivityLogRecord.collection
                                    .doc()
                                    .set(activityLogCreateData);
                                logFirebaseEvent('Button_Alert-Dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Reminder'),
                                      content: Text(
                                          'Awesome, we will send you a reminder tomorrow!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Thanks!'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                logFirebaseEvent(
                                    'Button_Trigger-Push-Notification');
                                triggerPushNotification(
                                  notificationTitle: 'REMINDER: Watch a Video',
                                  notificationText:
                                      'This is your reminder that you marked a video to watch later called: ${widget.videoName}. Click this notification to watch.',
                                  scheduledTime:
                                      functions.addADate(getCurrentTimestamp),
                                  notificationSound: 'default',
                                  userRefs: [currentUserReference],
                                  initialPageName: 'videoPage',
                                  parameterData: {
                                    'videoLink': widget.videoLink,
                                    'videoName': widget.videoName,
                                    'audioLink': widget.audioLink,
                                  },
                                );
                              },
                              text: 'Remind Me to Watch Later',
                              icon: Icon(
                                Icons.watch_later_outlined,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 300,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (valueOrDefault(currentUserDocument?.admin, false) ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: AuthUserStreamWidget(
                        child: FutureBuilder<List<MiscRecord>>(
                          future: queryMiscRecordOnce(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitWave(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<MiscRecord> containerMiscRecordList =
                                snapshot.data;
                            final containerMiscRecord =
                                containerMiscRecordList.isNotEmpty
                                    ? containerMiscRecordList.first
                                    : null;
                            return Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'VIDEO_SEND_LINK_TO_HOME_SCREEN_BTN_ON_TA');
                                          logFirebaseEvent(
                                              'Button_Backend-Call');

                                          final miscUpdateData =
                                              createMiscRecordData(
                                            homeImageLink:
                                                'livetv://churchhome.online${GoRouter.of(context).location}',
                                          );
                                          await containerMiscRecord.reference
                                              .update(miscUpdateData);
                                        },
                                        text: 'Send Page Link to Home Screen',
                                        options: FFButtonOptions(
                                          width: 350,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary400,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 4,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
