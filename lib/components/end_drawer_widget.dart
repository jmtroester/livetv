import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EndDrawerWidget extends StatefulWidget {
  const EndDrawerWidget({Key key}) : super(key: key);

  @override
  _EndDrawerWidgetState createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends State<EndDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 30, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10,
                        borderWidth: 1,
                        buttonSize: 50,
                        fillColor: Color(0xFFE8602F),
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () async {
                          logFirebaseEvent('END_DRAWER_COMP_close_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_Drawer');
                          if (Scaffold.of(context).isDrawerOpen ||
                              Scaffold.of(context).isEndDrawerOpen) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Settings',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFEEEEEE),
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (Theme.of(context).brightness ==
                                    Brightness.dark ??
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
                                      'END_DRAWER_COMP_wb_sunny_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_Set-Dark-Mode-Settings');
                                  setDarkModeSetting(context, ThemeMode.light);
                                },
                              ),
                            if (!(Theme.of(context).brightness ==
                                    Brightness.dark) ??
                                true)
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                fillColor: Color(0xFFE8602F),
                                icon: Icon(
                                  Icons.wb_sunny,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
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
                                      'END_DRAWER_COMP_solidMoon_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_Set-Dark-Mode-Settings');
                                  setDarkModeSetting(context, ThemeMode.dark);
                                },
                              ),
                            if (Theme.of(context).brightness ==
                                    Brightness.dark ??
                                true)
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                fillColor: Color(0xFFE8602F),
                                icon: FaIcon(
                                  FontAwesomeIcons.solidMoon,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where('email',
                          isEqualTo: currentUserEmail),
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<UsersRecord> rowUsersRecordList = snapshot.data;
                      final rowUsersRecord = rowUsersRecordList.isNotEmpty
                          ? rowUsersRecordList.first
                          : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Daily Worship Reminders',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ToggleIcon(
                              onPressed: () async {
                                final usersUpdateData = createUsersRecordData(
                                  remindDevo: !rowUsersRecord.remindDevo,
                                );
                                await rowUsersRecord.reference
                                    .update(usersUpdateData);
                              },
                              value: rowUsersRecord.remindDevo,
                              onIcon: Icon(
                                Icons.check_box_rounded,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 40,
                              ),
                              offIcon: Icon(
                                Icons.check_box_outline_blank_outlined,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'END_DRAWER_COMP_EDIT_PROFILE_BTN_ON_TAP');
                          logFirebaseEvent('Button_Navigate-To');
                          context.pushNamed('editProfile');
                        },
                        text: 'Edit Profile',
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: Color(0xFFE8602F),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'END_DRAWER_COMP_LOG_OUT_BTN_ON_TAP');
                          logFirebaseEvent('Button_Auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await signOut();
                          logFirebaseEvent('Button_Navigate-To');
                          context.pushNamedAuth('LiveTVLogIn', mounted);
                        },
                        text: 'Log Out',
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: Color(0xFFE8602F),
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
                if (valueOrDefault(currentUserDocument?.admin, false) ?? true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: AuthUserStreamWidget(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<List<UsersRecord>>(
                            future: queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where('remind_devo', isEqualTo: true),
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
                              List<UsersRecord> buttonUsersRecordList =
                                  snapshot.data;
                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'END_DRAWER_SEND_REMINDERS_BTN_ON_TAP');
                                  logFirebaseEvent('Button_Alert-Dialog');
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Are you sure?'),
                                            content:
                                                Text('Are you really sure?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Send It!'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    logFirebaseEvent(
                                        'Button_Trigger-Push-Notification');
                                    triggerPushNotification(
                                      notificationTitle:
                                          'Reminder for Daily Worship',
                                      notificationText:
                                          'This is a reminder to check the Daily Worship screen.  Praying for you today!',
                                      notificationSound: 'default',
                                      userRefs: buttonUsersRecordList
                                          .map((e) => e.reference)
                                          .toList(),
                                      initialPageName: 'DailyDevoInfo',
                                      parameterData: {
                                        'datePicked': getCurrentTimestamp,
                                        'dateString':
                                            functions.pullDateFromTimeStamp(
                                                getCurrentTimestamp),
                                      },
                                    );
                                    logFirebaseEvent('Button_Alert-Dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Sent '),
                                          content: Text('It\'s out there now!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                text: 'Send Reminders',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).tertiary400,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                      ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.admin, false) ?? true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: AuthUserStreamWidget(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<List<UsersRecord>>(
                            future: queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where('remind_devo', isEqualTo: true),
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
                              List<UsersRecord> buttonUsersRecordList =
                                  snapshot.data;
                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'END_DRAWER_PUSH_NOTIFICATIONS_BTN_ON_TAP');
                                  logFirebaseEvent('Button_Navigate-To');
                                  context.pushNamed('pushNotification');
                                },
                                text: 'Push Notifications',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).tertiary400,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                      ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
