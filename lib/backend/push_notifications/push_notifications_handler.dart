import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

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
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
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
          color: FlutterFlowTheme.of(context).white,
          child: Image.asset(
            'assets/images/AppIcon.jpg',
            fit: BoxFit.fitWidth,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LiveTVSplash': ParameterData.none(),
  'LiveTVLogIn': ParameterData.none(),
  'LiveTVReg': ParameterData.none(),
  'SermonNav': ParameterData.none(),
  'Bible': ParameterData.none(),
  'BibleChapters': (data) async => ParameterData(
        allParams: {
          'bookId': getParameter<String>(data, 'bookId'),
        },
      ),
  'BibleVerses': (data) async => ParameterData(
        allParams: {
          'verseReference': getParameter<String>(data, 'verseReference'),
        },
      ),
  'DailyDevoCal': ParameterData.none(),
  'AudioSermons': (data) async => ParameterData(
        allParams: {
          'fromPush': getParameter<bool>(data, 'fromPush'),
        },
      ),
  'chatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'allChats': ParameterData.none(),
  'addToChat': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
        },
      ),
  'groupChat': ParameterData.none(),
  'startChat': ParameterData.none(),
  'LiveTVReset': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'DailyDevoInfo': (data) async => ParameterData(
        allParams: {
          'datePicked': getParameter<DateTime>(data, 'datePicked'),
          'dateString': getParameter<String>(data, 'dateString'),
          'initialTab': getParameter<int>(data, 'initialTab'),
        },
      ),
  'ScriptureImage': (data) async => ParameterData(
        allParams: {
          'verseRef': getParameter<String>(data, 'verseRef'),
          'passage': getParameter<String>(data, 'passage'),
        },
      ),
  'ExplainCatechism': ParameterData.none(),
  'editProfile': ParameterData.none(),
  'socialFeed': ParameterData.none(),
  'createPost': ParameterData.none(),
  'postDetails': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'videoPage': (data) async => ParameterData(
        allParams: {
          'videoLink': getParameter<String>(data, 'videoLink'),
          'videoName': getParameter<String>(data, 'videoName'),
          'audioLink': getParameter<String>(data, 'audioLink'),
          'videoThumbnail': getParameter<String>(data, 'videoThumbnail'),
          'audioID': getParameter<int>(data, 'audioID'),
          'videoURL': getParameter<String>(data, 'videoURL'),
          'levelUp': getParameter<bool>(data, 'levelUp'),
        },
      ),
  'AudioPodcast': (data) async => ParameterData(
        allParams: {
          'fromPush': getParameter<bool>(data, 'fromPush'),
        },
      ),
  'FullSermonVideos': (data) async => ParameterData(
        allParams: {
          'fromPush': getParameter<bool>(data, 'fromPush'),
        },
      ),
  'sharePost': (data) async => ParameterData(
        allParams: {
          'imageShare': getParameter<String>(data, 'imageShare'),
          'shareLink': getParameter<String>(data, 'shareLink'),
          'videoLink': getParameter<String>(data, 'videoLink'),
          'videoName': getParameter<String>(data, 'videoName'),
          'audioLink': getParameter<String>(data, 'audioLink'),
        },
      ),
  'MiniSermonVideo': (data) async => ParameterData(
        allParams: {
          'fromPush': getParameter<bool>(data, 'fromPush'),
        },
      ),
  'pushNotificationUpdate': ParameterData.none(),
  'Home': ParameterData.none(),
  'FullSermonVideosCopy': ParameterData.none(),
  'AllCatechisms': ParameterData.none(),
  'levelUp': (data) async => ParameterData(
        allParams: {
          'linkSwitch': getParameter<bool>(data, 'linkSwitch'),
        },
      ),
  'ExplainRewards': ParameterData.none(),
  'DailyJournalEntryNew': (data) async => ParameterData(
        allParams: {
          'dateString': getParameter<String>(data, 'dateString'),
          'dailyVerse': getParameter<String>(data, 'dailyVerse'),
          'docExist': getParameter<bool>(data, 'docExist'),
        },
      ),
  'DailyJournalEntryEdit': (data) async => ParameterData(
        allParams: {
          'dateString': getParameter<String>(data, 'dateString'),
          'dailyVerse': getParameter<String>(data, 'dailyVerse'),
          'docExist': getParameter<bool>(data, 'docExist'),
        },
      ),
  'DailyJournalView': (data) async => ParameterData(
        allParams: {
          'dateString': getParameter<String>(data, 'dateString'),
        },
      ),
  'AllJournals': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
  'activityFeed': ParameterData.none(),
  'catechismPages': (data) async => ParameterData(
        allParams: {
          'cID': getParameter<int>(data, 'cID'),
          'nav': getParameter<bool>(data, 'nav'),
          'datePicked': getParameter<DateTime>(data, 'datePicked'),
          'dateString': getParameter<String>(data, 'dateString'),
        },
      ),
  'pushForAppVersion': ParameterData.none(),
  'pushForNonUsage': ParameterData.none(),
  'bibleStudyNotes': (data) async => ParameterData(
        allParams: {
          'verseRef': getParameter<String>(data, 'verseRef'),
          'bibleStudyRef':
              getParameter<DocumentReference>(data, 'bibleStudyRef'),
        },
      ),
  'bibleStudyOld': (data) async => ParameterData(
        allParams: {
          'cID': getParameter<int>(data, 'cID'),
          'nav': getParameter<bool>(data, 'nav'),
          'datePicked': getParameter<DateTime>(data, 'datePicked'),
          'dateString': getParameter<String>(data, 'dateString'),
        },
      ),
  'bibleStudy3': ParameterData.none(),
  'bibleStudy4': ParameterData.none(),
  'bibleStudy5': ParameterData.none(),
  'bibleStudy6': ParameterData.none(),
  'bibleStudy7': ParameterData.none(),
  'bibleStudy8': ParameterData.none(),
  'bibleStudy1': ParameterData.none(),
  'bibleStudy2': ParameterData.none(),
  'discipleshipMenteeOLD': (data) async => ParameterData(
        allParams: {
          'mentee': getParameter<DocumentReference>(data, 'mentee'),
        },
      ),
  'discipleshipMentorOLD': ParameterData.none(),
  'discipleshipPrayers': ParameterData.none(),
  'discipleshipHome': ParameterData.none(),
  'viewPrayer': (data) async => ParameterData(
        allParams: {
          'prayerRef': getParameter<DocumentReference>(data, 'prayerRef'),
        },
      ),
  'discipleshipIntroOLD': ParameterData.none(),
  'pushNotificationOptions': ParameterData.none(),
  'bibleStudyNotesAll': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
          'searchInput': getParameter<String>(data, 'searchInput'),
        },
      ),
  'BibleVersesImage': (data) async => ParameterData(
        allParams: {
          'verseReference': getParameter<String>(data, 'verseReference'),
          'imagePath': getParameter<String>(data, 'imagePath'),
        },
      ),
  'bibleStudyNoteOLD': (data) async => ParameterData(
        allParams: {
          'verseRef': getParameter<String>(data, 'verseRef'),
          'bibleStudyRef':
              getParameter<DocumentReference>(data, 'bibleStudyRef'),
        },
      ),
  'bibleStudyNoteNEW': (data) async => ParameterData(
        allParams: {
          'verseRef': getParameter<String>(data, 'verseRef'),
          'bibleStudyRef':
              getParameter<DocumentReference>(data, 'bibleStudyRef'),
        },
      ),
  'SermonHub': ParameterData.none(),
  'MyChurch': (data) async => ParameterData(
        allParams: {
          'myChurch': getParameter<DocumentReference>(data, 'myChurch'),
        },
      ),
  'FindMyChurch': ParameterData.none(),
  'StudyGuide': (data) async => ParameterData(
        allParams: {
          'myChurch': getParameter<DocumentReference>(data, 'myChurch'),
        },
      ),
  'HelpModal': ParameterData.none(),
  'congratsDiscipleship': ParameterData.none(),
  'BroadcastListing': ParameterData.none(),
  'StartBroadcast': (data) async => ParameterData(
        allParams: {
          'broadcastName': getParameter<String>(data, 'broadcastName'),
        },
      ),
  'ViewBroadcast': (data) async => ParameterData(
        allParams: {
          'url': getParameter<String>(data, 'url'),
          'broadcastName': getParameter<String>(data, 'broadcastName'),
          'videoId': getParameter<int>(data, 'videoId'),
        },
      ),
  'NewBroadcast2': (data) async => ParameterData(
        allParams: {
          'broadcastName': getParameter<String>(data, 'broadcastName'),
        },
      ),
  'VideoFeed': ParameterData.none(),
};

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
