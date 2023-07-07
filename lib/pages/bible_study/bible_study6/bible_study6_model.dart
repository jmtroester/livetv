import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BibleStudy6Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for WhatIsContext widget.
  TextEditingController? whatIsContextController;
  String? Function(BuildContext, String?)? whatIsContextControllerValidator;
  // State field(s) for OriginalIntent widget.
  TextEditingController? originalIntentController;
  String? Function(BuildContext, String?)? originalIntentControllerValidator;
  // State field(s) for HowDoesItTranslate widget.
  TextEditingController? howDoesItTranslateController;
  String? Function(BuildContext, String?)?
      howDoesItTranslateControllerValidator;
  // State field(s) for WhatDoesThisDemand widget.
  TextEditingController? whatDoesThisDemandController;
  String? Function(BuildContext, String?)?
      whatDoesThisDemandControllerValidator;
  // State field(s) for WhatMakesYouUncomfortable widget.
  TextEditingController? whatMakesYouUncomfortableController;
  String? Function(BuildContext, String?)?
      whatMakesYouUncomfortableControllerValidator;
  // State field(s) for HowDoesThisPointToJesus widget.
  TextEditingController? howDoesThisPointToJesusController;
  String? Function(BuildContext, String?)?
      howDoesThisPointToJesusControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    whatIsContextController?.dispose();
    originalIntentController?.dispose();
    howDoesItTranslateController?.dispose();
    whatDoesThisDemandController?.dispose();
    whatMakesYouUncomfortableController?.dispose();
    howDoesThisPointToJesusController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
