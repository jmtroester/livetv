import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/components/front_drawer/front_drawer_widget.dart';
import '/components/help_sheet/help_sheet_widget.dart';
import '/components/home_header/home_header_widget.dart';
import '/components/new_prayer_bottom_sheet/new_prayer_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for homeHeader component.
  late HomeHeaderModel homeHeaderModel;
  // State field(s) for Switch1-StudyingTheBible widget.
  bool? switch1StudyingTheBibleValue;
  // State field(s) for Switch2-StudyingTheBible widget.
  bool? switch2StudyingTheBibleValue;
  // State field(s) for Switch1-Praying widget.
  bool? switch1PrayingValue;
  // State field(s) for Switch2-Praying widget.
  bool? switch2PrayingValue;
  // State field(s) for Switch1-Forgiveness widget.
  bool? switch1ForgivenessValue;
  // State field(s) for Switch2-Forgiveness widget.
  bool? switch2ForgivenessValue;
  // State field(s) for Switch1-Joy widget.
  bool? switch1JoyValue;
  // State field(s) for Switch2-Joy widget.
  bool? switch2JoyValue;
  // State field(s) for Switch1-Patience widget.
  bool? switch1PatienceValue;
  // State field(s) for Switch2-Patience widget.
  bool? switch2PatienceValue;
  // State field(s) for Timer widget.
  int timerMilliseconds = 900000;
  String timerValue = StopWatchTimer.getDisplayTime(900000, milliSecond: false);
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // State field(s) for Switch1-Gratitude widget.
  bool? switch1GratitudeValue;
  // State field(s) for Switch2-Gratitude widget.
  bool? switch2GratitudeValue;
  // State field(s) for Switch1-Compassion widget.
  bool? switch1CompassionValue;
  // State field(s) for Switch2-Compassion widget.
  bool? switch2CompassionValue;
  // Model for EndDrawer component.
  late EndDrawerModel endDrawerModel;
  // Model for FrontDrawer component.
  late FrontDrawerModel frontDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeHeaderModel = createModel(context, () => HomeHeaderModel());
    endDrawerModel = createModel(context, () => EndDrawerModel());
    frontDrawerModel = createModel(context, () => FrontDrawerModel());
  }

  void dispose() {
    homeHeaderModel.dispose();
    timerController.dispose();
    endDrawerModel.dispose();
    frontDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
