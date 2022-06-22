import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveTVLogInWidget extends StatefulWidget {
  const LiveTVLogInWidget({Key key}) : super(key: key);

  @override
  _LiveTVLogInWidgetState createState() => _LiveTVLogInWidgetState();
}

class _LiveTVLogInWidgetState extends State<LiveTVLogInWidget> {
  TextEditingController emailFieldController;
  TextEditingController passwordFieldController;
  bool passwordFieldVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailFieldController = TextEditingController();
    passwordFieldController = TextEditingController();
    passwordFieldVisibility = false;
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LiveTVLogIn'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                            height: 120,
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
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailFieldController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            hintText: 'Please enter your email',
                            hintStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFF595959),
                          ),
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordFieldController,
                          autofocus: true,
                          obscureText: !passwordFieldVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            hintText: 'Please enter your password',
                            hintStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFF595959),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordFieldVisibility =
                                    !passwordFieldVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                passwordFieldVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.visiblePassword,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LIVE_T_V_LOG_IN_PAGE_LOGIN_BTN_ON_TAP');
                              logFirebaseEvent('Button_Auth');
                              GoRouter.of(context).prepareAuthEvent();

                              final user = await signInWithEmail(
                                context,
                                emailFieldController.text,
                                passwordFieldController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              logFirebaseEvent('Button_Navigate-To');
                              context.pushNamedAuth('Home', mounted);
                            },
                            text: 'LOGIN',
                            options: FFButtonOptions(
                              width: 300,
                              height: 50,
                              color: Color(0xFFE8602F),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LIVE_T_V_LOG_IN_FORGOT_PASSWORD_BTN_ON_T');
                              logFirebaseEvent('Button_Navigate-To');
                              context.pushNamed(
                                'LiveTVReset',
                                queryParams: {
                                  'email': serializeParam(
                                      emailFieldController.text,
                                      ParamType.String),
                                }.withoutNulls,
                              );
                            },
                            text: 'FORGOT PASSWORD',
                            options: FFButtonOptions(
                              width: 300,
                              height: 50,
                              color: Colors.black,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 4,
                              borderSide: BorderSide(
                                color: Color(0xFFE8602F),
                                width: 3,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LIVE_T_V_LOG_IN_PAGE_REGISTER_BTN_ON_TAP');
                              logFirebaseEvent('Button_Navigate-To');
                              context.pushNamed('LiveTVReg');
                            },
                            text: 'REGISTER',
                            options: FFButtonOptions(
                              width: 300,
                              height: 50,
                              color: Color(0xFFE8602F),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
