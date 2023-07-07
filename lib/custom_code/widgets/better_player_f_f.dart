// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:better_player/better_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class BetterPlayerFF extends StatefulWidget {
  const BetterPlayerFF({
    Key? key,
    this.width,
    this.height,
    this.videoURL = '',
    this.autoPlay = false,
    this.aspectRatio = 1.78,
    this.showControls = false,
    this.enableOverFlowMenu = false,
    this.enableMute = false,
    this.enablePlaybackSpeed = false,
    this.enableAudioTracks = false,
    this.enableQualities = false,
    this.enableSubtitles = false,
    this.enableFullscreen = false,
    this.enableSkips = false,
    this.eventAction = "play",
    required this.onEvent,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoURL;
  final bool autoPlay;
  final double aspectRatio;
  final bool showControls;
  final bool enableOverFlowMenu;
  final bool enableMute;
  final bool enablePlaybackSpeed;
  final bool enableAudioTracks;
  final bool enableQualities;
  final bool enableSubtitles;
  final bool enableFullscreen;
  final bool enableSkips;
  final String eventAction;
  final Future<dynamic> Function() onEvent;

  @override
  _BetterPlayerFFState createState() => _BetterPlayerFFState();
}

class _BetterPlayerFFState extends State<BetterPlayerFF> {
  late BetterPlayerController _betterPlayerController;

  double get width => widget.width == null || widget.width! >= double.infinity
      ? MediaQuery.of(context).size.width
      : widget.width!;

  double get height =>
      widget.height == null || widget.height! >= double.infinity
          ? width / widget.aspectRatio
          : width / widget.aspectRatio;

  @override
  void initState() {
    BetterPlayerControlsConfiguration controlsConfiguration =
        BetterPlayerControlsConfiguration(
      enableSkips: widget.enableSkips,
      enableFullscreen: widget.enableFullscreen,
      enableMute: widget.enableMute,
      enablePlaybackSpeed: widget.enablePlaybackSpeed,
      enableAudioTracks: widget.enableAudioTracks,
      enableQualities: widget.enableQualities,
      enableOverflowMenu: widget.enableOverFlowMenu,
      showControls: widget.showControls,
      enableSubtitles: widget.enableSubtitles,
      fullscreenEnableIcon: CupertinoIcons.fullscreen,
      fullscreenDisableIcon: CupertinoIcons.fullscreen_exit,
      unMuteIcon: CupertinoIcons.volume_off,
      muteIcon: CupertinoIcons.volume_up,
      playIcon: Icons.play_arrow,
      enablePip: true,
    );

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      controlsConfiguration: controlsConfiguration,
      fit: BoxFit.contain,
      aspectRatio: widget.aspectRatio,
      autoPlay: widget.autoPlay,
      fullScreenAspectRatio: widget.aspectRatio,
      autoDetectFullscreenDeviceOrientation: false,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
      deviceOrientationsOnFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.portraitUp
      ],
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.videoURL,
        useAsmsSubtitles: true);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);

    super.initState();

    BetterPlayerEventType widgetEventType = BetterPlayerEventType.values
        .firstWhere((e) =>
            e.toString() == 'BetterPlayerEventType.' + widget.eventAction);

    _betterPlayerController.addEventsListener((eventListener) {
      if (eventListener.betterPlayerEventType == widgetEventType) {
        widget.onEvent();
      }
    });
  }

  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.cover,
        child: Container(
          height: height,
          width: width,
          child: BetterPlayer(controller: _betterPlayerController),
        ),
      );
}
