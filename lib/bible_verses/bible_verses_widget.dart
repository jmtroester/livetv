import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BibleVersesWidget extends StatefulWidget {
  const BibleVersesWidget({
    Key key,
    this.verseReference,
  }) : super(key: key);

  final String verseReference;

  @override
  _BibleVersesWidgetState createState() => _BibleVersesWidgetState();
}

class _BibleVersesWidgetState extends State<BibleVersesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      logFirebaseEvent('BIBLE_VERSES_BibleVerses_ON_LOAD');
      logFirebaseEvent('BibleVerses_Backend-Call');

      final activityLogCreateData = createActivityLogRecordData(
        activity: 'User viewed a Bible search for - ${widget.verseReference}',
        time: getCurrentTimestamp,
        user: currentUserDisplayName,
      );
      await ActivityLogRecord.collection.doc().set(activityLogCreateData);
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BibleVerses'});
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
              logFirebaseEvent('BIBLE_VERSES_PAGE_Icon_9lgmegh6_ON_TAP');
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
                  logFirebaseEvent('BIBLE_VERSES_PAGE_Icon_6he5a4tv_ON_TAP');
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
          child: FutureBuilder<ApiCallResponse>(
            future: GetBibleVerseCall.call(
              q: widget.verseReference,
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
              final containerGetBibleVerseResponse = snapshot.data;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          GetBibleVerseCall.passage(
                            (containerGetBibleVerseResponse?.jsonBody ?? ''),
                          ).toString(),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
