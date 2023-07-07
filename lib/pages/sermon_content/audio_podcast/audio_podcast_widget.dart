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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'audio_podcast_model.dart';
export 'audio_podcast_model.dart';

class AudioPodcastWidget extends StatefulWidget {
  const AudioPodcastWidget({
    Key? key,
    this.fromPush,
  }) : super(key: key);

  final bool? fromPush;

  @override
  _AudioPodcastWidgetState createState() => _AudioPodcastWidgetState();
}

class _AudioPodcastWidgetState extends State<AudioPodcastWidget> {
  late AudioPodcastModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioPodcastModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AudioPodcast'});
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
        title: 'AudioPodcast',
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
                        'AUDIO_PODCAST_arrow_back_rounded_ICN_ON_');
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
                          height: 70.0,
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
                  child: StreamBuilder<List<NonSermonPodcastRecord>>(
                    stream: queryNonSermonPodcastRecord(
                      queryBuilder: (nonSermonPodcastRecord) =>
                          nonSermonPodcastRecord.orderBy('podcast_id',
                              descending: true),
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
                      List<NonSermonPodcastRecord>
                          listViewNonSermonPodcastRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewNonSermonPodcastRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewNonSermonPodcastRecord =
                              listViewNonSermonPodcastRecordList[listViewIndex];
                          return AuthUserStreamWidget(
                            builder: (context) => badges.Badge(
                              badgeContent: Text(
                                FFLocalizations.of(context).getText(
                                  'e509tnku' /* NEW */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                              ),
                              showBadge: !(currentUserDocument
                                          ?.nonSermonPodcastsWatched
                                          ?.toList() ??
                                      [])
                                  .contains(
                                      listViewNonSermonPodcastRecord.podcastId),
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
                                        'AUDIO_PODCAST_PAGE_videoCard_ON_TAP');
                                    if (!(currentUserDocument
                                                ?.nonSermonPodcastsWatched
                                                ?.toList() ??
                                            [])
                                        .contains(listViewNonSermonPodcastRecord
                                            .podcastId)) {
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
                                        listViewNonSermonPodcastRecord
                                            .podcastUrl);
                                    logFirebaseEvent(
                                        'videoCard_haptic_feedback');
                                    HapticFeedback.selectionClick();
                                    logFirebaseEvent('videoCard_backend_call');

                                    await currentUserReference!.update({
                                      'non_sermon_podcasts_watched':
                                          FieldValue.arrayUnion([
                                        listViewNonSermonPodcastRecord.podcastId
                                      ]),
                                    });
                                    logFirebaseEvent('videoCard_backend_call');

                                    await ActivityLogRecord.collection
                                        .doc()
                                        .set(createActivityLogRecordData(
                                          activity:
                                              'The Church that had to Die - ${listViewNonSermonPodcastRecord.podcastName}',
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.8, -0.35),
                                          child: Container(
                                            width: 55.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x230E151B),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              shape: BoxShape.circle,
                                            ),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidPlayCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  130.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewNonSermonPodcastRecord
                                                    .podcastName,
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
                                                    listViewNonSermonPodcastRecord
                                                        .meta,
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
