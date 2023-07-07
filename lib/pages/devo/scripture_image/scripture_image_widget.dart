import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'scripture_image_model.dart';
export 'scripture_image_model.dart';

class ScriptureImageWidget extends StatefulWidget {
  const ScriptureImageWidget({
    Key? key,
    this.verseRef,
    this.passage,
  }) : super(key: key);

  final String? verseRef;
  final String? passage;

  @override
  _ScriptureImageWidgetState createState() => _ScriptureImageWidgetState();
}

class _ScriptureImageWidgetState extends State<ScriptureImageWidget> {
  late ScriptureImageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScriptureImageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ScriptureImage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCRIPTURE_IMAGE_ScriptureImage_ON_INIT_S');
      logFirebaseEvent('ScriptureImage_update_app_state');
      FFAppState().update(() {
        FFAppState().showImageButton = false;
      });
      logFirebaseEvent('ScriptureImage_backend_call');
      _model.apiResultrxq = await MakeVerseGraphicCall.call(
        verseRef: widget.verseRef,
        passage: functions.removeSpacesFromPassageCopy(widget.passage),
      );
      if ((_model.apiResultrxq?.succeeded ?? true)) {
        logFirebaseEvent('ScriptureImage_update_app_state');
        FFAppState().update(() {
          FFAppState().showImageButton = true;
        });
        logFirebaseEvent('ScriptureImage_backend_call');

        await ActivityLogRecord.collection
            .doc()
            .set(createActivityLogRecordData(
              activity: 'Image created: ${MakeVerseGraphicCall.imagePath(
                (_model.apiResultrxq?.jsonBody ?? ''),
              ).toString().toString()}',
              time: getCurrentTimestamp,
              user: currentUserDisplayName,
            ));
        return;
      } else {
        logFirebaseEvent('ScriptureImage_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Oops'),
              content: Text(
                  'This was a problem making the graphic.  Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        logFirebaseEvent('ScriptureImage_backend_call');

        await ActivityLogRecord.collection
            .doc()
            .set(createActivityLogRecordData(
              activity: 'Image creation failed.',
              time: getCurrentTimestamp,
              user: currentUserDisplayName,
            ));
        return;
      }
    });

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
        title: 'ScriptureImage',
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
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('SCRIPTURE_IMAGE_Icon_669qipic_ON_TAP');
                    logFirebaseEvent('Icon_navigate_to');

                    context.pushNamed('Home');
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 24.0,
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'SCRIPTURE_IMAGE_Icon_jn3rk25e_ON_TAP');
                        logFirebaseEvent('Icon_drawer');
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: Icon(
                        Icons.settings_outlined,
                        color: Color(0xFFE8602F),
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/LiveTV_Logo_White.png',
                      width: 150.0,
                      height: 100.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!FFAppState().showImageButton)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '7l0otpwu' /* We are working on your image */,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    if (FFAppState().showImageButton)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                's2n0euug' /* Your image is done! */,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    if (!FFAppState().showImageButton)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie_animations/109744-blue-image-loading.json',
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: 250.0,
                              fit: BoxFit.cover,
                              animate: true,
                            ),
                          ],
                        ),
                      ),
                    if (FFAppState().showImageButton)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              MakeVerseGraphicCall.imagePath(
                                (_model.apiResultrxq?.jsonBody ?? ''),
                              ),
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    if (FFAppState().showImageButton)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SCRIPTURE_IMAGE_DOWNLOAD_IMAGE_BTN_ON_TA');
                                logFirebaseEvent('Button_launch_u_r_l');
                                await launchURL(MakeVerseGraphicCall.imagePath(
                                  (_model.apiResultrxq?.jsonBody ?? ''),
                                ).toString());
                              },
                              text: FFLocalizations.of(context).getText(
                                'sd0n14hi' /* Download Image */,
                              ),
                              options: FFButtonOptions(
                                width: 180.0,
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
                    if (valueOrDefault<bool>(currentUserDocument?.admin, false))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.verseRef!,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (valueOrDefault<bool>(currentUserDocument?.admin, false))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  functions.removeSpacesFromPassageCopy(
                                      widget.passage),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
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
