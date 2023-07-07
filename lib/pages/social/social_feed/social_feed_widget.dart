import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/end_drawer/end_drawer_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'social_feed_model.dart';
export 'social_feed_model.dart';

class SocialFeedWidget extends StatefulWidget {
  const SocialFeedWidget({Key? key}) : super(key: key);

  @override
  _SocialFeedWidgetState createState() => _SocialFeedWidgetState();
}

class _SocialFeedWidgetState extends State<SocialFeedWidget> {
  late SocialFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialFeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'socialFeed'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SOCIAL_FEED_socialFeed_ON_INIT_STATE');
      logFirebaseEvent('socialFeed_backend_call');

      await ActivityLogRecord.collection.doc().set(createActivityLogRecordData(
            activity: 'Main social feed',
            time: getCurrentTimestamp,
            user: currentUserDisplayName,
          ));
      logFirebaseEvent('socialFeed_backend_call');

      await currentUserReference!.update(createUsersRecordData(
        lastVisitToSocialFeed: getCurrentTimestamp,
      ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'socialFeed',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              logFirebaseEvent('SOCIAL_FEED_FloatingActionButton_b4b6e4e');
              logFirebaseEvent('FloatingActionButton_navigate_to');

              context.pushNamed('createPost');

              logFirebaseEvent('FloatingActionButton_haptic_feedback');
              HapticFeedback.selectionClick();
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.create_rounded,
              color: Colors.white,
              size: 24.0,
            ),
          ),
          endDrawer: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.endDrawerModel,
              updateCallback: () => setState(() {}),
              child: EndDrawerWidget(),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('SOCIAL_FEED_PAGE_Icon_nrjmvqf8_ON_TAP');
                  logFirebaseEvent('Icon_navigate_to');

                  context.pushNamed('Home');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  size: 24.0,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('SOCIAL_FEED_PAGE_Icon_j49bpum9_ON_TAP');
                      logFirebaseEvent('Icon_drawer');
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Color(0xFFE8602F),
                      size: 30.0,
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/LiveTV_Logo_White.png',
                    width: 150.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x3A000000),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 40.0,
                                      height: 40.0,
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
                                  FFLocalizations.of(context).getText(
                                    'nn603x6x' /* Welcome */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'j6k6amdn' /* Checkout news and highlights b... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Lato',
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
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
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<SocialPostsRecord>
                            socialFeedSocialPostsRecordList = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              socialFeedSocialPostsRecordList.length,
                              (socialFeedIndex) {
                            final socialFeedSocialPostsRecord =
                                socialFeedSocialPostsRecordList[
                                    socialFeedIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    socialFeedSocialPostsRecord.postedBy!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    );
                                  }
                                  final userPostUsersRecord = snapshot.data!;
                                  return Material(
                                    color: Colors.transparent,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.94,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 2.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 0.0, 0.0),
                                                  child: Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  1.0,
                                                                  1.0,
                                                                  1.0,
                                                                  1.0),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          userPostUsersRecord
                                                              .displayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.0, 0.0),
                                                          children: [
                                                            if (socialFeedSocialPostsRecord
                                                                    .postedBy !=
                                                                currentUserReference)
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SOCIAL_FEED_PAGE_Icon_k5zes74a_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_haptic_feedback');
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  logFirebaseEvent(
                                                                      'Icon_alert_dialog');
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Are you sure?'),
                                                                                content: Text('Are you sure you want to flag this post and user?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Confirm'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');

                                                                    await ActivityLogRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createActivityLogRecordData(
                                                                          activity:
                                                                              'FLAGGED: ${dateTimeFormat(
                                                                            'M/d h:mm a',
                                                                            socialFeedSocialPostsRecord.postedTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} that said ${socialFeedSocialPostsRecord.content} for user: ${userPostUsersRecord.displayName}',
                                                                          time:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserDisplayName,
                                                                        ));
                                                                    logFirebaseEvent(
                                                                        'Icon_alert_dialog');
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Success'),
                                                                          content:
                                                                              Text('The user and post have been flagged.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Icon_navigate_to');

                                                                    context.pushNamed(
                                                                        'socialFeed');

                                                                    logFirebaseEvent(
                                                                        'Icon_haptic_feedback');
                                                                    HapticFeedback
                                                                        .selectionClick();
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');

                                                                    await ActivityLogRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createActivityLogRecordData(
                                                                          activity:
                                                                              'User/Post flagged: ${dateTimeFormat(
                                                                            'M/d H:mm',
                                                                            socialFeedSocialPostsRecord.postedTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} but decided not to follow through',
                                                                          time:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserDisplayName,
                                                                        ));
                                                                    logFirebaseEvent(
                                                                        'Icon_haptic_feedback');
                                                                    HapticFeedback
                                                                        .selectionClick();
                                                                    return;
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons.flag,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            if (socialFeedSocialPostsRecord
                                                                    .postedBy ==
                                                                currentUserReference)
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SOCIAL_FEED_PAGE_Icon_jnly1k0j_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_haptic_feedback');
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  logFirebaseEvent(
                                                                      'Icon_alert_dialog');
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Are you sure?'),
                                                                                content: Text('Are you sure you want to delete this post?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Confirm'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');

                                                                    await ActivityLogRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createActivityLogRecordData(
                                                                          activity:
                                                                              'Deleted: ${dateTimeFormat(
                                                                            'M/d h:mm a',
                                                                            socialFeedSocialPostsRecord.postedTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} that said ${socialFeedSocialPostsRecord.content}',
                                                                          time:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserDisplayName,
                                                                        ));
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');
                                                                    await socialFeedSocialPostsRecord
                                                                        .reference
                                                                        .delete();
                                                                    logFirebaseEvent(
                                                                        'Icon_navigate_to');

                                                                    context.pushNamed(
                                                                        'socialFeed');

                                                                    logFirebaseEvent(
                                                                        'Icon_haptic_feedback');
                                                                    HapticFeedback
                                                                        .selectionClick();
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');

                                                                    await ActivityLogRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createActivityLogRecordData(
                                                                          activity:
                                                                              'User deleted: ${dateTimeFormat(
                                                                            'M/d H:mm',
                                                                            socialFeedSocialPostsRecord.postedTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} but decided not to follow through',
                                                                          time:
                                                                              getCurrentTimestamp,
                                                                          user:
                                                                              currentUserDisplayName,
                                                                        ));
                                                                    logFirebaseEvent(
                                                                        'Icon_haptic_feedback');
                                                                    HapticFeedback
                                                                        .selectionClick();
                                                                    return;
                                                                  }
                                                                },
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .trashAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  size: 24.0,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 12.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 15.0),
                                                    child: Text(
                                                      socialFeedSocialPostsRecord
                                                          .content,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (socialFeedSocialPostsRecord
                                                      .photo !=
                                                  null &&
                                              socialFeedSocialPostsRecord
                                                      .photo !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.96,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 6.0,
                                                      color: Color(0x3A000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  width: 100.0,
                                                  child: Stack(
                                                    children: [
                                                      if (socialFeedSocialPostsRecord
                                                                  .photo !=
                                                              null &&
                                                          socialFeedSocialPostsRecord
                                                                  .photo !=
                                                              '')
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SOCIAL_FEED_PAGE_Image_5ysf7sha_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Image_backend_call');

                                                            await ActivityLogRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    createActivityLogRecordData(
                                                                  activity:
                                                                      'User expands an image.  Posted by: ${userPostUsersRecord.displayName}. Posted on: ${dateTimeFormat(
                                                                    'M/d h:mm a',
                                                                    socialFeedSocialPostsRecord
                                                                        .postedTime,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )}',
                                                                  time:
                                                                      getCurrentTimestamp,
                                                                  user:
                                                                      currentUserDisplayName,
                                                                ));
                                                            if (socialFeedSocialPostsRecord
                                                                        .videoLink !=
                                                                    null &&
                                                                socialFeedSocialPostsRecord
                                                                        .videoLink !=
                                                                    '') {
                                                              logFirebaseEvent(
                                                                  'Image_navigate_to');

                                                              context.pushNamed(
                                                                'videoPage',
                                                                queryParameters:
                                                                    {
                                                                  'videoLink':
                                                                      serializeParam(
                                                                    socialFeedSocialPostsRecord
                                                                        .videoLink,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'videoName':
                                                                      serializeParam(
                                                                    socialFeedSocialPostsRecord
                                                                        .videoName,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              return;
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Image_expand_image');
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      socialFeedSocialPostsRecord
                                                                          .photo,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: socialFeedSocialPostsRecord
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
                                                            child:
                                                                Image.network(
                                                              socialFeedSocialPostsRecord
                                                                  .photo,
                                                              width: double
                                                                  .infinity,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      if (socialFeedSocialPostsRecord
                                                          .isVideoPost)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .videocam_outlined,
                                                            color: Colors.black,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      if (!socialFeedSocialPostsRecord
                                                          .isVideoPost)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.image,
                                                            color: Colors.black,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SOCIAL_FEED_PAGE_comment_ON_TAP');
                                                logFirebaseEvent(
                                                    'comment_navigate_to');

                                                context.pushNamed(
                                                  'postDetails',
                                                  queryParameters: {
                                                    'postRef': serializeParam(
                                                      socialFeedSocialPostsRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'userRef': serializeParam(
                                                      userPostUsersRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                logFirebaseEvent(
                                                    'comment_backend_call');

                                                await ActivityLogRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        createActivityLogRecordData(
                                                      activity:
                                                          'User clicks to view comments by: ${userPostUsersRecord.displayName} and posted on ${dateTimeFormat(
                                                        'M/d h:mm a',
                                                        socialFeedSocialPostsRecord
                                                            .postedTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}',
                                                      time: getCurrentTimestamp,
                                                      user:
                                                          currentUserDisplayName,
                                                    ));
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          StreamBuilder<
                                                              List<
                                                                  SocialPostLikesRecord>>(
                                                            stream:
                                                                querySocialPostLikesRecord(
                                                              queryBuilder: (socialPostLikesRecord) =>
                                                                  socialPostLikesRecord.where(
                                                                      'post_ref',
                                                                      isEqualTo:
                                                                          socialFeedSocialPostsRecord
                                                                              .reference),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<SocialPostLikesRecord>
                                                                  containerSocialPostLikesRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final containerSocialPostLikesRecord =
                                                                  containerSocialPostLikesRecordList
                                                                          .isNotEmpty
                                                                      ? containerSocialPostLikesRecordList
                                                                          .first
                                                                      : null;
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          ToggleIcon(
                                                                        onPressed:
                                                                            () async {
                                                                          final likedByElement =
                                                                              currentUserReference;
                                                                          final likedByUpdate = containerSocialPostLikesRecord!.likedBy.contains(likedByElement)
                                                                              ? FieldValue.arrayRemove([
                                                                                  likedByElement
                                                                                ])
                                                                              : FieldValue.arrayUnion([
                                                                                  likedByElement
                                                                                ]);
                                                                          await containerSocialPostLikesRecord!
                                                                              .reference
                                                                              .update({
                                                                            'liked_by':
                                                                                likedByUpdate,
                                                                          });
                                                                        },
                                                                        value: containerSocialPostLikesRecord!
                                                                            .likedBy
                                                                            .contains(currentUserReference),
                                                                        onIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .thumb_up,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                        offIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .thumb_up_alt_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          20.0,
                                                                          8.0,
                                                                          14.0),
                                                                      child:
                                                                          Text(
                                                                        '${containerSocialPostLikesRecord!.likedBy.length.toString()} Likes',
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Lato',
                                                                              fontSize: 16.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        20.0,
                                                                        8.0,
                                                                        10.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    CommentsRecord>>(
                                                              stream:
                                                                  queryCommentsRecord(
                                                                parent:
                                                                    socialFeedSocialPostsRecord
                                                                        .reference,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<CommentsRecord>
                                                                    textCommentsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Text(
                                                                  '${textCommentsRecordList.length.toString()} Comments',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 10.0, 8.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'SOCIAL_FEED_PAGE_COMMENT_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        'postDetails',
                                                        queryParameters: {
                                                          'postRef':
                                                              serializeParam(
                                                            socialFeedSocialPostsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'userRef':
                                                              serializeParam(
                                                            userPostUsersRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      await ActivityLogRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createActivityLogRecordData(
                                                            activity:
                                                                'User clicks to view comments by: ${userPostUsersRecord.displayName} and posted on ${dateTimeFormat(
                                                              'M/d h:mm a',
                                                              socialFeedSocialPostsRecord
                                                                  .postedTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                            time:
                                                                getCurrentTimestamp,
                                                            user:
                                                                currentUserDisplayName,
                                                          ));
                                                      logFirebaseEvent(
                                                          'Button_haptic_feedback');
                                                      HapticFeedback
                                                          .selectionClick();
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'li1ih031' /* Comment */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 130.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 4.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
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
          ),
        ));
  }
}
