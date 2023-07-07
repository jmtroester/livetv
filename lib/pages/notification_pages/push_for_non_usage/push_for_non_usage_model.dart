import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PushForNonUsageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for pushTitle widget.
  TextEditingController? pushTitleController;
  String? Function(BuildContext, String?)? pushTitleControllerValidator;
  DateTime? datePicked;
  // State field(s) for pushMessage widget.
  TextEditingController? pushMessageController;
  String? Function(BuildContext, String?)? pushMessageControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    pushTitleController?.dispose();
    pushMessageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
