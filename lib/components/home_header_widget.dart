import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({Key key}) : super(key: key);

  @override
  _HomeHeaderWidgetState createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 240,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 240,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 240,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 240,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 240,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'progressBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 240,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
      child: Material(
        color: Colors.transparent,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).headerGray,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x2B202529),
                offset: Offset(0, 2),
                spreadRadius: 4,
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: AuthUserStreamWidget(
                                child: Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ).animated([
                                  animationsMap['textOnPageLoadAnimation1']
                                ]),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: AuthUserStreamWidget(
                                child: Text(
                                  'Level ${valueOrDefault(currentUserDocument?.levelId, 0).toString()}',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ).animated([
                                  animationsMap['textOnPageLoadAnimation2']
                                ]),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: AuthUserStreamWidget(
                                child: Text(
                                  'App version: ${valueOrDefault(currentUserDocument?.appVersion, '')}',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ).animated([
                                  animationsMap['textOnPageLoadAnimation3']
                                ]),
                              ),
                            ),
                            if ((valueOrDefault(
                                    currentUserDocument?.appVersion, '')) !=
                                '3.4.7')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: AuthUserStreamWidget(
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_HEADER_COMP_Text_v3ab1bln_ON_TAP');
                                      if (isAndroid) {
                                        logFirebaseEvent('Text_Launch-U-R-L');
                                        await launchURL(
                                            'https://play.google.com/store/apps/details?id=com.wearelive.livetv');
                                        return;
                                      } else {
                                        logFirebaseEvent('Text_Launch-U-R-L');
                                        await launchURL(
                                            'https://apps.apple.com/us/app/livetv-online/id1574611538');
                                        return;
                                      }
                                    },
                                    child: Text(
                                      'UPDATE APP',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF002AFF),
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ).animated([
                                    animationsMap['textOnPageLoadAnimation4']
                                  ]),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    AuthUserStreamWidget(
                      child: FutureBuilder<List<LevelsRecord>>(
                        future: queryLevelsRecordOnce(
                          queryBuilder: (levelsRecord) => levelsRecord.where(
                              'level_id',
                              isEqualTo: valueOrDefault(
                                  currentUserDocument?.levelId, 0)),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitWave(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<LevelsRecord> imageLevelsRecordList =
                              snapshot.data;
                          final imageLevelsRecord =
                              imageLevelsRecordList.isNotEmpty
                                  ? imageLevelsRecordList.first
                                  : null;
                          return Hero(
                            tag: imageLevelsRecord.levelImage,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(12),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                imageLevelsRecord.levelImage,
                                width: 140,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ).animated(
                              [animationsMap['imageOnPageLoadAnimation']]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 10, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            child: FutureBuilder<List<LevelsRecord>>(
                              future: queryLevelsRecordOnce(
                                queryBuilder: (levelsRecord) =>
                                    levelsRecord.where('level_id',
                                        isEqualTo: valueOrDefault(
                                            currentUserDocument?.levelId, 0)),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitWave(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<LevelsRecord> progressBarLevelsRecordList =
                                    snapshot.data;
                                final progressBarLevelsRecord =
                                    progressBarLevelsRecordList.isNotEmpty
                                        ? progressBarLevelsRecordList.first
                                        : null;
                                return LinearPercentIndicator(
                                  percent: functions.calcPercentage(
                                      progressBarLevelsRecord.minPoints,
                                      valueOrDefault(
                                          currentUserDocument?.points, 0)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  lineHeight: 25,
                                  animation: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  backgroundColor: Color(0xFFDFDFDF),
                                  center: Text(
                                    valueOrDefault(
                                            currentUserDocument?.points, 0)
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .black600,
                                        ),
                                  ),
                                  barRadius: Radius.circular(10),
                                  padding: EdgeInsets.zero,
                                ).animated([
                                  animationsMap[
                                      'progressBarOnPageLoadAnimation']
                                ]);
                              },
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
        ),
      ).animated([animationsMap['containerOnPageLoadAnimation']]),
    );
  }
}
