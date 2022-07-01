import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SocialFeedWidget extends StatefulWidget {
  const SocialFeedWidget({Key key}) : super(key: key);

  @override
  _SocialFeedWidgetState createState() => _SocialFeedWidgetState();
}

class _SocialFeedWidgetState extends State<SocialFeedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      logFirebaseEvent('SOCIAL_FEED_PAGE_socialFeed_ON_PAGE_LOAD');
      logFirebaseEvent('socialFeed_Backend-Call');

      final activityLogCreateData = createActivityLogRecordData(
        activity: 'Main social feed',
        time: getCurrentTimestamp,
        user: currentUserDisplayName,
      );
      await ActivityLogRecord.collection.doc().set(activityLogCreateData);
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'socialFeed'});
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
              logFirebaseEvent('SOCIAL_FEED_PAGE_Icon_nrjmvqf8_ON_TAP');
              logFirebaseEvent('Icon_Navigate-To');
              context.pushNamed('Home');
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
                  logFirebaseEvent('SOCIAL_FEED_PAGE_Icon_j49bpum9_ON_TAP');
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('SOCIAL_FEED_FloatingActionButton_b4b6e4e');
          logFirebaseEvent('FloatingActionButton_Navigate-To');
          context.pushNamed('createPost');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.create_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
      endDrawer: Drawer(
        elevation: 16,
        child: EndDrawerWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x3A000000),
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: AuthUserStreamWidget(
                              child: Container(
                                width: 40,
                                height: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://wearelive.church/wp-content/uploads/2022/06/blank-profile-picture-973460_1280.webp',
                                  ),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Welcome',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: AuthUserStreamWidget(
                              child: Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Checkout news and highlights below.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF8B97A2),
                                    fontWeight: FontWeight.w500,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: FutureBuilder<List<SocialPostsRecord>>(
                future: querySocialPostsRecordOnce(
                  queryBuilder: (socialPostsRecord) => socialPostsRecord
                      .orderBy('posted_time', descending: true),
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
                  List<SocialPostsRecord> socialFeedSocialPostsRecordList =
                      snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(socialFeedSocialPostsRecordList.length,
                            (socialFeedIndex) {
                      final socialFeedSocialPostsRecord =
                          socialFeedSocialPostsRecordList[socialFeedIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              socialFeedSocialPostsRecord.postedBy),
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
                            final userPostUsersRecord = snapshot.data;
                            return Material(
                              color: Colors.transparent,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 2, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 0, 0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(1, 1, 1, 1),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      userPostUsersRecord
                                                          .photoUrl,
                                                      'https://wearelive.church/wp-content/uploads/2022/06/blank-profile-picture-973460_1280.webp',
                                                    ),
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    userPostUsersRecord
                                                        .displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                if ((socialFeedSocialPostsRecord
                                                        .postedBy) ==
                                                    (currentUserReference))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 15, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'SOCIAL_FEED_PAGE_Icon_jnly1k0j_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_Alert-Dialog');
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Are you sure?'),
                                                                      content: Text(
                                                                          'Are you sure you want to delete this post?'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Cancel'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Confirm'),
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
                                                                'Deleted: ${dateTimeFormat('M/d h:mm a', socialFeedSocialPostsRecord.postedTime)} that said ${socialFeedSocialPostsRecord.content}',
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
                                                          await socialFeedSocialPostsRecord
                                                              .reference
                                                              .delete();
                                                          logFirebaseEvent(
                                                              'Icon_Navigate-To');
                                                          context.pushNamed(
                                                              'socialFeed');
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Icon_Backend-Call');

                                                          final activityLogCreateData =
                                                              createActivityLogRecordData(
                                                            activity:
                                                                'User deleted: ${dateTimeFormat('M/d H:mm', socialFeedSocialPostsRecord.postedTime)} but decided not to follow through',
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
                                                          return;
                                                        }
                                                      },
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .trashAlt,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 12, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 15),
                                              child: Text(
                                                socialFeedSocialPostsRecord
                                                    .content,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if ((socialFeedSocialPostsRecord.photo !=
                                            null) &&
                                        (socialFeedSocialPostsRecord.photo !=
                                            ''))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.96,
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
                                          child: Container(
                                            width: 100,
                                            child: Stack(
                                              children: [
                                                if ((socialFeedSocialPostsRecord
                                                            .photo !=
                                                        null) &&
                                                    (socialFeedSocialPostsRecord
                                                            .photo !=
                                                        ''))
                                                  InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SOCIAL_FEED_PAGE_Image_5ysf7sha_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_Backend-Call');

                                                      final activityLogCreateData =
                                                          createActivityLogRecordData(
                                                        activity:
                                                            'User expands an image.  Posted by: ${userPostUsersRecord.displayName}. Posted on: ${dateTimeFormat('M/d h:mm a', socialFeedSocialPostsRecord.postedTime)}',
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
                                                      if ((socialFeedSocialPostsRecord
                                                                  .videoLink !=
                                                              null) &&
                                                          (socialFeedSocialPostsRecord
                                                                  .videoLink !=
                                                              '')) {
                                                        logFirebaseEvent(
                                                            'Image_Navigate-To');
                                                        context.pushNamed(
                                                          'videoPage',
                                                          queryParams: {
                                                            'videoLink': serializeParam(
                                                                socialFeedSocialPostsRecord
                                                                    .videoLink,
                                                                ParamType
                                                                    .String),
                                                            'videoName': serializeParam(
                                                                socialFeedSocialPostsRecord
                                                                    .videoName,
                                                                ParamType
                                                                    .String),
                                                          }.withoutNulls,
                                                        );
                                                        return;
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Image_Expand-Image');
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                socialFeedSocialPostsRecord
                                                                    .photo,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag:
                                                                  socialFeedSocialPostsRecord
                                                                      .photo,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                    },
                                                    child: Hero(
                                                      tag:
                                                          socialFeedSocialPostsRecord
                                                              .photo,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: Image.network(
                                                        socialFeedSocialPostsRecord
                                                            .photo,
                                                        width: double.infinity,
                                                        height: 200,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                if (socialFeedSocialPostsRecord
                                                        .isVideoPost ??
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 5, 0, 0),
                                                    child: Icon(
                                                      Icons.videocam_outlined,
                                                      color: Colors.black,
                                                      size: 50,
                                                    ),
                                                  ),
                                                if (!(socialFeedSocialPostsRecord
                                                        .isVideoPost) ??
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 5, 0, 0),
                                                    child: Icon(
                                                      Icons.image,
                                                      color: Colors.black,
                                                      size: 50,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SOCIAL_FEED_PAGE_comment_ON_TAP');
                                          logFirebaseEvent(
                                              'comment_Navigate-To');
                                          context.pushNamed(
                                            'postDetails',
                                            queryParams: {
                                              'postRef': serializeParam(
                                                  socialFeedSocialPostsRecord
                                                      .reference,
                                                  ParamType.DocumentReference),
                                              'userRef': serializeParam(
                                                  userPostUsersRecord.reference,
                                                  ParamType.DocumentReference),
                                            }.withoutNulls,
                                          );
                                          logFirebaseEvent(
                                              'comment_Backend-Call');

                                          final activityLogCreateData =
                                              createActivityLogRecordData(
                                            activity:
                                                'User clicks to view comments by: ${userPostUsersRecord.displayName} and posted on ${dateTimeFormat('M/d h:mm a', socialFeedSocialPostsRecord.postedTime)}',
                                            time: getCurrentTimestamp,
                                            user: currentUserDisplayName,
                                          );
                                          await ActivityLogRecord.collection
                                              .doc()
                                              .set(activityLogCreateData);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 20, 8, 10),
                                                child: StreamBuilder<
                                                    List<CommentsRecord>>(
                                                  stream: queryCommentsRecord(
                                                    parent:
                                                        socialFeedSocialPostsRecord
                                                            .reference,
                                                  ),
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
                                                    List<CommentsRecord>
                                                        textCommentsRecordList =
                                                        snapshot.data;
                                                    return Text(
                                                      '${textCommentsRecordList.length.toString()} Comments',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 10, 8, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'SOCIAL_FEED_PAGE_COMMENT_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_Navigate-To');
                                                context.pushNamed(
                                                  'postDetails',
                                                  queryParams: {
                                                    'postRef': serializeParam(
                                                        socialFeedSocialPostsRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference),
                                                    'userRef': serializeParam(
                                                        userPostUsersRecord
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
                                                      'User clicks to view comments by: ${userPostUsersRecord.displayName} and posted on ${dateTimeFormat('M/d h:mm a', socialFeedSocialPostsRecord.postedTime)}',
                                                  time: getCurrentTimestamp,
                                                  user: currentUserDisplayName,
                                                );
                                                await ActivityLogRecord
                                                    .collection
                                                    .doc()
                                                    .set(activityLogCreateData);
                                              },
                                              text: 'Comment',
                                              options: FFButtonOptions(
                                                width: 130,
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
                                                elevation: 4,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
