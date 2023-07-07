import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DiscipleshipHomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for Switch1-StudyingTheBible widget.
  bool? switch1StudyingTheBibleValue;
  // State field(s) for Switch2-StudyingTheBible widget.
  bool? switch2StudyingTheBibleValue;
  // State field(s) for Switch1-Praying widget.
  bool? switch1PrayingValue;
  // State field(s) for Switch2-Praying widget.
  bool? switch2PrayingValue;
  // State field(s) for Switch1-Forgiveness widget.
  bool? switch1ForgivenessValue;
  // State field(s) for Switch2-Forgiveness widget.
  bool? switch2ForgivenessValue;
  // State field(s) for Switch1-Joy widget.
  bool? switch1JoyValue;
  // State field(s) for Switch2-Joy widget.
  bool? switch2JoyValue;
  // State field(s) for Switch1-Patience widget.
  bool? switch1PatienceValue;
  // State field(s) for Switch2-Patience widget.
  bool? switch2PatienceValue;
  // State field(s) for Timer widget.
  int timerMilliseconds = 900000;
  String timerValue = StopWatchTimer.getDisplayTime(900000, milliSecond: false);
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // State field(s) for Switch1-Gratitude widget.
  bool? switch1GratitudeValue;
  // State field(s) for Switch2-Gratitude widget.
  bool? switch2GratitudeValue;
  // State field(s) for Switch1-Compassion widget.
  bool? switch1CompassionValue;
  // State field(s) for Switch2-Compassion widget.
  bool? switch2CompassionValue;
  // Model for EndDrawer component.
  late EndDrawerModel endDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    endDrawerModel = createModel(context, () => EndDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
    endDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
