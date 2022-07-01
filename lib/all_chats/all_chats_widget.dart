import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AllChatsWidget extends StatefulWidget {
  const AllChatsWidget({Key key}) : super(key: key);

  @override
  _AllChatsWidgetState createState() => _AllChatsWidgetState();
}

class _AllChatsWidgetState extends State<AllChatsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'allChats'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'All Chats',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: StreamBuilder<List<ChatsRecord>>(
                stream: queryChatsRecord(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where('users', arrayContains: currentUserReference)
                      .orderBy('last_message_time', descending: true),
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
                  List<ChatsRecord> listViewChatsRecordList = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewChatsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewChatsRecord =
                          listViewChatsRecordList[listViewIndex];
                      return StreamBuilder<FFChatInfo>(
                        stream: FFChatManager.instance
                            .getChatInfo(chatRecord: listViewChatsRecord),
                        builder: (context, snapshot) {
                          final chatInfo =
                              snapshot.data ?? FFChatInfo(listViewChatsRecord);
                          return FFChatPreview(
                            onTap: () => context.pushNamed(
                              'chatPage',
                              queryParams: {
                                'chatUser': serializeParam(
                                    chatInfo.otherUsers.length == 1
                                        ? chatInfo.otherUsersList.first
                                        : null,
                                    ParamType.Document),
                                'chatRef': serializeParam(
                                    chatInfo.chatRecord.reference,
                                    ParamType.DocumentReference),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'chatUser': chatInfo.otherUsers.length == 1
                                    ? chatInfo.otherUsersList.first
                                    : null,
                              },
                            ),
                            lastChatText: chatInfo.chatPreviewMessage(),
                            lastChatTime: listViewChatsRecord.lastMessageTime,
                            seen: listViewChatsRecord.lastMessageSeenBy
                                .contains(currentUserReference),
                            title: chatInfo.chatPreviewTitle(),
                            userProfilePic: chatInfo.chatPreviewPic(),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            unreadColor: Colors.blue,
                            titleTextStyle: GoogleFonts.getFont(
                              'DM Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            dateTextStyle: GoogleFonts.getFont(
                              'DM Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            previewTextStyle: GoogleFonts.getFont(
                              'DM Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                            borderRadius: BorderRadius.circular(0),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.45, 0.9),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 0,
                buttonSize: 60,
                fillColor: Color(0xFFE8602F),
                icon: Icon(
                  Icons.person_add_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () async {
                  logFirebaseEvent('ALL_CHATS_person_add_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_Navigate-To');
                  context.pushNamed('startChat');
                  logFirebaseEvent('IconButton_Backend-Call');

                  final activityLogCreateData = createActivityLogRecordData(
                    activity: 'Started 1-on-1 chat',
                    time: getCurrentTimestamp,
                    user: currentUserDisplayName,
                  );
                  await ActivityLogRecord.collection
                      .doc()
                      .set(activityLogCreateData);
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.9, 0.9),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 0,
                buttonSize: 60,
                fillColor: Color(0xFFE8602F),
                icon: Icon(
                  Icons.group_add,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () async {
                  logFirebaseEvent('ALL_CHATS_PAGE_group_add_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_Navigate-To');
                  context.pushNamed('groupChat');
                  logFirebaseEvent('IconButton_Backend-Call');

                  final activityLogCreateData = createActivityLogRecordData(
                    activity: 'Started group chat',
                    time: getCurrentTimestamp,
                    user: currentUserDisplayName,
                  );
                  await ActivityLogRecord.collection
                      .doc()
                      .set(activityLogCreateData);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
