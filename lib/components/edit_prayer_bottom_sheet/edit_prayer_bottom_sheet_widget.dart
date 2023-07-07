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
import 'edit_prayer_bottom_sheet_model.dart';
export 'edit_prayer_bottom_sheet_model.dart';

class EditPrayerBottomSheetWidget extends StatefulWidget {
  const EditPrayerBottomSheetWidget({
    Key? key,
    this.prayerRef,
  }) : super(key: key);

  final DocumentReference? prayerRef;

  @override
  _EditPrayerBottomSheetWidgetState createState() =>
      _EditPrayerBottomSheetWidgetState();
}

class _EditPrayerBottomSheetWidgetState
    extends State<EditPrayerBottomSheetWidget> {
  late EditPrayerBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPrayerBottomSheetModel());

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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: StreamBuilder<PrayersRecord>(
              stream: PrayersRecord.getDocument(widget.prayerRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  );
                }
                final containerHowAreYouTodayPrayersRecord = snapshot.data!;
                return Material(
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
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xFFF1F4F8),
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: Color(0xFFF1F4F8),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Physically - ${_model.sliderPhysicallyValue.toString()}',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'u0qaz9bz' /* Rate how you are doing physica... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: Slider.adaptive(
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    inactiveColor:
                                                        Color(0xFF9E9E9E),
                                                    min: 0.0,
                                                    max: 10.0,
                                                    value: _model
                                                            .sliderPhysicallyValue ??=
                                                        valueOrDefault<double>(
                                                      widget.prayerRef != null
                                                          ? containerHowAreYouTodayPrayersRecord
                                                              .physically
                                                          : 10.0,
                                                      10.0,
                                                    ),
                                                    label: _model
                                                        .sliderPhysicallyValue
                                                        .toString(),
                                                    divisions: 10,
                                                    onChanged: (newValue) {
                                                      setState(() => _model
                                                              .sliderPhysicallyValue =
                                                          newValue);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: Color(0xFFF1F4F8),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      'Mentally - ${_model.sliderMentallyValue?.toString()}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'tb4jj5je' /* Rate how you are doing mentall... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Slider.adaptive(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  inactiveColor:
                                                      Color(0xFF9E9E9E),
                                                  min: 0.0,
                                                  max: 10.0,
                                                  value: _model
                                                          .sliderMentallyValue ??=
                                                      valueOrDefault<double>(
                                                    widget.prayerRef != null
                                                        ? containerHowAreYouTodayPrayersRecord
                                                            .mentally
                                                        : 10.0,
                                                    10.0,
                                                  ),
                                                  label: _model
                                                      .sliderMentallyValue
                                                      .toString(),
                                                  divisions: 10,
                                                  onChanged: (newValue) {
                                                    setState(() => _model
                                                            .sliderMentallyValue =
                                                        newValue);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: Color(0xFFF1F4F8),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Spiritually - ${_model.sliderSpiritualValue?.toString()}',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'm22c7fek' /* Rate how you are doing spiritu... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Slider.adaptive(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  inactiveColor:
                                                      Color(0xFF9E9E9E),
                                                  min: 0.0,
                                                  max: 10.0,
                                                  value: _model
                                                          .sliderSpiritualValue ??=
                                                      valueOrDefault<double>(
                                                    widget.prayerRef != null
                                                        ? containerHowAreYouTodayPrayersRecord
                                                            .spiritually
                                                        : 10.0,
                                                    10.0,
                                                  ),
                                                  label: _model
                                                      .sliderSpiritualValue
                                                      .toString(),
                                                  divisions: 10,
                                                  onChanged: (newValue) {
                                                    setState(() => _model
                                                            .sliderSpiritualValue =
                                                        newValue);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: Color(0xFFF1F4F8),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2ox1u39p' /* Prayer */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 8.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '0s0x6mpi' /* How can we pray for you? */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Autocomplete<String>(
                                                  initialValue: TextEditingValue(
                                                      text:
                                                          containerHowAreYouTodayPrayersRecord
                                                              .prayer),
                                                  optionsBuilder:
                                                      (textEditingValue) {
                                                    if (textEditingValue.text ==
                                                        '') {
                                                      return const Iterable<
                                                          String>.empty();
                                                    }
                                                    return <String>[]
                                                        .where((option) {
                                                      final lowercaseOption =
                                                          option.toLowerCase();
                                                      return lowercaseOption
                                                          .contains(
                                                              textEditingValue
                                                                  .text
                                                                  .toLowerCase());
                                                    });
                                                  },
                                                  optionsViewBuilder: (context,
                                                      onSelected, options) {
                                                    return AutocompleteOptionsList(
                                                      textFieldKey:
                                                          _model.prayerInputKey,
                                                      textController: _model
                                                          .prayerInputController!,
                                                      options: options.toList(),
                                                      onSelected: onSelected,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      textHighlightStyle:
                                                          TextStyle(),
                                                      elevation: 4.0,
                                                      optionBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      optionHighlightColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      maxHeight: 200.0,
                                                    );
                                                  },
                                                  onSelected:
                                                      (String selection) {
                                                    setState(() => _model
                                                            .prayerInputSelectedOption =
                                                        selection);
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                  },
                                                  fieldViewBuilder: (
                                                    context,
                                                    textEditingController,
                                                    focusNode,
                                                    onEditingComplete,
                                                  ) {
                                                    _model.prayerInputController =
                                                        textEditingController;
                                                    return TextFormField(
                                                      key:
                                                          _model.prayerInputKey,
                                                      controller:
                                                          textEditingController,
                                                      focusNode: focusNode,
                                                      onEditingComplete:
                                                          onEditingComplete,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            containerHowAreYouTodayPrayersRecord
                                                                .prayer,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFA8A8A8),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      maxLines: 6,
                                                      validator: _model
                                                          .prayerInputControllerValidator
                                                          .asValidator(context),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Theme(
                                                        data: ThemeData(
                                                          checkboxTheme:
                                                              CheckboxThemeData(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                          ),
                                                          unselectedWidgetColor:
                                                              Color(0xFFF5F5F5),
                                                        ),
                                                        child: Checkbox(
                                                          value: _model
                                                                  .checkboxPrayerValue ??=
                                                              true,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                    .checkboxPrayerValue =
                                                                newValue!);
                                                          },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      ),
                                                      SelectionArea(
                                                          child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'z9p0pah9' /* Submit your prayer for public */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'EDIT_PRAYER_BOTTOM_SHEET_SUBMIT_PRAYER_B');
                                                      if (widget.prayerRef !=
                                                          null) {
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await widget.prayerRef!
                                                            .update(
                                                                createPrayersRecordData(
                                                          prayer: _model
                                                              .prayerInputController
                                                              .text,
                                                          isPublic: /* NOT RECOMMENDED */
                                                              _model.prayerInputController
                                                                      .text ==
                                                                  'true',
                                                          physically: _model
                                                              .sliderPhysicallyValue,
                                                          mentally: _model
                                                              .sliderMentallyValue,
                                                          spiritually: _model
                                                              .sliderSpiritualValue,
                                                        ));
                                                        logFirebaseEvent(
                                                            'Button_alert_dialog');
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Success'),
                                                              content: Text(
                                                                  'Your prayer has been edited.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_close_dialog,_drawer,_etc');
                                                        Navigator.pop(context);
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await ActivityLogRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createActivityLogRecordData(
                                                              activity:
                                                                  'Prayer edited',
                                                              time:
                                                                  getCurrentTimestamp,
                                                              user:
                                                                  currentUserDisplayName,
                                                              showUser: true,
                                                              prayer: widget
                                                                  .prayerRef,
                                                            ));
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        var discipleshipReportRecordReference =
                                                            DiscipleshipReportRecord
                                                                .collection
                                                                .doc();
                                                        await discipleshipReportRecordReference
                                                            .set(
                                                                createDiscipleshipReportRecordData(
                                                          user:
                                                              currentUserReference,
                                                          timeSubmitted:
                                                              getCurrentTimestamp,
                                                          timeSubmittedString: functions
                                                              .pullDateFromTimeStamp(
                                                                  getCurrentTimestamp),
                                                          physically: _model
                                                              .sliderPhysicallyValue,
                                                          mentally: _model
                                                              .sliderMentallyValue,
                                                          spiritually: _model
                                                              .sliderSpiritualValue,
                                                        ));
                                                        _model.newDiscipleshipReport =
                                                            DiscipleshipReportRecord
                                                                .getDocumentFromData(
                                                                    createDiscipleshipReportRecordData(
                                                                      user:
                                                                          currentUserReference,
                                                                      timeSubmitted:
                                                                          getCurrentTimestamp,
                                                                      timeSubmittedString:
                                                                          functions
                                                                              .pullDateFromTimeStamp(getCurrentTimestamp),
                                                                      physically:
                                                                          _model
                                                                              .sliderPhysicallyValue,
                                                                      mentally:
                                                                          _model
                                                                              .sliderMentallyValue,
                                                                      spiritually:
                                                                          _model
                                                                              .sliderSpiritualValue,
                                                                    ),
                                                                    discipleshipReportRecordReference);
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await PrayersRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createPrayersRecordData(
                                                              user:
                                                                  currentUserReference,
                                                              prayer: _model
                                                                  .prayerInputController
                                                                  .text,
                                                              isPublic: _model
                                                                  .checkboxPrayerValue,
                                                              timeSubmitted:
                                                                  getCurrentTimestamp,
                                                              timeSubmittedString:
                                                                  functions
                                                                      .pullDateFromTimeStamp(
                                                                          getCurrentTimestamp),
                                                              linkedReport: _model
                                                                  .newDiscipleshipReport!
                                                                  .reference,
                                                              userDisplayName:
                                                                  currentUserDisplayName,
                                                              physically: _model
                                                                  .sliderPhysicallyValue,
                                                              mentally: _model
                                                                  .sliderMentallyValue,
                                                              spiritually: _model
                                                                  .sliderSpiritualValue,
                                                              expiration: functions
                                                                  .add14Days(
                                                                      getCurrentTimestamp),
                                                            ));
                                                        logFirebaseEvent(
                                                            'Button_alert_dialog');
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Success'),
                                                              content: Text(
                                                                  'Your prayer has been submittted.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_close_dialog,_drawer,_etc');
                                                        Navigator.pop(context);
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await ActivityLogRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createActivityLogRecordData(
                                                              activity:
                                                                  'Prayer submitted',
                                                              time:
                                                                  getCurrentTimestamp,
                                                              user:
                                                                  currentUserDisplayName,
                                                              showUser: true,
                                                              prayer: widget
                                                                  .prayerRef,
                                                            ));
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'fli55c9v' /* Submit Prayer */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 4.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                if (widget.prayerRef != null)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'EDIT_PRAYER_BOTTOM_SHEET_DELETE_PRAYER_B');
                                                        logFirebaseEvent(
                                                            'Button_alert_dialog');
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Are you sure?'),
                                                                      content: Text(
                                                                          'Are you sure you want to delete this prayer?  This cannot be undone.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Cancel'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Delete'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          logFirebaseEvent(
                                                              'Button_backend_call');
                                                          await widget
                                                              .prayerRef!
                                                              .delete();
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          await ActivityLogRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createActivityLogRecordData(
                                                                activity:
                                                                    'Prayer deleted - ${containerHowAreYouTodayPrayersRecord.prayer}',
                                                                time:
                                                                    getCurrentTimestamp,
                                                                user:
                                                                    currentUserDisplayName,
                                                                showUser: true,
                                                              ));
                                                          logFirebaseEvent(
                                                              'Button_close_dialog,_drawer,_etc');
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                        logFirebaseEvent(
                                                            'Button_close_dialog,_drawer,_etc');
                                                        Navigator.pop(context);
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'lo78i6ep' /* Delete Prayer */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 4.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
