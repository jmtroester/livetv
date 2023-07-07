import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/strongs_sheet/strongs_sheet_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BibleStudyOldModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DropDownForBooks widget.
  String? dropDownForBooksValue;
  FormFieldController<String>? dropDownForBooksValueController;
  // State field(s) for DropDownForChapters widget.
  String? dropDownForChaptersValue;
  FormFieldController<String>? dropDownForChaptersValueController;
  // State field(s) for DropDownForVerses widget.
  String? dropDownForVersesValue;
  FormFieldController<String>? dropDownForVersesValueController;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (Get Greek Reference Infomation KJV)] action in Container widget.
  ApiCallResponse? greekRef;
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

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
