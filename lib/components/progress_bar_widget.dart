import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({Key key}) : super(key: key);

  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 44, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 44,
                  icon: Icon(
                    Icons.menu_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('PROGRESS_BAR_COMP_userAvatar_ON_TAP');
                    logFirebaseEvent('userAvatar_Drawer');
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/userAvatar.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 16, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Text(
                    'Maverick',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            child: Text(
              'Below is the progress you have made this week.',
              style: FlutterFlowTheme.of(context).bodyText2,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x34090F13),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Text(
                        'Goals',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                    Text(
                      'Daily tracker',
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Progress',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '4/10',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: LinearPercentIndicator(
                          percent: 0.4,
                          width: MediaQuery.of(context).size.width * 0.81,
                          lineHeight: 8,
                          animation: true,
                          progressColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          backgroundColor:
                              FlutterFlowTheme.of(context).lineColor,
                          barRadius: Radius.circular(8),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
