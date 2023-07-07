import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/level_up_sheet/level_up_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'audio_sermons_model.dart';
export 'audio_sermons_model.dart';

class AudioSermonsWidget extends StatefulWidget {
  const AudioSermonsWidget({
    Key? key,
    this.fromPush,
  }) : super(key: key);

  final bool? fromPush;

  @override
  _AudioSermonsWidgetState createState() => _AudioSermonsWidgetState();
}

class _AudioSermonsWidgetState extends State<AudioSermonsWidget> {
  late AudioSermonsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioSermonsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AudioSermons'});
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
        title: 'AudioSermons',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: Colors.black,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'AUDIO_SERMONS_arrow_back_rounded_ICN_ON_');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('SermonNav');
                  },
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Image.asset(
                          'assets/images/LiveTV_Logo_White.png',
                          width: 150.0,
                          height: 100.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 4.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                  child: StreamBuilder<List<SermonVideosRecord>>(
                    stream: querySermonVideosRecord(
                      queryBuilder: (sermonVideosRecord) => sermonVideosRecord
                          .orderBy('video_id', descending: true),
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
                      List<SermonVideosRecord> listViewSermonVideosRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewSermonVideosRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewSermonVideosRecord =
                              listViewSermonVideosRecordList[listViewIndex];
                          return AuthUserStreamWidget(
                            builder: (context) => badges.Badge(
                              badgeContent: Text(
                                FFLocalizations.of(context).getText(
                                  'x92xmvgw' /* NEW */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                              ),
                              showBadge: !(currentUserDocument?.podcastsWatched
                                          ?.toList() ??
                                      [])
                                  .contains(listViewSermonVideosRecord.videoId),
                              shape: badges.BadgeShape.circle,
                              badgeColor: FlutterFlowTheme.of(context).primary,
                              elevation: 4.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              position: badges.BadgePosition.topEnd(),
                              animationType: badges.BadgeAnimationType.scale,
                              toAnimate: true,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'AUDIO_SERMONS_PAGE_videoCard_ON_TAP');
                                    if (!(currentUserDocument?.podcastsWatched
                                                ?.toList() ??
                                            [])
                                        .contains(listViewSermonVideosRecord
                                            .videoId)) {
                                      if (valueOrDefault(
                                              currentUserDocument?.points, 0) >=
                                          86) {
                                        logFirebaseEvent(
                                            'videoCard_backend_call');

                                        await currentUserReference!.update({
                                          'points': FieldValue.increment(-(85)),
                                          'level_id': FieldValue.increment(1),
                                        });
                                        logFirebaseEvent(
                                            'videoCard_bottom_sheet');
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Color(0x00000000),
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: 400.0,
                                                  child: LevelUpSheetWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));

                                        logFirebaseEvent(
                                            'videoCard_haptic_feedback');
                                        HapticFeedback.vibrate();
                                      } else {
                                        logFirebaseEvent(
                                            'videoCard_backend_call');

                                        await currentUserReference!.update({
                                          'points': FieldValue.increment(15),
                                        });
                                        logFirebaseEvent(
                                            'videoCard_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'You\'ve been awarded 15 points!',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 6000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'videoCard_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                      }
                                    }
                                    logFirebaseEvent('videoCard_launch_u_r_l');
                                    await launchURL(
                                        listViewSermonVideosRecord.audioLink);
                                    logFirebaseEvent(
                                        'videoCard_haptic_feedback');
                                    HapticFeedback.selectionClick();
                                    logFirebaseEvent('videoCard_backend_call');

                                    await currentUserReference!.update({
                                      'podcasts_watched': FieldValue.arrayUnion(
                                          [listViewSermonVideosRecord.videoId]),
                                    });
                                    logFirebaseEvent('videoCard_backend_call');

                                    await ActivityLogRecord.collection
                                        .doc()
                                        .set(createActivityLogRecordData(
                                          activity:
                                              'Audio Sermon - ${listViewSermonVideosRecord.sermonName}',
                                          time: getCurrentTimestamp,
                                          user: currentUserDisplayName,
                                          showUser: true,
                                        ));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.network(
                                            listViewSermonVideosRecord
                                                .sermonThumbnail,
                                            width: 170.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.9, 0.85),
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x230E151B),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  180.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewSermonVideosRecord
                                                    .sermonName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    listViewSermonVideosRecord
                                                        .text,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
