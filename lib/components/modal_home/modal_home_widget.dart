import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_home_model.dart';
export 'modal_home_model.dart';

class ModalHomeWidget extends StatefulWidget {
  const ModalHomeWidget({Key? key}) : super(key: key);

  @override
  _ModalHomeWidgetState createState() => _ModalHomeWidgetState();
}

class _ModalHomeWidgetState extends State<ModalHomeWidget> {
  late ModalHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalHomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Material(
        color: Colors.transparent,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 500.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Color(0xFFF1F4F8),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            'ql1wl21b' /* Today, I need help with... (Pi... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        )),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.85,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: FlutterFlowChoiceChips(
                                    options: [
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'heevecc5' /* Studying the Bible */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'kbwyt47t' /* Praying */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'iw1nmhky' /* Forgiveness */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'blg2bcgj' /* Joy */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'dus1hby1' /* Patience */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'pqz8d11d' /* Gratitude */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'c84j1bcd' /* Compassion */,
                                      ))
                                    ],
                                    onChanged: (val) => setState(() =>
                                        _model.choiceChipsValue = val?.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor: Color(0xFF323B45),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 18.0,
                                      elevation: 4.0,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF323B45),
                                          ),
                                      iconColor: Color(0xFF323B45),
                                      iconSize: 18.0,
                                      elevation: 4.0,
                                    ),
                                    chipSpacing: 10.0,
                                    rowSpacing: 12.0,
                                    multiselect: false,
                                    alignment: WrapAlignment.spaceEvenly,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MODAL_HOME_COMP_SUBMIT_BTN_ON_TAP');
                                    if (_model.choiceChipsValue ==
                                        'Studying the Bible') {
                                      logFirebaseEvent('Button_backend_call');

                                      await DiscipleshipHelpRecord.collection
                                          .doc()
                                          .set(createDiscipleshipHelpRecordData(
                                            user: currentUserReference,
                                            dateStarted: getCurrentTimestamp,
                                            dateStartedString:
                                                functions.pullDateFromTimeStamp(
                                                    getCurrentTimestamp),
                                            helpType: 'Studying the Bible',
                                          ));
                                    }
                                    if (_model.choiceChipsValue == 'Praying') {
                                      logFirebaseEvent('Button_backend_call');

                                      await DiscipleshipHelpRecord.collection
                                          .doc()
                                          .set(createDiscipleshipHelpRecordData(
                                            user: currentUserReference,
                                            dateStarted: getCurrentTimestamp,
                                            dateStartedString:
                                                functions.pullDateFromTimeStamp(
                                                    getCurrentTimestamp),
                                            helpType: 'Praying',
                                          ));
                                    }
                                    if (_model.choiceChipsValue ==
                                        'Forgiveness') {
                                      logFirebaseEvent('Button_backend_call');

                                      await DiscipleshipHelpRecord.collection
                                          .doc()
                                          .set(createDiscipleshipHelpRecordData(
                                            user: currentUserReference,
                                            dateStarted: getCurrentTimestamp,
                                            dateStartedString:
                                                functions.pullDateFromTimeStamp(
                                                    getCurrentTimestamp),
                                            helpType: 'Forgiveness',
                                          ));
                                    }
                                    if (_model.choiceChipsValue == 'Joy') {
                                      logFirebaseEvent('Button_backend_call');

                                      await DiscipleshipHelpRecord.collection
                                          .doc()
                                          .set(createDiscipleshipHelpRecordData(
                                            user: currentUserReference,
                                            dateStarted: getCurrentTimestamp,
                                            dateStartedString:
                                                functions.pullDateFromTimeStamp(
                                                    getCurrentTimestamp),
                                            helpType: 'Joy',
                                          ));
                                    }
                                    if (_model.choiceChipsValue == 'Patience') {
                                      logFirebaseEvent('Button_backend_call');

                                      await DiscipleshipHelpRecord.collection
                                          .doc()
                                          .set(createDiscipleshipHelpRecordData(
                                            user: currentUserReference,
                                            dateStarted: getCurrentTimestamp,
                                            dateStartedString:
                                                functions.pullDateFromTimeStamp(
                                                    getCurrentTimestamp),
                                            helpType: 'Patience',
                                          ));
                                    }
                                    if (_model.choiceChipsValue ==
                                        'Gratitude') {
                                      logFirebaseEvent('Button_backend_call');

                                      await DiscipleshipHelpRecord.collection
                                          .doc()
                                          .set(createDiscipleshipHelpRecordData(
                                            user: currentUserReference,
                                            dateStarted: getCurrentTimestamp,
                                            dateStartedString:
                                                functions.pullDateFromTimeStamp(
                                                    getCurrentTimestamp),
                                            helpType: 'Gratitude',
                                          ));
                                    }
                                    if (_model.choiceChipsValue ==
                                        'Compassion') {
                                      logFirebaseEvent('Button_backend_call');

                                      await DiscipleshipHelpRecord.collection
                                          .doc()
                                          .set(createDiscipleshipHelpRecordData(
                                            user: currentUserReference,
                                            dateStarted: getCurrentTimestamp,
                                            dateStartedString:
                                                functions.pullDateFromTimeStamp(
                                                    getCurrentTimestamp),
                                            helpType: 'Compassion',
                                          ));
                                    }
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('Home');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    's16n50s1' /* Submit */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Colors.white,
                                        ),
                                    elevation: 4.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
