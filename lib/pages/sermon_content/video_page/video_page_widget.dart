import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/components/level_up_sheet/level_up_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'video_page_model.dart';
export 'video_page_model.dart';

class VideoPageWidget extends StatefulWidget {
  const VideoPageWidget({
    Key? key,
    this.videoLink,
    this.videoName,
    this.audioLink,
    this.videoThumbnail,
    this.audioID,
    this.videoURL,
    this.levelUp,
  }) : super(key: key);

  final String? videoLink;
  final String? videoName;
  final String? audioLink;
  final String? videoThumbnail;
  final int? audioID;
  final String? videoURL;
  final bool? levelUp;

  @override
  _VideoPageWidgetState createState() => _VideoPageWidgetState();
}

class _VideoPageWidgetState extends State<VideoPageWidget> {
  late VideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'videoPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VIDEO_PAGE_PAGE_videoPage_ON_INIT_STATE');
      if (widget.levelUp!) {
        logFirebaseEvent('videoPage_bottom_sheet');
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Color(0x00000000),
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: 400.0,
                  child: LevelUpSheetWidget(),
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        logFirebaseEvent('videoPage_haptic_feedback');
        HapticFeedback.vibrate();
        return;
      } else {
        return;
      }
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
        title: 'videoPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            endDrawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Drawer(
                elevation: 16.0,
                child: wrapWithModel(
                  model: _model.endDrawerModel,
                  updateCallback: () => setState(() {}),
                  child: EndDrawerWidget(),
                ),
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
                    logFirebaseEvent('VIDEO_PAGE_PAGE_Icon_zh96fshh_ON_TAP');
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'VIDEO_PAGE_PAGE_Icon_4o1b3sqk_ON_TAP');
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('VIDEO_Container_gngiltrl_ON_TAP');
                          logFirebaseEvent('Container_backend_call');

                          await ActivityLogRecord.collection
                              .doc()
                              .set(createActivityLogRecordData(
                                activity:
                                    'User clicked on video to watch - ${widget.videoName}',
                                time: getCurrentTimestamp,
                                user: currentUserDisplayName,
                              ));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.videoName!,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
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
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 2.0,
                                              color: Color(0x89333333),
                                              spreadRadius: 2.0,
                                            )
                                          ],
                                        ),
                                        child: FlutterFlowVideoPlayer(
                                          path: widget.videoLink!,
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
                      if (widget.audioLink != null && widget.audioLink != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 45.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'VIDEO_LISTEN_TO_AUDIO_BTN_ON_TAP');
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!.update({
                                          'podcasts_watched':
                                              FieldValue.arrayUnion(
                                                  [widget.audioID]),
                                        });
                                        logFirebaseEvent(
                                            'Button_haptic_feedback');
                                        HapticFeedback.selectionClick();
                                        logFirebaseEvent('Button_backend_call');

                                        await ActivityLogRecord.collection
                                            .doc()
                                            .set(createActivityLogRecordData(
                                              activity:
                                                  'Listened to Audio from Video Screen - ${widget.videoName}',
                                              time: getCurrentTimestamp,
                                              user: currentUserDisplayName,
                                              showUser: true,
                                            ));
                                        logFirebaseEvent('Button_launch_u_r_l');
                                        await launchURL(widget.audioLink!);
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'ht0o5xoa' /* Listen to Audio */,
                                      ),
                                      icon: Icon(
                                        Icons.graphic_eq,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 200.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'VIDEO_PAGE_PAGE_SHARE_THIS_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_haptic_feedback');
                                        HapticFeedback.selectionClick();
                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        logFirebaseEvent('Button_share');
                                        await Share.share(
                                          widget.videoURL!,
                                          sharePositionOrigin:
                                              getWidgetBoundingBox(context),
                                        );
                                        logFirebaseEvent('Button_backend_call');

                                        await ActivityLogRecord.collection
                                            .doc()
                                            .set(createActivityLogRecordData(
                                              activity:
                                                  'Video shared - ${widget.videoName}',
                                              time: getCurrentTimestamp,
                                              user: currentUserDisplayName,
                                              showUser: true,
                                            ));
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '7sbiz5ue' /* Share This */,
                                      ),
                                      icon: Icon(
                                        Icons.ios_share,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 200.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.black,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.white,
                                            ),
                                        elevation: 4.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
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
                                      logFirebaseEvent('Button_backend_call');

                                      await ActivityLogRecord.collection
                                          .doc()
                                          .set(createActivityLogRecordData(
                                            activity:
                                                'Posting video to social - ${widget.videoName}',
                                            time: getCurrentTimestamp,
                                            user: currentUserDisplayName,
                                            showUser: true,
                                          ));
                                      logFirebaseEvent(
                                          'Button_haptic_feedback');
                                      HapticFeedback.selectionClick();
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'sharePost',
                                        queryParameters: {
                                          'imageShare': serializeParam(
                                            widget.videoThumbnail,
                                            ParamType.String,
                                          ),
                                          'shareLink': serializeParam(
                                            'livetv://churchhome.online${GoRouter.of(context).location}',
                                            ParamType.String,
                                          ),
                                          'videoLink': serializeParam(
                                            widget.videoLink,
                                            ParamType.String,
                                          ),
                                          'videoName': serializeParam(
                                            widget.videoName,
                                            ParamType.String,
                                          ),
                                          'audioLink': serializeParam(
                                            widget.audioLink,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '3grwmplv' /* Post This */,
                                    ),
                                    icon: Icon(
                                      Icons.post_add_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.black,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                          ),
                                      elevation: 4.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
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
                                      logFirebaseEvent('Button_backend_call');

                                      await ActivityLogRecord.collection
                                          .doc()
                                          .set(createActivityLogRecordData(
                                            activity:
                                                'Remind me later - ${widget.videoName}',
                                            time: getCurrentTimestamp,
                                            user: currentUserDisplayName,
                                            showUser: true,
                                          ));
                                      logFirebaseEvent(
                                          'Button_haptic_feedback');
                                      HapticFeedback.mediumImpact();
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Reminder'),
                                            content: Text(
                                                'Awesome, we will send you a reminder tomorrow!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Thanks!'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      logFirebaseEvent(
                                          'Button_trigger_push_notification');
                                      triggerPushNotification(
                                        notificationTitle:
                                            'REMINDER: Watch a Video',
                                        notificationText:
                                            'This is your reminder that you marked a video to watch later called: ${widget.videoName}. Click this notification to watch.',
                                        scheduledTime: functions
                                            .addADate(getCurrentTimestamp),
                                        notificationSound: 'default',
                                        userRefs: [currentUserReference!],
                                        initialPageName: 'videoPage',
                                        parameterData: {
                                          'videoLink': widget.videoLink,
                                          'videoName': widget.videoName,
                                          'audioLink': widget.audioLink,
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'im1dbg47' /* Remind Me to Watch Later */,
                                    ),
                                    icon: Icon(
                                      Icons.watch_later_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                ],
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
        ));
  }
}
