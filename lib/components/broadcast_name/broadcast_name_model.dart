import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BroadcastNameModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for broadcastName widget.
  TextEditingController? broadcastNameController;
  String? Function(BuildContext, String?)? broadcastNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    broadcastNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
