import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBtnText,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/AppIcon.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'LiveTVSplash': (data) async => LiveTVSplashWidget(),
  'LiveTVLogIn': (data) async => LiveTVLogInWidget(),
  'LiveTVReg': (data) async => LiveTVRegWidget(),
  'SermonNav': (data) async => NavBarPage(initialPage: 'SermonNav'),
  'Sermons_old': (data) async => SermonsOldWidget(),
  'MiniSermonVideos_old': (data) async => MiniSermonVideosOldWidget(),
  'videoPage': (data) async => VideoPageWidget(
        videoLink: getParameter(data, 'videoLink'),
        videoName: getParameter(data, 'videoName'),
        audioLink: getParameter(data, 'audioLink'),
        videoThumbnail: getParameter(data, 'videoThumbnail'),
      ),
  'SermonAudio_old': (data) async => SermonAudioOldWidget(),
  'Bible': (data) async => NavBarPage(initialPage: 'Bible'),
  'BibleChapters': (data) async => BibleChaptersWidget(
        bookId: getParameter(data, 'bookId'),
      ),
  'BibleVerses': (data) async => BibleVersesWidget(
        verseReference: getParameter(data, 'verseReference'),
      ),
  'AudioSermons': (data) async => AudioSermonsWidget(),
  'DailyDevoInfo': (data) async => DailyDevoInfoWidget(
        datePicked: getParameter(data, 'datePicked'),
        dateString: getParameter(data, 'dateString'),
        test: getParameter(data, 'test'),
      ),
  'DailyDevoCal': (data) async => NavBarPage(initialPage: 'DailyDevoCal'),
  'chatPage': (data) async => ChatPageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'allChats': (data) async => NavBarPage(initialPage: 'allChats'),
  'addToChat': (data) async => AddToChatWidget(
        chat: await getDocumentParameter(data, 'chat', ChatsRecord.serializer),
      ),
  'groupChat': (data) async => GroupChatWidget(),
  'startChat': (data) async => StartChatWidget(),
  'LiveTVReset': (data) async => LiveTVResetWidget(
        email: getParameter(data, 'email'),
      ),
  'ExplainCatechism': (data) async => ExplainCatechismWidget(),
  'PodcastAudio_old': (data) async => PodcastAudioOldWidget(),
  'editProfile': (data) async => EditProfileWidget(),
  'socialFeed': (data) async => NavBarPage(initialPage: 'socialFeed'),
  'postDetails': (data) async => PostDetailsWidget(
        postRef: getParameter(data, 'postRef'),
        userRef: getParameter(data, 'userRef'),
      ),
  'createPost': (data) async => CreatePostWidget(),
  'AudioPodcast': (data) async => AudioPodcastWidget(),
  'FullSermonVideos': (data) async => FullSermonVideosWidget(),
  'sharePost': (data) async => SharePostWidget(
        imageShare: getParameter(data, 'imageShare'),
        shareLink: getParameter(data, 'shareLink'),
        videoLink: getParameter(data, 'videoLink'),
        videoName: getParameter(data, 'videoName'),
        audioLink: getParameter(data, 'audioLink'),
      ),
  'MiniSermonVideo': (data) async => MiniSermonVideoWidget(),
  'pushNotification': (data) async => PushNotificationWidget(),
  'pushNotificationUpdate': (data) async => PushNotificationUpdateWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
