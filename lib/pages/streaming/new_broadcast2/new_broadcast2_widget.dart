import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_mux_broadcast.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_broadcast2_model.dart';
export 'new_broadcast2_model.dart';

class NewBroadcast2Widget extends StatefulWidget {
  const NewBroadcast2Widget({
    Key? key,
    String? broadcastName,
  })  : this.broadcastName = broadcastName ?? 'NoName',
        super(key: key);

  final String broadcastName;

  @override
  _NewBroadcast2WidgetState createState() => _NewBroadcast2WidgetState();
}

class _NewBroadcast2WidgetState extends State<NewBroadcast2Widget> {
  late NewBroadcast2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  bool _isSupportedPlatform = false;
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewBroadcast2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NewBroadcast2'});
    if (Platform.isAndroid || Platform.isIOS) {
      _isSupportedPlatform = true;
      _initCamera();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _stopwatch.stop();
    _timer?.cancel();
    Wakelock.disable();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'NewBroadcast2',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'NEW_BROADCAST2_arrow_back_rounded_ICN_ON');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/LiveTV_Logo_White.png',
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.fitHeight,
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
              child: StreamBuilder<List<MiscRecord>>(
                stream: queryMiscRecord(
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
                  List<MiscRecord> cardMiscRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final cardMiscRecord = cardMiscRecordList.isNotEmpty
                      ? cardMiscRecordList.first
                      : null;
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: FlutterFlowMuxBroadcast(
                              isCameraInitialized: _isCameraInitialized,
                              isStreaming: muxBroadcastIsLive,
                              durationString: _durationString,
                              borderRadius: BorderRadius.circular(0.0),
                              controller: muxBroadcastController,
                              videoConfig: _initialVideoConfig,
                              onCameraRotateButtonTap: () async {
                                await switchCamera();
                                setState(() =>
                                    _isFrontCamSelected = !_isFrontCamSelected);
                              },
                              startButtonText:
                                  FFLocalizations.of(context).getText(
                                '7nopicu9' /* Start Stream */,
                              ),
                              startButtonIcon: Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              startButtonOptions: FFButtonOptions(
                                width: 160.0,
                                height: 50.0,
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              liveIcon: FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color: Colors.red,
                                size: 10.0,
                              ),
                              liveText: FFLocalizations.of(context).getText(
                                '2g7z8htb' /* Live */,
                              ),
                              liveTextStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.red,
                                  ),
                              liveTextBackgroundColor: Color(0x8A000000),
                              durationTextStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.red,
                                  ),
                              durationTextBackgroundColor: Color(0x8A000000),
                              liveContainerBorderRadius:
                                  BorderRadius.circular(8.0),
                              durationContainerBorderRadius:
                                  BorderRadius.circular(8.0),
                              rotateButtonColor: Color(0x8A000000),
                              rotateButtonIcon: Icon(
                                Icons.flip_camera_android,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              stopButtonIcon: Icon(
                                Icons.stop_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              stopButtonColor: Colors.red,
                              onStartButtonTap: () async {
                                await startStreaming();
                                logFirebaseEvent(
                                    'NEW_BROADCAST2_MuxBroadcast_q8k156nz_ON_');
                                logFirebaseEvent('MuxBroadcast_backend_call');

                                var liveVideoRecordReference =
                                    LiveVideoRecord.collection.doc();
                                await liveVideoRecordReference
                                    .set(createLiveVideoRecordData(
                                  isLive: true,
                                  name: widget.broadcastName,
                                  url: muxBroadcastPlaybackUrl,
                                  time: getCurrentTimestamp,
                                ));
                                _model.newBroadcastDoc =
                                    LiveVideoRecord.getDocumentFromData(
                                        createLiveVideoRecordData(
                                          isLive: true,
                                          name: widget.broadcastName,
                                          url: muxBroadcastPlaybackUrl,
                                          time: getCurrentTimestamp,
                                        ),
                                        liveVideoRecordReference);
                                logFirebaseEvent('MuxBroadcast_backend_call');

                                await cardMiscRecord!.reference
                                    .update(createMiscRecordData(
                                  liveVideo: true,
                                ));

                                setState(() {});
                              },
                              onStopButtonTap: () async {
                                stopStreaming();
                                logFirebaseEvent(
                                    'NEW_BROADCAST2_MuxBroadcast_q8k156nz_ON_');
                                logFirebaseEvent('MuxBroadcast_backend_call');

                                await cardMiscRecord!.reference
                                    .update(createMiscRecordData(
                                  liveVideo: false,
                                ));
                                logFirebaseEvent('MuxBroadcast_backend_call');

                                await _model.newBroadcastDoc!.reference
                                    .update(createLiveVideoRecordData(
                                  isLive: false,
                                ));
                                logFirebaseEvent('MuxBroadcast_navigate_to');

                                context.pushNamed('BroadcastListing');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    setState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        setState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        if (mounted) setState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        if (mounted) setState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    final callName = 'createLiveStream';
    final response =
        await makeCloudCall(callName, {'latency_mode': 'standard'});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        Wakelock.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      Wakelock.disable();
      liveStreamController.stopStreaming();
      if (mounted) setState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _durationString = _getDurationString(_stopwatch.elapsed);
        });
      }
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
