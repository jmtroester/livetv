import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/level_up_sheet/level_up_sheet_widget.dart';
import '/components/send_journal_to_chat/send_journal_to_chat_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JournalBottomSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  JournalEntriesRecord? newJournal;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  JournalEntriesRecord? newJournal2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  JournalEntriesRecord? newJournal3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
