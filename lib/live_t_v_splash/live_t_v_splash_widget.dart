import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveTVSplashWidget extends StatefulWidget {
  const LiveTVSplashWidget({Key key}) : super(key: key);

  @override
  _LiveTVSplashWidgetState createState() => _LiveTVSplashWidgetState();
}

class _LiveTVSplashWidgetState extends State<LiveTVSplashWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LiveTVSplash'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: Image.asset(
                          'assets/images/AppIcon_dark.jpg',
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please Login to Access\n',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'LIVE_T_V_SPLASH_PAGE_LOGIN_BTN_ON_TAP');
                            logFirebaseEvent('Button_Navigate-To');
                            context.pushNamed('LiveTVLogIn');
                          },
                          text: 'LOGIN',
                          options: FFButtonOptions(
                            width: 300,
                            height: 50,
                            color: Color(0xFFE8602F),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF0F1113),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                            elevation: 4,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'LIVE_T_V_SPLASH_PAGE_REGISTER_BTN_ON_TAP');
                            logFirebaseEvent('Button_Navigate-To');
                            context.pushNamed('LiveTVReg');
                          },
                          text: 'REGISTER',
                          options: FFButtonOptions(
                            width: 300,
                            height: 50,
                            color: Color(0x89333333),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                            elevation: 4,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14, 12, 14, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Light Mode',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Dark Mode',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14, 12, 14, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (Theme.of(context).brightness == Brightness.dark ??
                              true)
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor: Color(0xFFE8602F),
                              icon: Icon(
                                Icons.wb_sunny,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LIVE_T_V_SPLASH_PAGE_wb_sunny_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_Set-Dark-Mode-Settings');
                                setDarkModeSetting(context, ThemeMode.light);
                              },
                            ),
                          if (!(Theme.of(context).brightness ==
                                  Brightness.dark) ??
                              true)
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor: Color(0xFFE8602F),
                              icon: Icon(
                                Icons.wb_sunny,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LIVE_T_V_SPLASH_PAGE_wb_sunny_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_Set-Dark-Mode-Settings');
                                setDarkModeSetting(context, ThemeMode.light);
                              },
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!(Theme.of(context).brightness ==
                                  Brightness.dark) ??
                              true)
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor: Color(0xFFE8602F),
                              icon: FaIcon(
                                FontAwesomeIcons.solidMoon,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LIVE_T_V_SPLASH_solidMoon_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_Set-Dark-Mode-Settings');
                                setDarkModeSetting(context, ThemeMode.dark);
                              },
                            ),
                          if (Theme.of(context).brightness == Brightness.dark ??
                              true)
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor: Color(0xFFE8602F),
                              icon: FaIcon(
                                FontAwesomeIcons.solidMoon,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LIVE_T_V_SPLASH_solidMoon_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_Set-Dark-Mode-Settings');
                                setDarkModeSetting(context, ThemeMode.dark);
                              },
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
      ),
    );
  }
}
