import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyDevoCalWidget extends StatefulWidget {
  const DailyDevoCalWidget({Key key}) : super(key: key);

  @override
  _DailyDevoCalWidgetState createState() => _DailyDevoCalWidgetState();
}

class _DailyDevoCalWidgetState extends State<DailyDevoCalWidget> {
  DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DailyDevoCal'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async {
              logFirebaseEvent('DAILY_DEVO_CAL_PAGE_Icon_1m08za75_ON_TAP');
              logFirebaseEvent('Icon_Navigate-Back');
              context.pop();
            },
            child: Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Image.asset(
              'assets/images/LiveTV_Logo_White.png',
              width: 150,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('DAILY_DEVO_CAL_PAGE_Icon_hop10693_ON_TAP');
                  logFirebaseEvent('Icon_Drawer');
                  scaffoldKey.currentState.openEndDrawer();
                },
                child: Icon(
                  Icons.settings_outlined,
                  color: Color(0xFFE8602F),
                  size: 30,
                ),
              ),
            ),
          ],
          elevation: 2,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      endDrawer: Drawer(
        elevation: 16,
        child: EndDrawerWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select a date and push go',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x230E151B),
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  iconColor: FlutterFlowTheme.of(context).primaryText,
                  weekFormat: false,
                  weekStartsMonday: false,
                  initialDate: getCurrentTimestamp,
                  rowHeight: 50,
                  onChange: (DateTimeRange newSelectedDate) {
                    setState(() => calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.w600,
                      ),
                  dayOfWeekStyle:
                      FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                  dateStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                  selectedDateStyle:
                      FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                  inactiveDateStyle:
                      FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.w600,
                          ),
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('DAILY_DEVO_CAL_PAGE_GO!_BTN_ON_TAP');
                        logFirebaseEvent('Button_Navigate-To');
                        context.pushNamed(
                          'DailyDevoInfo',
                          queryParams: {
                            'dateString': serializeParam(
                                functions.pullDateFromTimeStamp(
                                    calendarSelectedDay?.start),
                                ParamType.String),
                            'datePicked': serializeParam(
                                calendarSelectedDay?.start, ParamType.DateTime),
                          }.withoutNulls,
                        );
                        logFirebaseEvent('Button_Backend-Call');

                        final activityLogCreateData =
                            createActivityLogRecordData(
                          activity:
                              'User clicked on GO! button on the Daily Worship calendar to select date ${functions.pullDateFromTimeStamp(calendarSelectedDay?.start)}',
                          time: getCurrentTimestamp,
                          user: currentUserDisplayName,
                        );
                        await ActivityLogRecord.collection
                            .doc()
                            .set(activityLogCreateData);
                      },
                      text: 'GO!',
                      options: FFButtonOptions(
                        width: 200,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                        elevation: 4,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 4,
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
