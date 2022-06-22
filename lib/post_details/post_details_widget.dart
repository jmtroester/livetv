import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/end_drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailsWidget extends StatefulWidget {
  const PostDetailsWidget({
    Key key,
    this.postRef,
    this.userRef,
  }) : super(key: key);

  final DocumentReference postRef;
  final DocumentReference userRef;

  @override
  _PostDetailsWidgetState createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget> {
  TextEditingController commentBoxController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    commentBoxController = TextEditingController();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'postDetails'});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SocialPostsRecord>(
      future: SocialPostsRecord.getDocumentOnce(widget.postRef),
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
        final postDetailsSocialPostsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
              automaticallyImplyLeading: false,
              leading: InkWell(
                onTap: () async {
                  logFirebaseEvent('POST_DETAILS_PAGE_Icon_qq0ade4o_ON_TAP');
                  logFirebaseEvent('Icon_Navigate-To');
                  context.pushNamed('socialFeed');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
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
                      logFirebaseEvent(
                          'POST_DETAILS_PAGE_Icon_7usb4jc5_ON_TAP');
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          endDrawer: Drawer(
            elevation: 16,
            child: EndDrawerWidget(),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: FutureBuilder<UsersRecord>(
                future: UsersRecord.getDocumentOnce(widget.userRef),
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
                  final columnUsersRecord = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          columnUsersRecord.photoUrl,
                                          'https://wearelive.church/wp-content/uploads/2022/06/blank-profile-picture-973460_1280.webp',
                                        ),
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              columnUsersRecord.displayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                  'relative',
                                                  postDetailsSocialPostsRecord
                                                      .postedTime),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((postDetailsSocialPostsRecord
                                                .postedBy) ==
                                            (currentUserReference))
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'POST_DETAILS_PAGE_Icon_53aadzca_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_Alert-Dialog');
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Are you sure?'),
                                                            content: Text(
                                                                'Are you sure you want to delete this post?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Confirm'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                logFirebaseEvent(
                                                    'Icon_Backend-Call');

                                                final activityLogCreateData =
                                                    createActivityLogRecordData(
                                                  activity:
                                                      'User deleted social post from ${dateTimeFormat('M/d h:mm a', postDetailsSocialPostsRecord.postedTime)} that said ${postDetailsSocialPostsRecord.content}',
                                                  time: getCurrentTimestamp,
                                                  user: currentUserDisplayName,
                                                );
                                                await ActivityLogRecord
                                                    .collection
                                                    .doc()
                                                    .set(activityLogCreateData);
                                                logFirebaseEvent(
                                                    'Icon_Backend-Call');
                                                await postDetailsSocialPostsRecord
                                                    .reference
                                                    .delete();
                                                logFirebaseEvent(
                                                    'Icon_Navigate-To');
                                                context.pushNamed('socialFeed');
                                              } else {
                                                logFirebaseEvent(
                                                    'Icon_Backend-Call');

                                                final activityLogCreateData =
                                                    createActivityLogRecordData(
                                                  activity:
                                                      'User clicked on delete icon for social post from ${dateTimeFormat('M/d h:mm a', postDetailsSocialPostsRecord.postedTime)} but decided not to follow through',
                                                  time: getCurrentTimestamp,
                                                  user: currentUserDisplayName,
                                                );
                                                await ActivityLogRecord
                                                    .collection
                                                    .doc()
                                                    .set(activityLogCreateData);
                                                return;
                                              }
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons.trashAlt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                              size: 24,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: AutoSizeText(
                                          postDetailsSocialPostsRecord.content,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if ((postDetailsSocialPostsRecord.photo !=
                                              null) &&
                                          (postDetailsSocialPostsRecord.photo !=
                                              ''))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.92,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 6,
                                                  color: Color(0x3A000000),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Stack(
                                              children: [
                                                if ((postDetailsSocialPostsRecord
                                                            .photo !=
                                                        null) &&
                                                    (postDetailsSocialPostsRecord
                                                            .photo !=
                                                        ''))
                                                  StreamBuilder<
                                                      SocialPostsRecord>(
                                                    stream: SocialPostsRecord
                                                        .getDocument(
                                                            postDetailsSocialPostsRecord
                                                                .reference),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child: SpinKitWave(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final imageSocialPostsRecord =
                                                          snapshot.data;
                                                      return InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'POST_DETAILS_PAGE_Image_at3rok5y_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Image_Backend-Call');

                                                          final activityLogCreateData =
                                                              createActivityLogRecordData(
                                                            activity:
                                                                'User expands an image.  Posted by: ${columnUsersRecord.displayName}. Posted on: ${dateTimeFormat('M/d h:mm a', imageSocialPostsRecord.postedTime)}',
                                                            time:
                                                                getCurrentTimestamp,
                                                            user:
                                                                currentUserDisplayName,
                                                          );
                                                          await ActivityLogRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  activityLogCreateData);
                                                          if ((imageSocialPostsRecord
                                                                      .videoLink !=
                                                                  null) &&
                                                              (imageSocialPostsRecord
                                                                      .videoLink !=
                                                                  '')) {
                                                            logFirebaseEvent(
                                                                'Image_Navigate-To');
                                                            context.pushNamed(
                                                              'videoPage',
                                                              queryParams: {
                                                                'videoLink': serializeParam(
                                                                    imageSocialPostsRecord
                                                                        .videoLink,
                                                                    ParamType
                                                                        .String),
                                                                'videoName': serializeParam(
                                                                    imageSocialPostsRecord
                                                                        .videoName,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            return;
                                                          }
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Image.network(
                                                            imageSocialPostsRecord
                                                                .photo,
                                                            width:
                                                                double.infinity,
                                                            height: 300,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                if (postDetailsSocialPostsRecord
                                                        .isVideoPost ??
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 0, 0),
                                                    child: Icon(
                                                      Icons.videocam_outlined,
                                                      color: Colors.black,
                                                      size: 50,
                                                    ),
                                                  ),
                                                if (!(postDetailsSocialPostsRecord
                                                        .isVideoPost) ??
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 0, 0),
                                                    child: Icon(
                                                      Icons.image_outlined,
                                                      color: Colors.black,
                                                      size: 50,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 12),
                                  child: FutureBuilder<List<CommentsRecord>>(
                                    future: queryCommentsRecordOnce(
                                      parent: postDetailsSocialPostsRecord
                                          .reference,
                                      queryBuilder: (commentsRecord) =>
                                          commentsRecord
                                              .orderBy('comment_posted_time'),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<CommentsRecord>
                                          listViewCommentsRecordList =
                                          snapshot.data;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewCommentsRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewCommentsRecord =
                                              listViewCommentsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          listViewCommentsRecord
                                                              .commentPostedBy),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child: SpinKitWave(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final imageUsersRecord =
                                                        snapshot.data;
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          imageUsersRecord
                                                              .photoUrl,
                                                          'https://wearelive.church/wp-content/uploads/2022/06/blank-profile-picture-973460_1280.webp',
                                                        ),
                                                        width: 40,
                                                        height: 40,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 0, 0),
                                                      child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.75,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFE3E3E3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      8, 12, 8),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              FutureBuilder<
                                                                  UsersRecord>(
                                                                future: UsersRecord
                                                                    .getDocumentOnce(
                                                                        listViewCommentsRecord
                                                                            .commentPostedBy),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            SpinKitWave(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              50,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final textUsersRecord =
                                                                      snapshot
                                                                          .data;
                                                                  return Text(
                                                                    textUsersRecord
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                              Text(
                                                                listViewCommentsRecord
                                                                    .comment,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xEC000000),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 200,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.9, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                    'relative',
                                                                    listViewCommentsRecord
                                                                        .commentPostedTime),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                              ),
                                                            ),
                                                          ),
                                                          if ((listViewCommentsRecord
                                                                  .commentPostedBy) ==
                                                              (currentUserReference))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.35, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'POST_DETAILS_PAGE_Icon_f9aghmdj_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_Alert-Dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Are you sure?'),
                                                                                  content: Text('Are you sure you want to delete your comment?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Delete'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      logFirebaseEvent(
                                                                          'Icon_Backend-Call');

                                                                      final activityLogCreateData =
                                                                          createActivityLogRecordData(
                                                                        activity:
                                                                            'User deleted their comment that said ${listViewCommentsRecord.comment} on a post by ${columnUsersRecord.displayName} posted on ${dateTimeFormat('d/M h:mm a', postDetailsSocialPostsRecord.postedTime)}',
                                                                        time:
                                                                            getCurrentTimestamp,
                                                                        user:
                                                                            currentUserDisplayName,
                                                                      );
                                                                      await ActivityLogRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              activityLogCreateData);
                                                                      logFirebaseEvent(
                                                                          'Icon_Backend-Call');
                                                                      await listViewCommentsRecord
                                                                          .reference
                                                                          .delete();
                                                                      logFirebaseEvent(
                                                                          'Icon_Navigate-To');
                                                                      context
                                                                          .pushNamed(
                                                                        'postDetails',
                                                                        queryParams:
                                                                            {
                                                                          'postRef': serializeParam(
                                                                              postDetailsSocialPostsRecord.reference,
                                                                              ParamType.DocumentReference),
                                                                          'userRef': serializeParam(
                                                                              columnUsersRecord.reference,
                                                                              ParamType.DocumentReference),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      return;
                                                                    }
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .trashAlt,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayIcon,
                                                                    size: 18,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x26000000),
                                offset: Offset(0, 2),
                                spreadRadius: 8,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 4, 0),
                                              child: TextFormField(
                                                controller:
                                                    commentBoxController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Search here...',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText2,
                                                  hintText: 'Leave comment...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0, 16, 0, 0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                maxLines: 4,
                                                keyboardType:
                                                    TextInputType.multiline,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'POST_DETAILS_PAGE_POST_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_Backend-Call');

                                                final commentsCreateData =
                                                    createCommentsRecordData(
                                                  commentPostedBy:
                                                      currentUserReference,
                                                  comment:
                                                      commentBoxController.text,
                                                  commentPostedTime:
                                                      getCurrentTimestamp,
                                                );
                                                await CommentsRecord.createDoc(
                                                        postDetailsSocialPostsRecord
                                                            .reference)
                                                    .set(commentsCreateData);
                                                logFirebaseEvent(
                                                    'Button_Navigate-To');
                                                context.pushNamed(
                                                  'postDetails',
                                                  queryParams: {
                                                    'postRef': serializeParam(
                                                        postDetailsSocialPostsRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference),
                                                    'userRef': serializeParam(
                                                        columnUsersRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference),
                                                  }.withoutNulls,
                                                );
                                                logFirebaseEvent(
                                                    'Button_Backend-Call');

                                                final activityLogCreateData =
                                                    createActivityLogRecordData(
                                                  activity:
                                                      'User left a comment on a post by: ${columnUsersRecord.displayName} on ${dateTimeFormat('M/d h:mm a', postDetailsSocialPostsRecord.postedTime)}.  The original message said: ${postDetailsSocialPostsRecord.content}.  The comment left was ${commentBoxController.text}',
                                                  time: getCurrentTimestamp,
                                                  user: currentUserDisplayName,
                                                );
                                                await ActivityLogRecord
                                                    .collection
                                                    .doc()
                                                    .set(activityLogCreateData);
                                                logFirebaseEvent(
                                                    'Button_Trigger-Push-Notification');
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      '${currentUserDisplayName} commented on your post',
                                                  notificationText:
                                                      '${currentUserDisplayName} commented on your post',
                                                  notificationImageUrl:
                                                      postDetailsSocialPostsRecord
                                                          .photo,
                                                  notificationSound: 'default',
                                                  userRefs: [
                                                    columnUsersRecord.reference
                                                  ],
                                                  initialPageName:
                                                      'postDetails',
                                                  parameterData: {
                                                    'postRef':
                                                        postDetailsSocialPostsRecord
                                                            .reference,
                                                    'userRef': columnUsersRecord
                                                        .reference,
                                                  },
                                                );
                                              },
                                              text: 'Post',
                                              options: FFButtonOptions(
                                                width: 70,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 2,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 50,
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
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
