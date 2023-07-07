import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_feed_model.dart';
export 'video_feed_model.dart';

class VideoFeedWidget extends StatefulWidget {
  const VideoFeedWidget({Key? key}) : super(key: key);

  @override
  _VideoFeedWidgetState createState() => _VideoFeedWidgetState();
}

class _VideoFeedWidgetState extends State<VideoFeedWidget> {
  late VideoFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoFeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'VideoFeed'});
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

    return StreamBuilder<List<MiscRecord>>(
      stream: queryMiscRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<MiscRecord> videoFeedMiscRecordList = snapshot.data!;
        final videoFeedMiscRecord = videoFeedMiscRecordList.isNotEmpty
            ? videoFeedMiscRecordList.first
            : null;
        return Title(
            title: 'VideoFeed',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                            'VIDEO_FEED_PAGE_Icon_v6o8wti9_ON_TAP');
                        logFirebaseEvent('Icon_navigate_back');
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
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
                    actions: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Icon(
                          Icons.settings_outlined,
                          color: Color(0xFFE8602F),
                          size: 30.0,
                        ),
                      ),
                    ],
                    centerTitle: true,
                    elevation: 2.0,
                  ),
                ),
                body: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: custom_widgets.BetterPlayerFF(
                          width: 375.0,
                          height: 240.0,
                          videoURL: videoFeedMiscRecord!.testVideoString,
                          autoPlay: true,
                          aspectRatio: 1.78,
                          showControls: true,
                          enableOverFlowMenu: true,
                          enableMute: true,
                          enablePlaybackSpeed: true,
                          enableAudioTracks: true,
                          enableQualities: true,
                          enableSubtitles: true,
                          enableFullscreen: true,
                          enableSkips: true,
                          eventAction: 'finished',
                          onEvent: () async {
                            logFirebaseEvent(
                                'VIDEO_FEED_Container_cjuhjyqp_CALLBACK');
                            logFirebaseEvent('BetterPlayerFF_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Video Event'),
                                  content: Text('Video Finished'),
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
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
