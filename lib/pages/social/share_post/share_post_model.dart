import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SharePostModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for postContent widget.
  TextEditingController? postContentController;
  String? Function(BuildContext, String?)? postContentControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SocialPostsRecord? newVideoPost;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    postContentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
