import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LiveTVSplashWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LiveTVSplashWidget(),
          routes: [
            FFRoute(
              name: 'LiveTVSplash',
              path: 'liveTVSplash',
              builder: (context, params) => LiveTVSplashWidget(),
            ),
            FFRoute(
              name: 'LiveTVLogIn',
              path: 'liveTVLogIn',
              builder: (context, params) => LiveTVLogInWidget(),
            ),
            FFRoute(
              name: 'LiveTVReg',
              path: 'liveTVReg',
              builder: (context, params) => LiveTVRegWidget(),
            ),
            FFRoute(
              name: 'SermonNav',
              path: 'sermonNav',
              builder: (context, params) => SermonNavWidget(),
            ),
            FFRoute(
              name: 'Bible',
              path: 'bible',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Bible')
                  : BibleWidget(),
            ),
            FFRoute(
              name: 'BibleChapters',
              path: 'bibleChapters',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleChaptersWidget(
                  bookId: params.getParam('bookId', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'BibleVerses',
              path: 'bibleVerses',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleVersesWidget(
                  verseReference:
                      params.getParam('verseReference', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'DailyDevoCal',
              path: 'dailyDevoCal',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'DailyDevoCal')
                  : DailyDevoCalWidget(),
            ),
            FFRoute(
              name: 'AudioSermons',
              path: 'audioSermons',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: AudioSermonsWidget(
                  fromPush: params.getParam('fromPush', ParamType.bool),
                ),
              ),
            ),
            FFRoute(
              name: 'chatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ChatPageWidget(
                  chatUser: params.getParam('chatUser', ParamType.Document),
                  chatRef: params.getParam(
                      'chatRef', ParamType.DocumentReference, false, ['chats']),
                ),
              ),
            ),
            FFRoute(
              name: 'allChats',
              path: 'allChats',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'allChats')
                  : AllChatsWidget(),
            ),
            FFRoute(
              name: 'addToChat',
              path: 'addToChat',
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => AddToChatWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'groupChat',
              path: 'groupChat',
              builder: (context, params) => GroupChatWidget(),
            ),
            FFRoute(
              name: 'startChat',
              path: 'startChat',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: StartChatWidget(),
              ),
            ),
            FFRoute(
              name: 'LiveTVReset',
              path: 'liveTVReset',
              builder: (context, params) => LiveTVResetWidget(
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DailyDevoInfo',
              path: 'dailyDevoInfo',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DailyDevoInfoWidget(
                  datePicked: params.getParam('datePicked', ParamType.DateTime),
                  dateString: params.getParam('dateString', ParamType.String),
                  initialTab: params.getParam('initialTab', ParamType.int),
                ),
              ),
            ),
            FFRoute(
              name: 'ScriptureImage',
              path: 'scriptureImage',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ScriptureImageWidget(
                  verseRef: params.getParam('verseRef', ParamType.String),
                  passage: params.getParam('passage', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'ExplainCatechism',
              path: 'explainCatechism',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ExplainCatechismWidget(),
              ),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: EditProfileWidget(),
              ),
            ),
            FFRoute(
              name: 'socialFeed',
              path: 'socialFeed',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'socialFeed')
                  : SocialFeedWidget(),
            ),
            FFRoute(
              name: 'createPost',
              path: 'createPost',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CreatePostWidget(),
              ),
            ),
            FFRoute(
              name: 'postDetails',
              path: 'postDetails',
              builder: (context, params) => PostDetailsWidget(
                postRef: params.getParam('postRef', ParamType.DocumentReference,
                    false, ['social_posts']),
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'videoPage',
              path: 'videoPage',
              builder: (context, params) => VideoPageWidget(
                videoLink: params.getParam('videoLink', ParamType.String),
                videoName: params.getParam('videoName', ParamType.String),
                audioLink: params.getParam('audioLink', ParamType.String),
                videoThumbnail:
                    params.getParam('videoThumbnail', ParamType.String),
                audioID: params.getParam('audioID', ParamType.int),
                videoURL: params.getParam('videoURL', ParamType.String),
                levelUp: params.getParam('levelUp', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'AudioPodcast',
              path: 'audioPodcast',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: AudioPodcastWidget(
                  fromPush: params.getParam('fromPush', ParamType.bool),
                ),
              ),
            ),
            FFRoute(
              name: 'FullSermonVideos',
              path: 'fullSermonVideos',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: FullSermonVideosWidget(
                  fromPush: params.getParam('fromPush', ParamType.bool),
                ),
              ),
            ),
            FFRoute(
              name: 'sharePost',
              path: 'sharePost',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SharePostWidget(
                  imageShare: params.getParam('imageShare', ParamType.String),
                  shareLink: params.getParam('shareLink', ParamType.String),
                  videoLink: params.getParam('videoLink', ParamType.String),
                  videoName: params.getParam('videoName', ParamType.String),
                  audioLink: params.getParam('audioLink', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'MiniSermonVideo',
              path: 'miniSermonVideo',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: MiniSermonVideoWidget(
                  fromPush: params.getParam('fromPush', ParamType.bool),
                ),
              ),
            ),
            FFRoute(
              name: 'pushNotificationUpdate',
              path: 'pushNotificationUpdate',
              builder: (context, params) => PushNotificationUpdateWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Home')
                  : HomeWidget(),
            ),
            FFRoute(
              name: 'FullSermonVideosCopy',
              path: 'fullSermonVideosCopy',
              builder: (context, params) => FullSermonVideosCopyWidget(),
            ),
            FFRoute(
              name: 'AllCatechisms',
              path: 'allCatechisms',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: AllCatechismsWidget(),
              ),
            ),
            FFRoute(
              name: 'levelUp',
              path: 'levelUp',
              builder: (context, params) => LevelUpWidget(
                linkSwitch: params.getParam('linkSwitch', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'ExplainRewards',
              path: 'explainRewards',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ExplainRewardsWidget(),
              ),
            ),
            FFRoute(
              name: 'DailyJournalEntryNew',
              path: 'dailyJournalEntryNew',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DailyJournalEntryNewWidget(
                  dateString: params.getParam('dateString', ParamType.String),
                  dailyVerse: params.getParam('dailyVerse', ParamType.String),
                  docExist: params.getParam('docExist', ParamType.bool),
                ),
              ),
            ),
            FFRoute(
              name: 'DailyJournalEntryEdit',
              path: 'dailyJournalEntryEdit',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DailyJournalEntryEditWidget(
                  dateString: params.getParam('dateString', ParamType.String),
                  dailyVerse: params.getParam('dailyVerse', ParamType.String),
                  docExist: params.getParam('docExist', ParamType.bool),
                ),
              ),
            ),
            FFRoute(
              name: 'DailyJournalView',
              path: 'dailyJournalView',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DailyJournalViewWidget(
                  dateString: params.getParam('dateString', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'AllJournals',
              path: 'allJournals',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: AllJournalsWidget(
                  user: params.getParam(
                      'user', ParamType.DocumentReference, false, ['users']),
                ),
              ),
            ),
            FFRoute(
              name: 'activityFeed',
              path: 'activityFeed',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ActivityFeedWidget(),
              ),
            ),
            FFRoute(
              name: 'catechismPages',
              path: 'catechismPages',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CatechismPagesWidget(
                  cID: params.getParam('cID', ParamType.int),
                  nav: params.getParam('nav', ParamType.bool),
                  datePicked: params.getParam('datePicked', ParamType.DateTime),
                  dateString: params.getParam('dateString', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'pushForAppVersion',
              path: 'pushForAppVersion',
              builder: (context, params) => PushForAppVersionWidget(),
            ),
            FFRoute(
              name: 'pushForNonUsage',
              path: 'pushForNonUsage',
              builder: (context, params) => PushForNonUsageWidget(),
            ),
            FFRoute(
              name: 'bibleStudyNotes',
              path: 'bibleStudyNotes',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudyNotesWidget(
                  verseRef: params.getParam('verseRef', ParamType.String),
                  bibleStudyRef: params.getParam(
                      'bibleStudyRef',
                      ParamType.DocumentReference,
                      false,
                      ['bible_study_notes']),
                ),
              ),
            ),
            FFRoute(
              name: 'bibleStudyOld',
              path: 'bibleStudyOld',
              builder: (context, params) => BibleStudyOldWidget(
                cID: params.getParam('cID', ParamType.int),
                nav: params.getParam('nav', ParamType.bool),
                datePicked: params.getParam('datePicked', ParamType.DateTime),
                dateString: params.getParam('dateString', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'bibleStudy3',
              path: 'bibleStudy3',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudy3Widget(),
              ),
            ),
            FFRoute(
              name: 'bibleStudy4',
              path: 'bibleStudy4',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudy4Widget(),
              ),
            ),
            FFRoute(
              name: 'bibleStudy5',
              path: 'bibleStudy5',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudy5Widget(),
              ),
            ),
            FFRoute(
              name: 'bibleStudy6',
              path: 'bibleStudy6',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudy6Widget(),
              ),
            ),
            FFRoute(
              name: 'bibleStudy7',
              path: 'bibleStudy7',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudy7Widget(),
              ),
            ),
            FFRoute(
              name: 'bibleStudy8',
              path: 'bibleStudy8',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudy8Widget(),
              ),
            ),
            FFRoute(
              name: 'bibleStudy1',
              path: 'bibleStudy1',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudy1Widget(),
              ),
            ),
            FFRoute(
              name: 'bibleStudy2',
              path: 'bibleStudy2',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudy2Widget(),
              ),
            ),
            FFRoute(
              name: 'discipleshipMenteeOLD',
              path: 'discipleshipMenteeOLD',
              builder: (context, params) => DiscipleshipMenteeOLDWidget(
                mentee: params.getParam(
                    'mentee', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'discipleshipMentorOLD',
              path: 'discipleshipMentorOLD',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DiscipleshipMentorOLDWidget(),
              ),
            ),
            FFRoute(
              name: 'discipleshipPrayers',
              path: 'discipleshipPrayers',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DiscipleshipPrayersWidget(),
              ),
            ),
            FFRoute(
              name: 'discipleshipHome',
              path: 'discipleshipHome',
              builder: (context, params) => DiscipleshipHomeWidget(),
            ),
            FFRoute(
              name: 'viewPrayer',
              path: 'viewPrayer',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ViewPrayerWidget(
                  prayerRef: params.getParam('prayerRef',
                      ParamType.DocumentReference, false, ['prayers']),
                ),
              ),
            ),
            FFRoute(
              name: 'discipleshipIntroOLD',
              path: 'discipleshipIntro',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: DiscipleshipIntroOLDWidget(),
              ),
            ),
            FFRoute(
              name: 'pushNotificationOptions',
              path: 'pushNotificationOptions',
              builder: (context, params) => PushNotificationOptionsWidget(),
            ),
            FFRoute(
              name: 'bibleStudyNotesAll',
              path: 'bibleStudyNotesAll',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudyNotesAllWidget(
                  user: params.getParam(
                      'user', ParamType.DocumentReference, false, ['users']),
                  searchInput: params.getParam('searchInput', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'BibleVersesImage',
              path: 'bibleVerseImage',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleVersesImageWidget(
                  verseReference:
                      params.getParam('verseReference', ParamType.String),
                  imagePath: params.getParam('imagePath', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'bibleStudyNoteOLD',
              path: 'bibleStudyNoteOLD',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudyNoteOLDWidget(
                  verseRef: params.getParam('verseRef', ParamType.String),
                  bibleStudyRef: params.getParam(
                      'bibleStudyRef',
                      ParamType.DocumentReference,
                      false,
                      ['bible_study_notes']),
                ),
              ),
            ),
            FFRoute(
              name: 'bibleStudyNoteNEW',
              path: 'bibleStudyNoteNEW',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BibleStudyNoteNEWWidget(
                  verseRef: params.getParam('verseRef', ParamType.String),
                  bibleStudyRef: params.getParam(
                      'bibleStudyRef',
                      ParamType.DocumentReference,
                      false,
                      ['bible_study_notes']),
                ),
              ),
            ),
            FFRoute(
              name: 'SermonHub',
              path: 'sermonHub',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SermonHubWidget(),
              ),
            ),
            FFRoute(
              name: 'MyChurch',
              path: 'myChurch',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: MyChurchWidget(
                  myChurch: params.getParam('myChurch',
                      ParamType.DocumentReference, false, ['my_church']),
                ),
              ),
            ),
            FFRoute(
              name: 'FindMyChurch',
              path: 'findMyChurch',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: FindMyChurchWidget(),
              ),
            ),
            FFRoute(
              name: 'StudyGuide',
              path: 'studyGuide',
              requireAuth: true,
              builder: (context, params) => StudyGuideWidget(
                myChurch: params.getParam('myChurch',
                    ParamType.DocumentReference, false, ['my_church']),
              ),
            ),
            FFRoute(
              name: 'HelpModal',
              path: 'helpModal',
              requireAuth: true,
              builder: (context, params) => HelpModalWidget(),
            ),
            FFRoute(
              name: 'congratsDiscipleship',
              path: 'congratsDiscipleship',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CongratsDiscipleshipWidget(),
              ),
            ),
            FFRoute(
              name: 'BroadcastListing',
              path: 'liveVideo',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BroadcastListingWidget(),
              ),
            ),
            FFRoute(
              name: 'StartBroadcast',
              path: 'newBroadcast',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: StartBroadcastWidget(
                  broadcastName:
                      params.getParam('broadcastName', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'ViewBroadcast',
              path: 'viewBroadcast',
              builder: (context, params) => ViewBroadcastWidget(
                url: params.getParam('url', ParamType.String),
                broadcastName:
                    params.getParam('broadcastName', ParamType.String),
                videoId: params.getParam('videoId', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'NewBroadcast2',
              path: 'newBroadcast2',
              builder: (context, params) => NewBroadcast2Widget(
                broadcastName:
                    params.getParam('broadcastName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'VideoFeed',
              path: 'videoFeed',
              builder: (context, params) => VideoFeedWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/liveTVSplash';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).white,
                  child: Image.asset(
                    'assets/images/AppIcon.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
