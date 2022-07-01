import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  LiveTVFirebaseUser initialUser;
  LiveTVFirebaseUser user;
  bool showSplashImage = true;
  String _redirectLocation;

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

  String getRedirectLocation() => _redirectLocation;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(LiveTVFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
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
      errorBuilder: (context, _) =>
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
              name: 'Home',
              path: 'home',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Home')
                  : HomeWidget(),
            ),
            FFRoute(
              name: 'LiveTVReg',
              path: 'liveTVReg',
              builder: (context, params) => LiveTVRegWidget(),
            ),
            FFRoute(
              name: 'SermonNav',
              path: 'sermonNav',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SermonNav')
                  : SermonNavWidget(),
            ),
            FFRoute(
              name: 'Sermons_old',
              path: 'sermonsOld',
              builder: (context, params) => SermonsOldWidget(),
            ),
            FFRoute(
              name: 'MiniSermonVideos_old',
              path: 'miniSermonVideosOld',
              requireAuth: true,
              builder: (context, params) => MiniSermonVideosOldWidget(),
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
              ),
            ),
            FFRoute(
              name: 'SermonAudio_old',
              path: 'sermonAudioOld',
              builder: (context, params) => SermonAudioOldWidget(),
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
              builder: (context, params) => BibleChaptersWidget(
                bookId: params.getParam('bookId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'BibleVerses',
              path: 'bibleVerses',
              builder: (context, params) => BibleVersesWidget(
                verseReference:
                    params.getParam('verseReference', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AudioSermons',
              path: 'audioSermons',
              builder: (context, params) => AudioSermonsWidget(),
            ),
            FFRoute(
              name: 'DailyDevoInfo',
              path: 'dailyDevoInfo',
              builder: (context, params) => DailyDevoInfoWidget(
                datePicked: params.getParam('datePicked', ParamType.DateTime),
                dateString: params.getParam('dateString', ParamType.String),
                test: params.getParam('test', ParamType.String),
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
              name: 'chatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, 'chats'),
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
                'chat': getDoc('chats', ChatsRecord.serializer),
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
              builder: (context, params) => StartChatWidget(),
            ),
            FFRoute(
              name: 'LiveTVReset',
              path: 'liveTVReset',
              builder: (context, params) => LiveTVResetWidget(
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ExplainCatechism',
              path: 'explainCatechism',
              builder: (context, params) => ExplainCatechismWidget(),
            ),
            FFRoute(
              name: 'PodcastAudio_old',
              path: 'podcastAudioOld',
              builder: (context, params) => PodcastAudioOldWidget(),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
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
              builder: (context, params) => CreatePostWidget(),
            ),
            FFRoute(
              name: 'postDetails',
              path: 'postDetails',
              builder: (context, params) => PostDetailsWidget(
                postRef: params.getParam(
                    'postRef', ParamType.DocumentReference, 'social_posts'),
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, 'users'),
              ),
            ),
            FFRoute(
              name: 'AudioPodcast',
              path: 'audioPodcast',
              builder: (context, params) => AudioPodcastWidget(),
            ),
            FFRoute(
              name: 'FullSermonVideos',
              path: 'fullSermonVideos',
              builder: (context, params) => FullSermonVideosWidget(),
            ),
            FFRoute(
              name: 'sharePost',
              path: 'sharePost',
              builder: (context, params) => SharePostWidget(
                imageShare: params.getParam('imageShare', ParamType.String),
                shareLink: params.getParam('shareLink', ParamType.String),
                videoLink: params.getParam('videoLink', ParamType.String),
                videoName: params.getParam('videoName', ParamType.String),
                audioLink: params.getParam('audioLink', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'MiniSermonVideo',
              path: 'miniSermonVideo',
              builder: (context, params) => MiniSermonVideoWidget(),
            ),
            FFRoute(
              name: 'pushNotification',
              path: 'pushNotification',
              builder: (context, params) => PushNotificationWidget(),
            ),
            FFRoute(
              name: 'pushNotificationUpdate',
              path: 'pushNotificationUpdate',
              builder: (context, params) => PushNotificationUpdateWidget(),
            ),
            FFRoute(
              name: 'FullSermonVideosCopy',
              path: 'fullSermonVideosCopy',
              builder: (context, params) => FullSermonVideosCopyWidget(),
            ),
            FFRoute(
              name: 'AllCatechisms',
              path: 'allCatechisms',
              builder: (context, params) => AllCatechismsWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
    );

extension NavParamExtensions on Map<String, String> {
  Map<String, String> get withoutNulls =>
      Map.fromEntries(entries.where((e) => e.value != null));
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
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

  bool get isEmpty => state.allParams.isEmpty;
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key](param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String collectionName,
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
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    @required this.name,
    @required this.path,
    @required this.builder,
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
        redirect: (state) {
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
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  child: Builder(
                    builder: (context) => Image.asset(
                      'assets/images/AppIcon.jpg',
                      fit: BoxFit.fitWidth,
                    ),
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
    this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
