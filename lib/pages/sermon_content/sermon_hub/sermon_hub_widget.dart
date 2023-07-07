import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sermon_hub_model.dart';
export 'sermon_hub_model.dart';

class SermonHubWidget extends StatefulWidget {
  const SermonHubWidget({Key? key}) : super(key: key);

  @override
  _SermonHubWidgetState createState() => _SermonHubWidgetState();
}

class _SermonHubWidgetState extends State<SermonHubWidget> {
  late SermonHubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SermonHubModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SermonHub'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SERMON_HUB_PAGE_SermonHub_ON_INIT_STATE');
      logFirebaseEvent('SermonHub_update_app_state');
      FFAppState().update(() {
        FFAppState().allSermons = true;
        FFAppState().filterBySeries = false;
      });
      logFirebaseEvent('SermonHub_update_app_state');
      FFAppState().update(() {
        FFAppState().filterByTopic = false;
        FFAppState().filterByBook = false;
      });
    });

    _model.textFieldTopicAutoFillController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Sermon Hub',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            endDrawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.endDrawerModel,
                updateCallback: () => setState(() {}),
                child: EndDrawerWidget(),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: Colors.black,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('SERMON_HUB_PAGE_arrow_back_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Image.asset(
                          'assets/images/LiveTV_Logo_White.png',
                          width: 150.0,
                          height: 100.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                toolbarHeight: 70.0,
                elevation: 4.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 5.0),
                                  child:
                                      StreamBuilder<List<SermonSeriesRecord>>(
                                    stream: querySermonSeriesRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<SermonSeriesRecord>
                                          dropDownSeriesSermonSeriesRecordList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownSeriesValueController ??=
                                            FormFieldController<String>(null),
                                        options:
                                            dropDownSeriesSermonSeriesRecordList
                                                .map((e) => e.sermonSeriesName)
                                                .toList(),
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.dropDownSeriesValue = val);
                                          logFirebaseEvent(
                                              'SERMON_HUB_DropDownSeries_ON_FORM_WIDGET');
                                          logFirebaseEvent(
                                              'DropDownSeries_update_app_state');
                                          FFAppState().update(() {
                                            FFAppState().allSermons = false;
                                            FFAppState().filterBySeries = true;
                                            FFAppState().filterByTopic = false;
                                          });
                                        },
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF57636C),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'g3vdh08z' /* Select series... */,
                                        ),
                                        fillColor: Colors.white,
                                        elevation: 4.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineColor,
                                        borderWidth: 1.0,
                                        borderRadius: 4.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: StreamBuilder<List<SermonTopicRecord>>(
                                  stream: querySermonTopicRecord(
                                    queryBuilder: (sermonTopicRecord) =>
                                        sermonTopicRecord
                                            .orderBy('sermon_topic_name'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    List<SermonTopicRecord>
                                        textFieldTopicAutoFillSermonTopicRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: Autocomplete<String>(
                                        initialValue: TextEditingValue(),
                                        optionsBuilder: (textEditingValue) {
                                          if (textEditingValue.text == '') {
                                            return const Iterable<
                                                String>.empty();
                                          }
                                          return textFieldTopicAutoFillSermonTopicRecordList
                                              .map((e) => e.sermonTopicName)
                                              .toList()
                                              .where((option) {
                                            final lowercaseOption =
                                                option.toLowerCase();
                                            return lowercaseOption.contains(
                                                textEditingValue.text
                                                    .toLowerCase());
                                          });
                                        },
                                        optionsViewBuilder:
                                            (context, onSelected, options) {
                                          return AutocompleteOptionsList(
                                            textFieldKey: _model
                                                .textFieldTopicAutoFillKey,
                                            textController: _model
                                                .textFieldTopicAutoFillController!,
                                            options: options.toList(),
                                            onSelected: onSelected,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: Colors.black,
                                                    ),
                                            textHighlightStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: Colors.black,
                                                    ),
                                            elevation: 4.0,
                                            optionBackgroundColor: Colors.white,
                                            optionHighlightColor:
                                                FlutterFlowTheme.of(context)
                                                    .gray200,
                                          );
                                        },
                                        onSelected: (String selection) {
                                          setState(() => _model
                                                  .textFieldTopicAutoFillSelectedOption =
                                              selection);
                                          FocusScope.of(context).unfocus();
                                        },
                                        fieldViewBuilder: (
                                          context,
                                          textEditingController,
                                          focusNode,
                                          onEditingComplete,
                                        ) {
                                          _model.textFieldTopicAutoFillController =
                                              textEditingController;
                                          return TextFormField(
                                            key: _model
                                                .textFieldTopicAutoFillKey,
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            onEditingComplete:
                                                onEditingComplete,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textFieldTopicAutoFillController',
                                              Duration(milliseconds: 2000),
                                              () async {
                                                logFirebaseEvent(
                                                    'SERMON_HUB_TextField-TopicAutoFill_ON_TE');
                                                logFirebaseEvent(
                                                    'TextField-TopicAutoFill_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().allSermons =
                                                      false;
                                                  FFAppState().filterBySeries =
                                                      false;
                                                  FFAppState().filterByTopic =
                                                      true;
                                                });
                                              },
                                            ),
                                            textCapitalization:
                                                TextCapitalization.words,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.black,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              suffixIcon: _model
                                                      .textFieldTopicAutoFillController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .textFieldTopicAutoFillController
                                                            ?.clear();
                                                        logFirebaseEvent(
                                                            'SERMON_HUB_TextField-TopicAutoFill_ON_TE');
                                                        logFirebaseEvent(
                                                            'TextField-TopicAutoFill_update_app_state');
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .allSermons =
                                                              false;
                                                          FFAppState()
                                                                  .filterBySeries =
                                                              false;
                                                          FFAppState()
                                                                  .filterByTopic =
                                                              true;
                                                        });
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22.0,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                            validator: _model
                                                .textFieldTopicAutoFillControllerValidator
                                                .asValidator(context),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '5nnp2ndu' /* Sermon Jams (1-7 mins) */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Switch(
                                    value: _model.switchValue ??= true,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => _model.switchValue = newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ymjm7vdg' /* Full Sermons (30-60 mins) */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SERMON_HUB_PAGE_CLEAR_FILTER_BTN_ON_TAP');
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().update(() {
                                        FFAppState().allSermons = true;
                                        FFAppState().filterBySeries = false;
                                        FFAppState().filterByTopic = false;
                                      });
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'ki6j5ew3' /* Clear Filter */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 250.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (FFAppState().allSermons)
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 0.0),
                              child: StreamBuilder<List<SermonHubRecord>>(
                                stream: querySermonHubRecord(
                                  queryBuilder: (sermonHubRecord) =>
                                      sermonHubRecord
                                          .where('full_sermon',
                                              isEqualTo: _model.switchValue)
                                          .orderBy('date_presented',
                                              descending: true),
                                  limit: 30,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    );
                                  }
                                  List<SermonHubRecord>
                                      listViewSermonHubRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewSermonHubRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewSermonHubRecord =
                                          listViewSermonHubRecordList[
                                              listViewIndex];
                                      return badges.Badge(
                                        badgeContent: Text(
                                          FFLocalizations.of(context).getText(
                                            'ko0m3hbx' /* NEW */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Colors.white,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        showBadge: false,
                                        shape: badges.BadgeShape.circle,
                                        badgeColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        elevation: 4.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        position: badges.BadgePosition.topEnd(),
                                        animationType:
                                            badges.BadgeAnimationType.scale,
                                        toAnimate: true,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SERMON_HUB_PAGE_videoCard_ON_TAP');
                                                if ((currentUserDocument
                                                            ?.sermonsWatched
                                                            ?.toList() ??
                                                        [])
                                                    .contains(
                                                        listViewSermonHubRecord
                                                            .videoId)) {
                                                  logFirebaseEvent(
                                                      'videoCard_navigate_to');

                                                  context.pushNamed(
                                                    'videoPage',
                                                    queryParameters: {
                                                      'videoLink':
                                                          serializeParam(
                                                        listViewSermonHubRecord
                                                            .videoLink,
                                                        ParamType.String,
                                                      ),
                                                      'videoName':
                                                          serializeParam(
                                                        listViewSermonHubRecord
                                                            .sermonName,
                                                        ParamType.String,
                                                      ),
                                                      'videoThumbnail':
                                                          serializeParam(
                                                        listViewSermonHubRecord
                                                            .sermonThumbnail,
                                                        ParamType.String,
                                                      ),
                                                      'audioLink':
                                                          serializeParam(
                                                        listViewSermonHubRecord
                                                            .audioLink,
                                                        ParamType.String,
                                                      ),
                                                      'audioID': serializeParam(
                                                        listViewSermonHubRecord
                                                            .audioId,
                                                        ParamType.int,
                                                      ),
                                                      'videoURL':
                                                          serializeParam(
                                                        listViewSermonHubRecord
                                                            .urlString,
                                                        ParamType.String,
                                                      ),
                                                      'levelUp': serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.points,
                                                          0) >=
                                                      86) {
                                                    logFirebaseEvent(
                                                        'videoCard_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      'points':
                                                          FieldValue.increment(
                                                              -(85)),
                                                      'level_id':
                                                          FieldValue.increment(
                                                              1),
                                                    });
                                                    logFirebaseEvent(
                                                        'videoCard_navigate_to');

                                                    context.pushNamed(
                                                      'videoPage',
                                                      queryParameters: {
                                                        'videoLink':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .videoLink,
                                                          ParamType.String,
                                                        ),
                                                        'videoName':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .sermonName,
                                                          ParamType.String,
                                                        ),
                                                        'videoThumbnail':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .sermonThumbnail,
                                                          ParamType.String,
                                                        ),
                                                        'audioLink':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .audioLink,
                                                          ParamType.String,
                                                        ),
                                                        'audioID':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .audioId,
                                                          ParamType.int,
                                                        ),
                                                        'videoURL':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .urlString,
                                                          ParamType.String,
                                                        ),
                                                        'levelUp':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'videoCard_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      'points':
                                                          FieldValue.increment(
                                                              15),
                                                    });
                                                    logFirebaseEvent(
                                                        'videoCard_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'You\'ve been awarded 15 points!',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 6000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'videoCard_haptic_feedback');
                                                    HapticFeedback
                                                        .heavyImpact();
                                                    logFirebaseEvent(
                                                        'videoCard_navigate_to');

                                                    context.pushNamed(
                                                      'videoPage',
                                                      queryParameters: {
                                                        'videoLink':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .videoLink,
                                                          ParamType.String,
                                                        ),
                                                        'videoName':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .sermonName,
                                                          ParamType.String,
                                                        ),
                                                        'videoThumbnail':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .sermonThumbnail,
                                                          ParamType.String,
                                                        ),
                                                        'audioLink':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .audioLink,
                                                          ParamType.String,
                                                        ),
                                                        'audioID':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .audioId,
                                                          ParamType.int,
                                                        ),
                                                        'videoURL':
                                                            serializeParam(
                                                          listViewSermonHubRecord
                                                              .urlString,
                                                          ParamType.String,
                                                        ),
                                                        'levelUp':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  }
                                                }

                                                if (listViewSermonHubRecord
                                                        .fullSermon ==
                                                    true) {
                                                  logFirebaseEvent(
                                                      'videoCard_backend_call');

                                                  await currentUserReference!
                                                      .update({
                                                    'sermons_watched':
                                                        FieldValue.arrayUnion([
                                                      listViewSermonHubRecord
                                                          .videoId
                                                    ]),
                                                  });
                                                } else {
                                                  logFirebaseEvent(
                                                      'videoCard_backend_call');

                                                  await currentUserReference!
                                                      .update({
                                                    'shorts_watched':
                                                        FieldValue.arrayUnion([
                                                      listViewSermonHubRecord
                                                          .videoId
                                                    ]),
                                                  });
                                                }

                                                logFirebaseEvent(
                                                    'videoCard_haptic_feedback');
                                                HapticFeedback.selectionClick();
                                                logFirebaseEvent(
                                                    'videoCard_backend_call');

                                                await ActivityLogRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        createActivityLogRecordData(
                                                      activity:
                                                          'Full Sermon - ${listViewSermonHubRecord.sermonName}',
                                                      time: getCurrentTimestamp,
                                                      user:
                                                          currentUserDisplayName,
                                                      showUser: true,
                                                    ));
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x230E151B),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      child: Image.network(
                                                        listViewSermonHubRecord
                                                            .sermonThumbnail,
                                                        width: 180.0,
                                                        height: 120.0,
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.9, 0.85),
                                                      child: Container(
                                                        width: 32.0,
                                                        height: 32.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x230E151B),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .play_arrow_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  190.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AutoSizeText(
                                                            listViewSermonHubRecord
                                                                .sermonName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              AutoSizeText(
                                                                listViewSermonHubRecord
                                                                    .text,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (!(listViewSermonHubRecord
                                                                .fullSermon ==
                                                            true
                                                        ? (currentUserDocument
                                                                    ?.sermonsWatched
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(
                                                                listViewSermonHubRecord
                                                                    .videoId)
                                                        : (currentUserDocument
                                                                    ?.shortsWatched
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(
                                                                listViewSermonHubRecord
                                                                    .videoId)))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Container(
                                                            width: 50.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        11.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'q2gadoq8' /* NEW */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().filterBySeries)
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: StreamBuilder<List<SermonSeriesRecord>>(
                            stream: querySermonSeriesRecord(
                              queryBuilder: (sermonSeriesRecord) =>
                                  sermonSeriesRecord.where('sermon_series_name',
                                      isEqualTo: _model.dropDownSeriesValue),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<SermonSeriesRecord>
                                  containerSermonSeriesRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerSermonSeriesRecord =
                                  containerSermonSeriesRecordList.isNotEmpty
                                      ? containerSermonSeriesRecordList.first
                                      : null;
                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 0.0),
                                  child: StreamBuilder<List<SermonHubRecord>>(
                                    stream: querySermonHubRecord(
                                      queryBuilder: (sermonHubRecord) =>
                                          sermonHubRecord
                                              .where('sermon_series',
                                                  isEqualTo:
                                                      containerSermonSeriesRecord!
                                                          .reference)
                                              .where('full_sermon',
                                                  isEqualTo: _model.switchValue)
                                              .orderBy('date_presented',
                                                  descending: true),
                                      limit: 30,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<SermonHubRecord>
                                          listViewSermonHubRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewSermonHubRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewSermonHubRecord =
                                              listViewSermonHubRecordList[
                                                  listViewIndex];
                                          return badges.Badge(
                                            badgeContent: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'q8ajado9' /* NEW */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            showBadge: false,
                                            shape: badges.BadgeShape.circle,
                                            badgeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            elevation: 4.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            position:
                                                badges.BadgePosition.topEnd(),
                                            animationType:
                                                badges.BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SERMON_HUB_PAGE_videoCard_ON_TAP');
                                                    if ((currentUserDocument
                                                                ?.sermonsWatched
                                                                ?.toList() ??
                                                            [])
                                                        .contains(
                                                            listViewSermonHubRecord
                                                                .videoId)) {
                                                      logFirebaseEvent(
                                                          'videoCard_navigate_to');

                                                      context.pushNamed(
                                                        'videoPage',
                                                        queryParameters: {
                                                          'videoLink':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .videoLink,
                                                            ParamType.String,
                                                          ),
                                                          'videoName':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .sermonName,
                                                            ParamType.String,
                                                          ),
                                                          'videoThumbnail':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .sermonThumbnail,
                                                            ParamType.String,
                                                          ),
                                                          'audioLink':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .audioLink,
                                                            ParamType.String,
                                                          ),
                                                          'audioID':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .audioId,
                                                            ParamType.int,
                                                          ),
                                                          'videoURL':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .urlString,
                                                            ParamType.String,
                                                          ),
                                                          'levelUp':
                                                              serializeParam(
                                                            false,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.points,
                                                              0) >=
                                                          86) {
                                                        logFirebaseEvent(
                                                            'videoCard_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          'points': FieldValue
                                                              .increment(-(85)),
                                                          'level_id': FieldValue
                                                              .increment(1),
                                                        });
                                                        logFirebaseEvent(
                                                            'videoCard_navigate_to');

                                                        context.pushNamed(
                                                          'videoPage',
                                                          queryParameters: {
                                                            'videoLink':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .videoLink,
                                                              ParamType.String,
                                                            ),
                                                            'videoName':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .sermonName,
                                                              ParamType.String,
                                                            ),
                                                            'videoThumbnail':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .sermonThumbnail,
                                                              ParamType.String,
                                                            ),
                                                            'audioLink':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .audioLink,
                                                              ParamType.String,
                                                            ),
                                                            'audioID':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .audioId,
                                                              ParamType.int,
                                                            ),
                                                            'videoURL':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .urlString,
                                                              ParamType.String,
                                                            ),
                                                            'levelUp':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        logFirebaseEvent(
                                                            'videoCard_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          'points': FieldValue
                                                              .increment(15),
                                                        });
                                                        logFirebaseEvent(
                                                            'videoCard_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'You\'ve been awarded 15 points!',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    6000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'videoCard_haptic_feedback');
                                                        HapticFeedback
                                                            .heavyImpact();
                                                        logFirebaseEvent(
                                                            'videoCard_navigate_to');

                                                        context.pushNamed(
                                                          'videoPage',
                                                          queryParameters: {
                                                            'videoLink':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .videoLink,
                                                              ParamType.String,
                                                            ),
                                                            'videoName':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .sermonName,
                                                              ParamType.String,
                                                            ),
                                                            'videoThumbnail':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .sermonThumbnail,
                                                              ParamType.String,
                                                            ),
                                                            'audioLink':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .audioLink,
                                                              ParamType.String,
                                                            ),
                                                            'audioID':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .audioId,
                                                              ParamType.int,
                                                            ),
                                                            'videoURL':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .urlString,
                                                              ParamType.String,
                                                            ),
                                                            'levelUp':
                                                                serializeParam(
                                                              false,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    }

                                                    if (listViewSermonHubRecord
                                                            .fullSermon ==
                                                        true) {
                                                      logFirebaseEvent(
                                                          'videoCard_backend_call');

                                                      await currentUserReference!
                                                          .update({
                                                        'sermons_watched':
                                                            FieldValue
                                                                .arrayUnion([
                                                          listViewSermonHubRecord
                                                              .videoId
                                                        ]),
                                                      });
                                                    } else {
                                                      logFirebaseEvent(
                                                          'videoCard_backend_call');

                                                      await currentUserReference!
                                                          .update({
                                                        'shorts_watched':
                                                            FieldValue
                                                                .arrayUnion([
                                                          listViewSermonHubRecord
                                                              .videoId
                                                        ]),
                                                      });
                                                    }

                                                    logFirebaseEvent(
                                                        'videoCard_haptic_feedback');
                                                    HapticFeedback
                                                        .selectionClick();
                                                    logFirebaseEvent(
                                                        'videoCard_backend_call');

                                                    await ActivityLogRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createActivityLogRecordData(
                                                          activity:
                                                              'Full Sermon - ${listViewSermonHubRecord.sermonName}',
                                                          time:
                                                              getCurrentTimestamp,
                                                          user:
                                                              currentUserDisplayName,
                                                          showUser: true,
                                                        ));
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x230E151B),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                          child: Image.network(
                                                            listViewSermonHubRecord
                                                                .sermonThumbnail,
                                                            width: 170.0,
                                                            height: 100.0,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.9, 0.85),
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x230E151B),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .play_arrow_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      180.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AutoSizeText(
                                                                listViewSermonHubRecord
                                                                    .sermonName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  AutoSizeText(
                                                                    listViewSermonHubRecord
                                                                        .text,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (!(listViewSermonHubRecord
                                                                    .fullSermon ==
                                                                true
                                                            ? (currentUserDocument
                                                                        ?.sermonsWatched
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    listViewSermonHubRecord
                                                                        .videoId)
                                                            : (currentUserDocument
                                                                        ?.shortsWatched
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    listViewSermonHubRecord
                                                                        .videoId)))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                width: 50.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cj1vk2nd' /* NEW */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    if (FFAppState().filterByTopic)
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: StreamBuilder<List<SermonTopicRecord>>(
                            stream: querySermonTopicRecord(
                              queryBuilder: (sermonTopicRecord) =>
                                  sermonTopicRecord.where('sermon_topic_name',
                                      isEqualTo: _model
                                          .textFieldTopicAutoFillSelectedOption),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<SermonTopicRecord>
                                  containerSermonTopicRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerSermonTopicRecord =
                                  containerSermonTopicRecordList.isNotEmpty
                                      ? containerSermonTopicRecordList.first
                                      : null;
                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 0.0),
                                  child: StreamBuilder<List<SermonHubRecord>>(
                                    stream: querySermonHubRecord(
                                      queryBuilder: (sermonHubRecord) =>
                                          sermonHubRecord
                                              .where('sermon_topic',
                                                  arrayContains:
                                                      containerSermonTopicRecord!
                                                          .reference)
                                              .where('full_sermon',
                                                  isEqualTo: _model.switchValue)
                                              .orderBy('date_presented',
                                                  descending: true),
                                      limit: 30,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<SermonHubRecord>
                                          listViewSermonHubRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewSermonHubRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewSermonHubRecord =
                                              listViewSermonHubRecordList[
                                                  listViewIndex];
                                          return badges.Badge(
                                            badgeContent: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '562qwuve' /* NEW */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            showBadge: false,
                                            shape: badges.BadgeShape.circle,
                                            badgeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            elevation: 4.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            position:
                                                badges.BadgePosition.topEnd(),
                                            animationType:
                                                badges.BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SERMON_HUB_PAGE_videoCard_ON_TAP');
                                                    if ((currentUserDocument
                                                                ?.sermonsWatched
                                                                ?.toList() ??
                                                            [])
                                                        .contains(
                                                            listViewSermonHubRecord
                                                                .videoId)) {
                                                      logFirebaseEvent(
                                                          'videoCard_navigate_to');

                                                      context.pushNamed(
                                                        'videoPage',
                                                        queryParameters: {
                                                          'videoLink':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .videoLink,
                                                            ParamType.String,
                                                          ),
                                                          'videoName':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .sermonName,
                                                            ParamType.String,
                                                          ),
                                                          'videoThumbnail':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .sermonThumbnail,
                                                            ParamType.String,
                                                          ),
                                                          'audioLink':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .audioLink,
                                                            ParamType.String,
                                                          ),
                                                          'audioID':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .audioId,
                                                            ParamType.int,
                                                          ),
                                                          'videoURL':
                                                              serializeParam(
                                                            listViewSermonHubRecord
                                                                .urlString,
                                                            ParamType.String,
                                                          ),
                                                          'levelUp':
                                                              serializeParam(
                                                            false,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.points,
                                                              0) >=
                                                          86) {
                                                        logFirebaseEvent(
                                                            'videoCard_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          'points': FieldValue
                                                              .increment(-(85)),
                                                          'level_id': FieldValue
                                                              .increment(1),
                                                        });
                                                        logFirebaseEvent(
                                                            'videoCard_navigate_to');

                                                        context.pushNamed(
                                                          'videoPage',
                                                          queryParameters: {
                                                            'videoLink':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .videoLink,
                                                              ParamType.String,
                                                            ),
                                                            'videoName':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .sermonName,
                                                              ParamType.String,
                                                            ),
                                                            'videoThumbnail':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .sermonThumbnail,
                                                              ParamType.String,
                                                            ),
                                                            'audioLink':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .audioLink,
                                                              ParamType.String,
                                                            ),
                                                            'audioID':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .audioId,
                                                              ParamType.int,
                                                            ),
                                                            'videoURL':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .urlString,
                                                              ParamType.String,
                                                            ),
                                                            'levelUp':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        logFirebaseEvent(
                                                            'videoCard_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          'points': FieldValue
                                                              .increment(15),
                                                        });
                                                        logFirebaseEvent(
                                                            'videoCard_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'You\'ve been awarded 15 points!',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    6000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'videoCard_haptic_feedback');
                                                        HapticFeedback
                                                            .heavyImpact();
                                                        logFirebaseEvent(
                                                            'videoCard_navigate_to');

                                                        context.pushNamed(
                                                          'videoPage',
                                                          queryParameters: {
                                                            'videoLink':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .videoLink,
                                                              ParamType.String,
                                                            ),
                                                            'videoName':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .sermonName,
                                                              ParamType.String,
                                                            ),
                                                            'videoThumbnail':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .sermonThumbnail,
                                                              ParamType.String,
                                                            ),
                                                            'audioLink':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .audioLink,
                                                              ParamType.String,
                                                            ),
                                                            'audioID':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .audioId,
                                                              ParamType.int,
                                                            ),
                                                            'videoURL':
                                                                serializeParam(
                                                              listViewSermonHubRecord
                                                                  .urlString,
                                                              ParamType.String,
                                                            ),
                                                            'levelUp':
                                                                serializeParam(
                                                              false,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    }

                                                    if (listViewSermonHubRecord
                                                            .fullSermon ==
                                                        true) {
                                                      logFirebaseEvent(
                                                          'videoCard_backend_call');

                                                      await currentUserReference!
                                                          .update({
                                                        'sermons_watched':
                                                            FieldValue
                                                                .arrayUnion([
                                                          listViewSermonHubRecord
                                                              .videoId
                                                        ]),
                                                      });
                                                    } else {
                                                      logFirebaseEvent(
                                                          'videoCard_backend_call');

                                                      await currentUserReference!
                                                          .update({
                                                        'shorts_watched':
                                                            FieldValue
                                                                .arrayUnion([
                                                          listViewSermonHubRecord
                                                              .videoId
                                                        ]),
                                                      });
                                                    }

                                                    logFirebaseEvent(
                                                        'videoCard_haptic_feedback');
                                                    HapticFeedback
                                                        .selectionClick();
                                                    logFirebaseEvent(
                                                        'videoCard_backend_call');

                                                    await ActivityLogRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createActivityLogRecordData(
                                                          activity:
                                                              'Full Sermon - ${listViewSermonHubRecord.sermonName}',
                                                          time:
                                                              getCurrentTimestamp,
                                                          user:
                                                              currentUserDisplayName,
                                                          showUser: true,
                                                        ));
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x230E151B),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                          child: Image.network(
                                                            listViewSermonHubRecord
                                                                .sermonThumbnail,
                                                            width: 170.0,
                                                            height: 100.0,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.9, 0.85),
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x230E151B),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .play_arrow_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      180.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AutoSizeText(
                                                                listViewSermonHubRecord
                                                                    .sermonName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  AutoSizeText(
                                                                    listViewSermonHubRecord
                                                                        .text,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (!(listViewSermonHubRecord
                                                                    .fullSermon ==
                                                                true
                                                            ? (currentUserDocument
                                                                        ?.sermonsWatched
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    listViewSermonHubRecord
                                                                        .videoId)
                                                            : (currentUserDocument
                                                                        ?.shortsWatched
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    listViewSermonHubRecord
                                                                        .videoId)))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                width: 50.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'zocmh1jb' /* NEW */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
