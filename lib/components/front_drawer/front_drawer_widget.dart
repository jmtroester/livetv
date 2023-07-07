import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'front_drawer_model.dart';
export 'front_drawer_model.dart';

class FrontDrawerWidget extends StatefulWidget {
  const FrontDrawerWidget({Key? key}) : super(key: key);

  @override
  _FrontDrawerWidgetState createState() => _FrontDrawerWidgetState();
}

class _FrontDrawerWidgetState extends State<FrontDrawerWidget> {
  late FrontDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FrontDrawerModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FRONT_DRAWER_COMP_Row_wnxelzni_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed(
                            'DailyDevoInfo',
                            queryParameters: {
                              'datePicked': serializeParam(
                                getCurrentTimestamp,
                                ParamType.DateTime,
                              ),
                              'dateString': serializeParam(
                                functions
                                    .pullDateFromTimeStamp(getCurrentTimestamp),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          logFirebaseEvent('Row_haptic_feedback');
                          HapticFeedback.selectionClick();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientText(
                              FFLocalizations.of(context).getText(
                                'iwrn0yaa' /* Daily Worship */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 35.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Colors.white
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FRONT_DRAWER_COMP_Row_5y0w7sum_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed('Bible');

                          logFirebaseEvent('Row_haptic_feedback');
                          HapticFeedback.selectionClick();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientText(
                              FFLocalizations.of(context).getText(
                                '53eka271' /* Bible */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 35.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Colors.white
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FRONT_DRAWER_COMP_Row_h3x4kvhb_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed('SermonNav');

                          logFirebaseEvent('Row_haptic_feedback');
                          HapticFeedback.selectionClick();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientText(
                              FFLocalizations.of(context).getText(
                                'taiqm5mg' /* Teaching */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 35.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Colors.white
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FRONT_DRAWER_COMP_Row_mvt3gwgx_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed('bibleStudy1');

                          logFirebaseEvent('Row_haptic_feedback');
                          HapticFeedback.selectionClick();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientText(
                              FFLocalizations.of(context).getText(
                                'gcuwpqs8' /* Study a Verse */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 35.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Colors.white
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FRONT_DRAWER_COMP_Row_fma2hrbr_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed('allChats');

                          logFirebaseEvent('Row_haptic_feedback');
                          HapticFeedback.selectionClick();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientText(
                              FFLocalizations.of(context).getText(
                                'eqskyudp' /* Chat */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 35.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Colors.white
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FRONT_DRAWER_COMP_Row_lvdiydou_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed('socialFeed');

                          logFirebaseEvent('Row_haptic_feedback');
                          HapticFeedback.selectionClick();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientText(
                              FFLocalizations.of(context).getText(
                                '4s4vwn09' /* Social Feed */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 35.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Colors.white
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FRONT_DRAWER_COMP_Row_j2815tgq_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed('AllJournals');

                          logFirebaseEvent('Row_haptic_feedback');
                          HapticFeedback.selectionClick();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientText(
                              FFLocalizations.of(context).getText(
                                'low8ry54' /* My Journals */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 35.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Colors.white
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'FRONT_DRAWER_COMP_Row_we42ucop_ON_TAP');
                          logFirebaseEvent('Row_navigate_to');

                          context.pushNamed('bibleStudyNotesAll');

                          logFirebaseEvent('Row_haptic_feedback');
                          HapticFeedback.selectionClick();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GradientText(
                              FFLocalizations.of(context).getText(
                                '3jagxthm' /* My Notes */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 35.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Colors.white
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
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
        ),
      ],
    );
  }
}
