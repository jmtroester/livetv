import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPrayerBottomSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SliderPhysically widget.
  double? sliderPhysicallyValue;
  // State field(s) for SliderMentally widget.
  double? sliderMentallyValue;
  // State field(s) for SliderSpiritual widget.
  double? sliderSpiritualValue;
  // State field(s) for PrayerInput widget.
  final prayerInputKey = GlobalKey();
  TextEditingController? prayerInputController;
  String? prayerInputSelectedOption;
  String? Function(BuildContext, String?)? prayerInputControllerValidator;
  // State field(s) for CheckboxPrayer widget.
  bool? checkboxPrayerValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiscipleshipReportRecord? newDiscipleshipReport;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
