import '/components/end_drawer/end_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CongratsDiscipleshipModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EndDrawer component.
  late EndDrawerModel endDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    endDrawerModel = createModel(context, () => EndDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    endDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
