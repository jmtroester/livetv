import '../backend/api_requests/api_calls.dart';
import '../components/end_drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BibleChaptersWidget extends StatefulWidget {
  const BibleChaptersWidget({
    Key key,
    this.bookId,
  }) : super(key: key);

  final String bookId;

  @override
  _BibleChaptersWidgetState createState() => _BibleChaptersWidgetState();
}

class _BibleChaptersWidgetState extends State<BibleChaptersWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BibleChapters'});
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
              logFirebaseEvent('BIBLE_CHAPTERS_PAGE_Icon_9oix602n_ON_TAP');
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
                  logFirebaseEvent('BIBLE_CHAPTERS_PAGE_Icon_vjw0g8xw_ON_TAP');
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 15, 8, 8),
            child: FutureBuilder<ApiCallResponse>(
              future: GetBibleChaptersCall.call(
                bookId: widget.bookId,
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
                final gridViewGetBibleChaptersResponse = snapshot.data;
                return Builder(
                  builder: (context) {
                    final chapters = getJsonField(
                          (gridViewGetBibleChaptersResponse?.jsonBody ?? ''),
                          r'''$.data''',
                        )?.toList() ??
                        [];
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: chapters.length,
                      itemBuilder: (context, chaptersIndex) {
                        final chaptersItem = chapters[chaptersIndex];
                        return InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'BIBLE_CHAPTERS_Container_lcmj6tp9_ON_TAP');
                            logFirebaseEvent('Container_Navigate-To');
                            context.pushNamed(
                              'BibleVerses',
                              queryParams: {
                                'verseReference': serializeParam(
                                    getJsonField(
                                      chaptersItem,
                                      r'''$.reference''',
                                    ).toString(),
                                    ParamType.String),
                              }.withoutNulls,
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    getJsonField(
                                      chaptersItem,
                                      r'''$.number''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
