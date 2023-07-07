import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/components/front_drawer/front_drawer_widget.dart';
import '/components/home_header/home_header_widget.dart';
import '/components/modal_home/modal_home_widget.dart';
import '/components/new_prayer_bottom_sheet/new_prayer_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
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

class HelpModalModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for homeHeader component.
  late HomeHeaderModel homeHeaderModel;
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
    endDrawerModel.dispose();
    frontDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
