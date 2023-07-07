import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HelpSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipHelpRecord? newStudyingtheBible;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipHelpRecord? newPraying;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipHelpRecord? newForgiveness;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipHelpRecord? newJoy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipHelpRecord? newPatience;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipHelpRecord? newGratitude;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipHelpRecord? newCompassion;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipHelpRecord? newCancel;
  InstantTimer? discipleshipReminder;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    discipleshipReminder?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
