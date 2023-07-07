import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LiveTVSplash
  {
    'm0z7hlip': {
      'en': 'Please Login to Access\n',
      'es': '',
    },
    'y77buz53': {
      'en': 'LOGIN',
      'es': '',
    },
    'rbja9jta': {
      'en': 'REGISTER',
      'es': '',
    },
    'q5fp8v57': {
      'en': 'Light Mode',
      'es': '',
    },
    'fgt7dw9u': {
      'en': 'Dark Mode',
      'es': '',
    },
    'ay1i8uvd': {
      'en': 'Home',
      'es': '',
    },
  },
  // LiveTVLogIn
  {
    'w1angjpj': {
      'en': 'Please Login to Access\n',
      'es': '',
    },
    'axli3myt': {
      'en': 'Email',
      'es': '',
    },
    'dy1wuolx': {
      'en': 'Please enter your email',
      'es': '',
    },
    'z7lkgizv': {
      'en': 'Password',
      'es': '',
    },
    '49lc95lm': {
      'en': 'Please enter your password',
      'es': '',
    },
    'cq29ospk': {
      'en': 'LOGIN',
      'es': '',
    },
    'v0dgpp16': {
      'en': 'FORGOT PASSWORD',
      'es': '',
    },
    '88vaf9fg': {
      'en': 'REGISTER',
      'es': '',
    },
    '41w1jnr1': {
      'en': 'Home',
      'es': '',
    },
  },
  // LiveTVReg
  {
    'xs28rslf': {
      'en': 'Please Register to Access\n',
      'es': '',
    },
    'ywwtuy8d': {
      'en': 'Email',
      'es': '',
    },
    'un16d5v4': {
      'en': 'Please enter your email',
      'es': '',
    },
    'quae9in3': {
      'en': 'Password',
      'es': '',
    },
    'b3c2zvek': {
      'en': 'Please enter your password',
      'es': '',
    },
    'h2nnddkw': {
      'en': 'Confirm Password',
      'es': '',
    },
    'cvotcfcz': {
      'en': 'Please enter your password',
      'es': '',
    },
    '677a4r5j': {
      'en': 'Name',
      'es': '',
    },
    '1xenvr5q': {
      'en': 'Please enter your name',
      'es': '',
    },
    'x1tjqn48': {
      'en': 'Phone',
      'es': '',
    },
    'luksulyl': {
      'en': 'Please enter your phone',
      'es': '',
    },
    'e94806rj': {
      'en': 'REGISTER',
      'es': '',
    },
    'f172nhld': {
      'en': 'BACK',
      'es': '',
    },
    'x9fofn4d': {
      'en': 'Home',
      'es': '',
    },
  },
  // SermonNav
  {
    'ay95spta': {
      'en': 'Sermons',
      'es': '',
    },
    'fjmlxr38': {
      'en': 'Full Sermons',
      'es': '',
    },
    '2hf392ot': {
      'en': 'Full sermon videos (30-60 mins)',
      'es': '',
    },
    '4lpj6ndf': {
      'en': 'Sermon Jams',
      'es': '',
    },
    'etatg6rw': {
      'en': 'Mini sermon videos (2-8 mins)',
      'es': '',
    },
    'xs3umqab': {
      'en': 'Audio Sermons',
      'es': '',
    },
    '9fhlh3rr': {
      'en': 'Full Sermons on audio',
      'es': '',
    },
    'n3p079wp': {
      'en': 'The Church that had to Die',
      'es': '',
    },
    'd7whz6zs': {
      'en': 'Listen to an exclusive LiveTV podcast',
      'es': '',
    },
    'gajda0t2': {
      'en': 'Sermons',
      'es': '',
    },
  },
  // Bible
  {
    'ydtu8leb': {
      'en': 'Search',
      'es': '',
    },
    'kuta7q1b': {
      'en': 'Bible Verse',
      'es': '',
    },
    '11v9zbsm': {
      'en': '[example John 3:16]',
      'es': '',
    },
    '6bimqh5e': {
      'en': 'Search',
      'es': '',
    },
    '6bjrduxd': {
      'en': 'Bible',
      'es': '',
    },
  },
  // BibleChapters
  {
    'r2012142': {
      'en': 'Bible',
      'es': '',
    },
  },
  // BibleVerses
  {
    'w6vbp66e': {
      'en': 'Copy to Clipboard',
      'es': '',
    },
    'qaa9mjxt': {
      'en': 'Share',
      'es': '',
    },
    'mwqdwnxx': {
      'en': 'Create Verse Image',
      'es': '',
    },
    'yfvnimcg': {
      'en': 'Bible',
      'es': '',
    },
  },
  // DailyDevoCal
  {
    'vs390stm': {
      'en': 'Select a date and push go',
      'es': '',
    },
    'buvcmodc': {
      'en': 'GO!',
      'es': '',
    },
    'zwihpbx0': {
      'en': 'Daily',
      'es': '',
    },
  },
  // AudioSermons
  {
    'x92xmvgw': {
      'en': 'NEW',
      'es': '',
    },
    'al9ar1fu': {
      'en': 'Audio',
      'es': '',
    },
  },
  // chatPage
  {
    '4bgtq6bm': {
      'en': 'Group Chat',
      'es': '',
    },
    'y8hoy3nv': {
      'en': 'Home',
      'es': '',
    },
  },
  // allChats
  {
    '2u5y25f2': {
      'en': 'All Chats',
      'es': '',
    },
    'bebawnx3': {
      'en': 'Chats',
      'es': '',
    },
  },
  // addToChat
  {
    'gdpss8fw': {
      'en': 'Add Friends to chat',
      'es': '',
    },
    't7uwretk': {
      'en': 'Select the friends to add to chat.',
      'es': '',
    },
    'fz2ga91e': {
      'en': 'Search for friends...',
      'es': '',
    },
    'bgig67n1': {
      'en': 'Search',
      'es': '',
    },
    'y84jauti': {
      'en': 'Invite to Chat',
      'es': '',
    },
    '2zwgrr39': {
      'en': 'Home',
      'es': '',
    },
  },
  // groupChat
  {
    'so9zrpky': {
      'en': 'Create Group Chat',
      'es': '',
    },
    'hztxxm0u': {
      'en': 'Select the friends to add to chat.',
      'es': '',
    },
    '3sb6i61l': {
      'en': 'Search for friends...',
      'es': '',
    },
    'evdeqg4j': {
      'en': 'Search',
      'es': '',
    },
    'vqpmna9q': {
      'en': 'Create Chat',
      'es': '',
    },
    'u16c1agl': {
      'en': 'Home',
      'es': '',
    },
  },
  // startChat
  {
    '2p1b4n6i': {
      'en': 'Start a Chat',
      'es': '',
    },
    'e3000000': {
      'en': 'Select a friend to chat with.',
      'es': '',
    },
    '666cx1fi': {
      'en': 'Search for friends...',
      'es': '',
    },
    'fa41ilmr': {
      'en': 'Search',
      'es': '',
    },
    '4a0lc70k': {
      'en': 'Home',
      'es': '',
    },
  },
  // LiveTVReset
  {
    'wao6xb72': {
      'en': 'Reset Your Password\n',
      'es': '',
    },
    '1xmg8tr0': {
      'en': 'Email',
      'es': '',
    },
    'lv28xpkp': {
      'en': 'Please enter your email',
      'es': '',
    },
    '14tfusia': {
      'en': 'FORGOT PASSWORD',
      'es': '',
    },
    'wdnu84ke': {
      'en': 'Home',
      'es': '',
    },
  },
  // DailyDevoInfo
  {
    'd4n3inon': {
      'en': 'Devotion',
      'es': '',
    },
    'gl37rwru': {
      'en': 'Home',
      'es': '',
    },
    'iurg88sh': {
      'en': 'Pick Another Date',
      'es': '',
    },
    '2vjznxjb': {
      'en': 'Daily Verse',
      'es': '',
    },
    'jgar217r': {
      'en': 'Create Image',
      'es': '',
    },
    '3jwmuw2l': {
      'en': 'Today\'s Catechism',
      'es': '',
    },
    'w0bnj9p3': {
      'en': 'Practice Memorization',
      'es': '',
    },
    'u15284nq': {
      'en': 'View All Catechisms',
      'es': '',
    },
    '9tizj6h0': {
      'en': 'Possible Questions',
      'es': '',
    },
    'i4v5by1r': {
      'en': 'Today\'s Prayer Focus',
      'es': '',
    },
    '9hh6jmvf': {
      'en': 'Journal',
      'es': '',
    },
    '0s8cbzvm': {
      'en': 'Home',
      'es': '',
    },
    '7qrj3r3g': {
      'en': 'No journal entry created yet.',
      'es': '',
    },
    'n7ghlx39': {
      'en': 'Write Journal',
      'es': '',
    },
    'sw26nwm7': {
      'en': 'Edit Journal',
      'es': '',
    },
    'fpz8zsid': {
      'en': 'View All Journals',
      'es': '',
    },
    'lbse8uz2': {
      'en': 'Daily',
      'es': '',
    },
  },
  // ScriptureImage
  {
    '7l0otpwu': {
      'en': 'We are working on your image',
      'es': '',
    },
    's2n0euug': {
      'en': 'Your image is done!',
      'es': '',
    },
    'sd0n14hi': {
      'en': 'Download Image',
      'es': '',
    },
    'jy37suto': {
      'en': 'Daily',
      'es': '',
    },
  },
  // ExplainCatechism
  {
    'ohqtvo4a': {
      'en': 'What is a catechism?',
      'es': '',
    },
    '876pahb7': {
      'en':
          'Catechisms are a summary of the principles of Christian doctine in the form of questions and answers, used for the instruction in discipleship.\n\nCatechisms are to be used as a memorization tool that trains up everyone from small children to the older and wiser to understand key doctrines and make a case for their faith... a command found in Scripture for all believers.\n\nThe LiveTV app provides a daily catechism that will rotate every few days, allowing your family the opportunity to rehearse, memorize, ask questions, and study the key foundational elements of God\'s Word.',
      'es': '',
    },
    '1jpe7ae8': {
      'en': 'Daily',
      'es': '',
    },
  },
  // editProfile
  {
    'z6gxhzmh': {
      'en': 'Change Photo',
      'es': '',
    },
    'thfr0xvv': {
      'en': 'Full Name',
      'es': '',
    },
    'izalapgu': {
      'en': 'Your full name...',
      'es': '',
    },
    'iefvfvm2': {
      'en': 'Email Address',
      'es': '',
    },
    'ipgef90i': {
      'en': 'Your email..',
      'es': '',
    },
    '3zz4bmva': {
      'en': 'Phone Number',
      'es': '',
    },
    '4tv1xayx': {
      'en': 'Your email..',
      'es': '',
    },
    '3pvw5djb': {
      'en': 'Save Changes',
      'es': '',
    },
    'kxfm4c9w': {
      'en': 'Home',
      'es': '',
    },
  },
  // socialFeed
  {
    'nn603x6x': {
      'en': 'Welcome',
      'es': '',
    },
    'j6k6amdn': {
      'en': 'Checkout news and highlights below.',
      'es': '',
    },
    'li1ih031': {
      'en': 'Comment',
      'es': '',
    },
    'xuxmy966': {
      'en': 'Social',
      'es': '',
    },
  },
  // createPost
  {
    'q9un6fo5': {
      'en': 'Create Post',
      'es': '',
    },
    'nqjosgpc': {
      'en': 'Comment....',
      'es': '',
    },
    'y598wb5x': {
      'en': 'Create Post',
      'es': '',
    },
    'si2ztzqp': {
      'en': 'Home',
      'es': '',
    },
  },
  // postDetails
  {
    'l0knvb9d': {
      'en': '',
      'es': '',
    },
    'bcmlvh3d': {
      'en': '',
      'es': '',
    },
    'n2mtrc7y': {
      'en': 'Post',
      'es': '',
    },
    'phcfmi6h': {
      'en': 'Home',
      'es': '',
    },
  },
  // videoPage
  {
    'ht0o5xoa': {
      'en': 'Listen to Audio',
      'es': '',
    },
    '7sbiz5ue': {
      'en': 'Share This',
      'es': '',
    },
    '3grwmplv': {
      'en': 'Post This',
      'es': '',
    },
    'im1dbg47': {
      'en': 'Remind Me to Watch Later',
      'es': '',
    },
  },
  // AudioPodcast
  {
    'e509tnku': {
      'en': 'NEW',
      'es': '',
    },
    'vz94bl40': {
      'en': 'Audio',
      'es': '',
    },
  },
  // FullSermonVideos
  {
    'qsdri35o': {
      'en': 'NEW',
      'es': '',
    },
    '645tqy6t': {
      'en': 'Audio',
      'es': '',
    },
  },
  // sharePost
  {
    '9ax5rpno': {
      'en': 'Create Post',
      'es': '',
    },
    't7j4krer': {
      'en': 'Comment....',
      'es': '',
    },
    'agakjlcn': {
      'en': 'Create Post',
      'es': '',
    },
    '7wr2kaqw': {
      'en': 'Home',
      'es': '',
    },
  },
  // MiniSermonVideo
  {
    'gd43zoc2': {
      'en': 'NEW',
      'es': '',
    },
    'jwy0dgob': {
      'en': 'Audio',
      'es': '',
    },
  },
  // pushNotificationUpdate
  {
    'ubidlake': {
      'en': 'Send Update Reminders',
      'es': '',
    },
    'gm877zpz': {
      'en': 'Notification Title',
      'es': '',
    },
    'igzvhdao': {
      'en': 'Notification Message',
      'es': '',
    },
    'mgujenoj': {
      'en': 'Send Push Notification',
      'es': '',
    },
    'aamtjdxy': {
      'en': 'Home',
      'es': '',
    },
  },
  // Home
  {
    '7nhmiy2r': {
      'en': 'Check In Today ',
      'es': '',
    },
    '49yhgwcb': {
      'en': 'Let us know how you are doing',
      'es': '',
    },
    'exsprnnr': {
      'en': 'Pray for Others',
      'es': '',
    },
    'g6jzy0cs': {
      'en': 'Check here for prayer requests',
      'es': '',
    },
    'jb2765bb': {
      'en': 'Watch',
      'es': '',
    },
    '5m1l3zd2': {
      'en': 'Watch short videos',
      'es': '',
    },
    '85w1miyz': {
      'en': 'Studying the Bible',
      'es': '',
    },
    '4anpjgz0': {
      'en': '1',
      'es': '',
    },
    'q99zb6mc': {
      'en': 'Study a Verse Today',
      'es': '',
    },
    'hg2d0t2w': {
      'en': 'Walk through the study of a verse and create a study note',
      'es': '',
    },
    'ch2xql5i': {
      'en': '2',
      'es': '',
    },
    'jf69wt66': {
      'en': 'Daily Worship',
      'es': '',
    },
    'b98kmn7o': {
      'en':
          'Look at the daily verse, and try to answer the questions for the verse.',
      'es': '',
    },
    'd7mo5mci': {
      'en': 'Mark Complete',
      'es': '',
    },
    'd9akptt1': {
      'en': 'Praying',
      'es': '',
    },
    'lvphvg0m': {
      'en': '1',
      'es': '',
    },
    'cieluy6i': {
      'en': 'Pray the Lord\'s Prayer',
      'es': '',
    },
    'tgnvmwn7': {
      'en': 'Matthew 6:9-13',
      'es': '',
    },
    'b7lstear': {
      'en': '2',
      'es': '',
    },
    '0rsay8cn': {
      'en': 'Daily Worship',
      'es': '',
    },
    'g9qzgynr': {
      'en':
          'Look at the daily verse, and try to answer the questions for the verse.',
      'es': '',
    },
    'z41r7108': {
      'en': 'Mark Complete',
      'es': '',
    },
    'evbt6s8f': {
      'en': 'Forgiveness',
      'es': '',
    },
    '1h2xo0sm': {
      'en': '1',
      'es': '',
    },
    'g089mptz': {
      'en': 'Daily Worship',
      'es': '',
    },
    'fb3p9lfx': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    'h8l6h9wy': {
      'en': '2',
      'es': '',
    },
    'z941b4l2': {
      'en': 'Write a Letter',
      'es': '',
    },
    'nj2jm9up': {
      'en':
          'Write a letter to the person you need to forgive, even if you don\'t intend on sending it.',
      'es': '',
    },
    '3f480x3u': {
      'en': 'Mark Complete',
      'es': '',
    },
    '6y5t6jz4': {
      'en': 'Joy',
      'es': '',
    },
    'f0sbd11b': {
      'en': '1',
      'es': '',
    },
    'rbiu9a5v': {
      'en': 'Daily Worship',
      'es': '',
    },
    '0uyph0k1': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    'g8uo1woe': {
      'en': '2',
      'es': '',
    },
    'l57nem40': {
      'en': 'Read Philippians',
      'es': '',
    },
    '28p3ewvx': {
      'en': 'Read through the book of Philippians.',
      'es': '',
    },
    'ky19tcqj': {
      'en': 'Mark Complete',
      'es': '',
    },
    'wh8cg2of': {
      'en': 'Patience',
      'es': '',
    },
    'do7ol65r': {
      'en': '1',
      'es': '',
    },
    'u594lg0x': {
      'en': 'Daily Worship',
      'es': '',
    },
    'v6qhbipe': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    'dwo3284p': {
      'en': '2',
      'es': '',
    },
    '2akomwc2': {
      'en': 'Wait Upon the Lord',
      'es': '',
    },
    '41oq0zey': {
      'en': 'Set a timer, and dedicate 15 mins to prayer and study.',
      'es': '',
    },
    'd4arzvld': {
      'en': 'Mark Complete',
      'es': '',
    },
    'z3qxtx4p': {
      'en': 'Gratitude',
      'es': '',
    },
    'exn6h9k9': {
      'en': '1',
      'es': '',
    },
    'dsikaro5': {
      'en': 'Daily Worship',
      'es': '',
    },
    'csl1hu49': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    'dflyq7xz': {
      'en': '2',
      'es': '',
    },
    '2h0i39gr': {
      'en': 'Make a List',
      'es': '',
    },
    'gdfojstt': {
      'en': 'Write down 10 things you are thankful for.',
      'es': '',
    },
    'ipwxapqc': {
      'en': 'Mark Complete',
      'es': '',
    },
    'cg88d0zs': {
      'en': 'Compassion',
      'es': '',
    },
    'icarxh7u': {
      'en': '1',
      'es': '',
    },
    'ytt8dz44': {
      'en': 'Daily Worship',
      'es': '',
    },
    'iv4xakg3': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    'vwngfxmn': {
      'en': '2',
      'es': '',
    },
    'rm8fpbz8': {
      'en': 'Serve Someone',
      'es': '',
    },
    'ydwnqkk8': {
      'en': 'Choose one thing today to help someone that needs help.',
      'es': '',
    },
    '8rie9ujv': {
      'en': 'Mark Complete',
      'es': '',
    },
    'zusur3bx': {
      'en': 'Featured Sermon',
      'es': '',
    },
    '812uwve6': {
      'en': 'Featured Sermon Jam',
      'es': '',
    },
    'jxsrjbj3': {
      'en': 'Daily Worship',
      'es': '',
    },
    'omo4jpy2': {
      'en': 'NEW',
      'es': '',
    },
    '0ep8bn6h': {
      'en': 'NEW',
      'es': '',
    },
    '9qrnqco1': {
      'en': 'Bible',
      'es': '',
    },
    'qlslqy2d': {
      'en': 'Teaching Content',
      'es': '',
    },
    '0h9erfok': {
      'en': 'Study a Verse',
      'es': '',
    },
    'x96unswp': {
      'en': 'Chat',
      'es': '',
    },
    'cuuvbpx2': {
      'en': 'Social Feed',
      'es': '',
    },
    'l2elqbct': {
      'en': 'NEW',
      'es': '',
    },
    'x9wz7ghy': {
      'en': 'NEW',
      'es': '',
    },
    'izikyfik': {
      'en': 'My Journals',
      'es': '',
    },
    'rzx2ae9f': {
      'en': 'NEW',
      'es': '',
    },
    '2o2y16uk': {
      'en': 'My Study Notes',
      'es': '',
    },
    'qqbfqfvt': {
      'en': 'Home',
      'es': '',
    },
  },
  // FullSermonVideosCopy
  {
    'jp5lyxuh': {
      'en': 'NEW',
      'es': '',
    },
    'm0x6zw46': {
      'en': 'Test',
      'es': '',
    },
  },
  // AllCatechisms
  {
    'a0qzs6p5': {
      'en': 'All covered catechisms',
      'es': '',
    },
    'f0g0rivz': {
      'en': 'Practice Memorization',
      'es': '',
    },
    'u21hk6fb': {
      'en': 'Test2',
      'es': '',
    },
  },
  // levelUp
  {
    'erwcnooi': {
      'en': 'Congrats!',
      'es': '',
    },
    'ihmxooqi': {
      'en': 'You\'ve leveled up!',
      'es': '',
    },
    'lnd23byw': {
      'en': 'CLOSE',
      'es': '',
    },
    'bq2czmaa': {
      'en': 'Home',
      'es': '',
    },
  },
  // ExplainRewards
  {
    '5lqbescc': {
      'en': 'How does levels work?',
      'es': '',
    },
    'whneuet3': {
      'en':
          'Built in the LiveTV app as a motivational tool, the level system enables a user to be commended for their consistency in using the app to aide them in their relationship with Jesus.\n\nLevels should not be viewed as a competition, but rather a way to encourage and edify each believer to continue on.\n\nPOINTS:\n\n- Visiting the Daily Worship Screen (10)\n- Watching a Full Sermon Video (15)\n- Watching a Mini Sermon Video (15)\n- Listening to an Audio Sermon (15)\n- Listening to a Non-Sermon Audio (15)\n- Creating a journal entry (15)\n- Posting in the social feed (20)\n',
      'es': '',
    },
    'z8c9qz5j': {
      'en': 'Daily',
      'es': '',
    },
  },
  // DailyJournalEntryNew
  {
    'iwkhf46e': {
      'en': 'Home',
      'es': '',
    },
    'nsbm22bt': {
      'en': 'Meta Information',
      'es': '',
    },
    '7dyzv6s9': {
      'en': 'Your Journal',
      'es': '',
    },
    'e9ox0hpk': {
      'en': 'Starting writing your journal here...',
      'es': '',
    },
    'z868hstd': {
      'en': 'Submit Entry',
      'es': '',
    },
    '1m47a5zq': {
      'en': 'Daily',
      'es': '',
    },
  },
  // DailyJournalEntryEdit
  {
    '6fkjipja': {
      'en': 'Home',
      'es': '',
    },
    '489xyvsv': {
      'en': 'Meta Information',
      'es': '',
    },
    'ehzb4zd9': {
      'en': 'Your Journal',
      'es': '',
    },
    'pu6d96w3': {
      'en': 'Starting writing your journal here...',
      'es': '',
    },
    'rmyvm4z5': {
      'en': 'Save Changes',
      'es': '',
    },
    'rzl71jl1': {
      'en': 'Daily',
      'es': '',
    },
  },
  // DailyJournalView
  {
    'ute8hdkj': {
      'en': 'Home',
      'es': '',
    },
    'cw1uikd2': {
      'en': 'Meta Information',
      'es': '',
    },
    'l5q7vz0p': {
      'en': 'Your Journal',
      'es': '',
    },
    'z43brc07': {
      'en': 'Edit Journal',
      'es': '',
    },
    '3ikmrzeg': {
      'en': 'View All Journals',
      'es': '',
    },
    '2bu3go6n': {
      'en': 'Daily',
      'es': '',
    },
  },
  // AllJournals
  {
    'wzz5bw8n': {
      'en': 'Daily',
      'es': '',
    },
  },
  // activityFeed
  {
    'u6aa3vp0': {
      'en': 'Activity',
      'es': '',
    },
    'zcy0wbii': {
      'en': ' - ',
      'es': '',
    },
    'so0xziu0': {
      'en': 'Beginning of Activity',
      'es': '',
    },
  },
  // catechismPages
  {
    'q0lvyy5l': {
      'en': '20%',
      'es': '',
    },
    'iebk91g2': {
      'en': 'Continue',
      'es': '',
    },
    'zhdrqsp5': {
      'en': '40%',
      'es': '',
    },
    'kh2qcpmy': {
      'en': 'Reveal',
      'es': '',
    },
    'zg3xk4sj': {
      'en': 'Hide',
      'es': '',
    },
    'yoep1n8g': {
      'en': 'Continue',
      'es': '',
    },
    're2iudv9': {
      'en': '60%',
      'es': '',
    },
    '90pihdhi': {
      'en': 'Reveal',
      'es': '',
    },
    '31ihepif': {
      'en': 'Hide',
      'es': '',
    },
    'g0gki3zm': {
      'en': 'Continue',
      'es': '',
    },
    'v4qgv4b5': {
      'en': '80%',
      'es': '',
    },
    'm9mdjjaq': {
      'en': 'Reveal',
      'es': '',
    },
    'uhy6m02r': {
      'en': 'Hide',
      'es': '',
    },
    '1moie9le': {
      'en': 'Continue',
      'es': '',
    },
    'dxxelicd': {
      'en': '100%',
      'es': '',
    },
    'xf1qlkby': {
      'en': 'Reveal',
      'es': '',
    },
    '55gs60sh': {
      'en': 'Hide',
      'es': '',
    },
    'wqbld6bf': {
      'en': 'Finish',
      'es': '',
    },
    '7euvov77': {
      'en': 'Repeat',
      'es': '',
    },
  },
  // pushForAppVersion
  {
    '68vtrp3m': {
      'en': 'Send Push Notification',
      'es': '',
    },
    'ieyj1m8z': {
      'en': 'Notification Title',
      'es': '',
    },
    '78d3kt4s': {
      'en': 'Notification Message',
      'es': '',
    },
    'l7b83dio': {
      'en': 'Send Push Notification',
      'es': '',
    },
    '9rs60xi5': {
      'en': 'Home',
      'es': '',
    },
  },
  // pushForNonUsage
  {
    '0crl4y0b': {
      'en': 'Send Push Notification',
      'es': '',
    },
    'mrjuth3l': {
      'en': 'Notification Title',
      'es': '',
    },
    'x2rx6yny': {
      'en': 'Date of Notification',
      'es': '',
    },
    '0k8bjvpo': {
      'en': 'Notification Message',
      'es': '',
    },
    'dj36jp5r': {
      'en': 'Send Push Notification',
      'es': '',
    },
    'pzbf9ei1': {
      'en': 'Home',
      'es': '',
    },
  },
  // bibleStudyNotes
  {
    '1mrp1mfg': {
      'en': 'Bible Study Notes',
      'es': '',
    },
    'p7038tj5': {
      'en': 'Share',
      'es': '',
    },
    '1u1biht5': {
      'en': 'Book Overview',
      'es': '',
    },
    'k0gv3rjb': {
      'en': 'Key Word(s)',
      'es': '',
    },
    'dorl0ht5': {
      'en': 'Cross Reference(s)',
      'es': '',
    },
    '8957h8jh': {
      'en': 'WHAT IS THE CONTEXT?  (GRAMMATICAL AND CONTEXTUAL)',
      'es': '',
    },
    'h7wj8vrg': {
      'en': 'WHAT IS THE ORIGINAL INTENT OF THE AUTHOR?',
      'es': '',
    },
    'f0hbsr0b': {
      'en': 'HOW DOES THIS TRANSLATE TO OUR CONTEXT?',
      'es': '',
    },
    'nas9ujp7': {
      'en': 'WHAT DOES THIS DEMAND OF US?',
      'es': '',
    },
    'izirddbc': {
      'en': 'WHAT ABOUT THIS MAKES YOU UNCOMFORTABLE?',
      'es': '',
    },
    '9fglmx35': {
      'en': 'HOW DOES THIS POINT TO JESUS?',
      'es': '',
    },
    '9rnlqdxq': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudyOld
  {
    'n3nou5bj': {
      'en': 'Pray',
      'es': '',
    },
    '7gnkbk8j': {
      'en': '12.5%',
      'es': '',
    },
    '0ykyf6z7': {
      'en': 'Next',
      'es': '',
    },
    'n1754ztm': {
      'en': 'Stop and pray before studying.',
      'es': '',
    },
    't01p4o9o': {
      'en':
          'It is only by the Holy Spirit that we are able to correctly discern and interpret the Scriptures.  Stop and pray that the Holy Spirit would help you and that you would remain in a position of submission and humility to what He teaches you.',
      'es': '',
    },
    'fc2qpjql': {
      'en': 'Read the text',
      'es': '',
    },
    'hlxs05ra': {
      'en': '25%',
      'es': '',
    },
    'uj57rt5j': {
      'en': 'Next',
      'es': '',
    },
    'kt5x4msn': {
      'en': 'Read through a few times slowly and quickly.',
      'es': '',
    },
    'ul8bmgg4': {
      'en':
          'Familiarize yourself with the text you are studying.  Try to know it so well you don\'t have to go back and reference it as much.\n\n*Note: for our exercise, we will need to use the KJV Bible as it has Strong\'s references',
      'es': '',
    },
    'eq9r5kgd': {
      'en': 'Option 1',
      'es': '',
    },
    'tl9to1rf': {
      'en': 'Pick a Book first then click ->',
      'es': '',
    },
    '6vp5vz46': {
      'en': 'Option 1',
      'es': '',
    },
    '3xjwyjee': {
      'en': 'Pick a Chapter then click ->',
      'es': '',
    },
    '5sbtekym': {
      'en': 'Option 1',
      'es': '',
    },
    '7pysnctt': {
      'en': 'Pick a Verse then click ->',
      'es': '',
    },
    'gzrfhxjp': {
      'en': ' ',
      'es': '',
    },
    'on3f3cli': {
      'en': 'Examine overall objective of the book',
      'es': '',
    },
    'u5i150cf': {
      'en': '37.5%',
      'es': '',
    },
    '524k63sf': {
      'en': 'Next',
      'es': '',
    },
    'byezbccn': {
      'en':
          'Review the summary of the book you\'re studying, note the author and time it was written.  This helps build context.',
      'es': '',
    },
    '3dix00zr': {
      'en': 'Copy to Clipboard',
      'es': '',
    },
    'gvk6xuwp': {
      'en': 'Share',
      'es': '',
    },
    'pmuwl7p5': {
      'en': ' ',
      'es': '',
    },
    's2tv232c': {
      'en': 'Add to Study Notes',
      'es': '',
    },
    'hzn4x3dc': {
      'en': 'Lookup key words',
      'es': '',
    },
    'd4jaxd0q': {
      'en': '50%',
      'es': '',
    },
    'vlirhxpn': {
      'en': 'Next',
      'es': '',
    },
    'v94aja22': {
      'en':
          'PIck apart the verse word by word.  Look at each word carefully and in context.  Use this tool to help you reference it\'s strong\'s concordance values.  Each of these items below are words from the original language in the verse you are studying.  Click on the word to see information about it.  They appear in the order they do in the verse.',
      'es': '',
    },
    'mfwbxvgr': {
      'en': 'Copy to Clipboard',
      'es': '',
    },
    'ra2sosmi': {
      'en': 'Share',
      'es': '',
    },
    'jxjwgauy': {
      'en': 'Examine cross references',
      'es': '',
    },
    'ei5iumbf': {
      'en': '62.5%',
      'es': '',
    },
    '1b8bcbka': {
      'en': 'Next',
      'es': '',
    },
    'wwfn2wlu': {
      'en':
          'A great way to capture the meaning of a verse is by examing similar verses.  The best method for sound Biblical interpretation is using the Bible to interpret the Bible.  ',
      'es': '',
    },
    '4v0ybr17': {
      'en': 'Copy to Clipboard',
      'es': '',
    },
    'o1ictlt8': {
      'en': 'Share',
      'es': '',
    },
    '94fnz2ln': {
      'en': 'Ask Reflective Questions',
      'es': '',
    },
    'kyweulps': {
      'en': '75%',
      'es': '',
    },
    '05m3adu2': {
      'en': 'Next',
      'es': '',
    },
    'd4xlku9q': {
      'en':
          'Now that you have ascertained some knowledge regarding the text, you can reflect on the info by recording some thoughts to reflective questions.  Here are some of our favorite. ',
      'es': '',
    },
    'rztupcow': {
      'en': 'Copy to Clipboard',
      'es': '',
    },
    'cwn01b2w': {
      'en': 'Share',
      'es': '',
    },
    'xt12slr2': {
      'en': 'WHAT IS THE CONTEXT?  (GRAMMATICAL AND CONTEXTUAL)',
      'es': '',
    },
    'qacz7lea': {
      'en': '[Record your response...]',
      'es': '',
    },
    'nqng65nm': {
      'en': 'WHAT IS THE ORIGINAL INTENT OF THE AUTHOR?',
      'es': '',
    },
    '3tpcnlke': {
      'en': '[Record your response...]',
      'es': '',
    },
    'thjs3wt6': {
      'en': 'HOW DOES THIS TRANSLATE TO OUR CONTEXT?',
      'es': '',
    },
    '8m8rlabi': {
      'en': '[Record your response...]',
      'es': '',
    },
    '2oxj335u': {
      'en': 'WHAT DOES THIS DEMAND OF US?',
      'es': '',
    },
    'dswvnbom': {
      'en': '[Record your response...]',
      'es': '',
    },
    'qsigpzdh': {
      'en': 'WHAT ABOUT THIS MAKES YOU UNCOMFORTABLE?',
      'es': '',
    },
    'd6c7e4up': {
      'en': '[Record your response...]',
      'es': '',
    },
    'xhbcqbp8': {
      'en': 'HOW DOES THIS POINT TO JESUS?',
      'es': '',
    },
    '7kv6fska': {
      'en': '[Record your response...]',
      'es': '',
    },
    'ubg1qha7': {
      'en': 'RECORD NOTES',
      'es': '',
    },
    'b5xu27pu': {
      'en': 'NEXT',
      'es': '',
    },
    'hmejf0vv': {
      'en': 'Read Trusted Commentaries',
      'es': '',
    },
    'kngvdc70': {
      'en': '87.5%',
      'es': '',
    },
    '98gbzz88': {
      'en': 'Next',
      'es': '',
    },
    'j9aaf75d': {
      'en':
          'Read over and review trusted commentators to see how their study and persepectives align with yours.',
      'es': '',
    },
    '7nepym2j': {
      'en': 'Copy to Clipboard',
      'es': '',
    },
    'nr2uz0dx': {
      'en': 'Share',
      'es': '',
    },
    '8mmzsbr8': {
      'en':
          'John MacArthur\n\nKent R. Hughes\n\nR.C. Sproul\n\nCharles Spurgeon\n\nWayne Grudem',
      'es': '',
    },
    'hm9skikv': {
      'en': 'Finish and View Study',
      'es': '',
    },
    '0weqjh7g': {
      'en': 'View Your Study Details',
      'es': '',
    },
    '4bm8aa6h': {
      'en': '100%',
      'es': '',
    },
    '50ozgzzd': {
      'en': 'FINISH',
      'es': '',
    },
    'noqpe197': {
      'en':
          'Great work!  View your study notes.  This has been saved to your profile for future use.  You can also print or send study to your email.',
      'es': '',
    },
    '1af7kwzs': {
      'en': 'Copy to Clipboard',
      'es': '',
    },
    'zclem89v': {
      'en': 'Share',
      'es': '',
    },
    'z3xstztz': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudy3
  {
    'hckl8qnm': {
      'en': 'Examine overall objective of the book',
      'es': '',
    },
    'ce2ehu81': {
      'en': '37.5%',
      'es': '',
    },
    '11iloh01': {
      'en': 'Previous',
      'es': '',
    },
    'dxw4bv9o': {
      'en': 'Next',
      'es': '',
    },
    'pjqg0vc6': {
      'en':
          'Review the summary of the book you\'re studying, note the author and time it was written.  This helps build context.',
      'es': '',
    },
    '6cuw2s4l': {
      'en': ' ',
      'es': '',
    },
    'nqtpw4g3': {
      'en': 'Add to Study Notes',
      'es': '',
    },
    'nx49hcvb': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudy4
  {
    'lfk94za1': {
      'en': 'Lookup key words',
      'es': '',
    },
    'emxy2shx': {
      'en': '50%',
      'es': '',
    },
    '8ys99j4s': {
      'en': 'Previous',
      'es': '',
    },
    'zu3kdd3w': {
      'en': 'Next',
      'es': '',
    },
    'co3mugh2': {
      'en':
          'PIck apart the verse word by word.  Look at each word carefully and in context.  Use this tool to help you reference it\'s strong\'s concordance values.  Each of these items below are words from the original language in the verse you are studying.  Click on the word to see information about it.  They appear in the order they do in the verse.',
      'es': '',
    },
    'tdxb8acc': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudy5
  {
    'eb1bwmca': {
      'en': 'Examine cross references',
      'es': '',
    },
    '7djuep84': {
      'en': '62.5%',
      'es': '',
    },
    'nlgd8egz': {
      'en': 'Previous',
      'es': '',
    },
    'ykazujgv': {
      'en': 'Next',
      'es': '',
    },
    '8my9tlns': {
      'en':
          'A great way to capture the meaning of a verse is by examing similar verses.  The best method for sound Biblical interpretation is using the Bible to interpret the Bible.  ',
      'es': '',
    },
    '92p82pgq': {
      'en': 'Add to Study',
      'es': '',
    },
    'rz5gih7n': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudy6
  {
    'cajwli0o': {
      'en': 'Ask Reflective Questions',
      'es': '',
    },
    'hchgngup': {
      'en': '75%',
      'es': '',
    },
    'a9ds88sy': {
      'en': 'Previous',
      'es': '',
    },
    'm7832o7e': {
      'en': 'Next',
      'es': '',
    },
    '6nlha795': {
      'en':
          'Now that you have ascertained some knowledge regarding the text, you can reflect on the info by recording some thoughts to reflective questions.  Here are some of our favorite. ',
      'es': '',
    },
    '4hffr7zq': {
      'en': 'WHAT IS THE CONTEXT?  (GRAMMATICAL AND CONTEXTUAL)',
      'es': '',
    },
    '4tito7mw': {
      'en': '[Record your response...]',
      'es': '',
    },
    'x2x6lpf0': {
      'en': 'WHAT IS THE ORIGINAL INTENT OF THE AUTHOR?',
      'es': '',
    },
    't57xht5j': {
      'en': '[Record your response...]',
      'es': '',
    },
    '6flzfxqh': {
      'en': 'HOW DOES THIS TRANSLATE TO OUR CONTEXT?',
      'es': '',
    },
    '59y15xuv': {
      'en': '[Record your response...]',
      'es': '',
    },
    'ou0vj6tm': {
      'en': 'WHAT DOES THIS DEMAND OF US?',
      'es': '',
    },
    '4n9kynd1': {
      'en': '[Record your response...]',
      'es': '',
    },
    '69vw0y0h': {
      'en': 'WHAT ABOUT THIS MAKES YOU UNCOMFORTABLE?',
      'es': '',
    },
    'f48h7n9g': {
      'en': '[Record your response...]',
      'es': '',
    },
    'vefn78ut': {
      'en': 'HOW DOES THIS POINT TO JESUS?',
      'es': '',
    },
    'qvboi7lt': {
      'en': '[Record your response...]',
      'es': '',
    },
    'tl9kqgj7': {
      'en': 'Add to Study Notes',
      'es': '',
    },
    'wrjeha8v': {
      'en': 'NEXT',
      'es': '',
    },
    'f3wj4vvt': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudy7
  {
    '0k29bdub': {
      'en': 'Read Trusted Commentaries',
      'es': '',
    },
    'btv1cn8i': {
      'en': '87.5%',
      'es': '',
    },
    '5yqd4dca': {
      'en': 'Previous',
      'es': '',
    },
    'cilcykf0': {
      'en': 'Next',
      'es': '',
    },
    'lxh5zuop': {
      'en':
          'Read over and review trusted commentators to see how their study and persepectives align with yours.\n\nBelow is a list of trusted authors. These are not links, as most of these authors have multiple sources.',
      'es': '',
    },
    'azo9qk61': {
      'en':
          'John MacArthur\n\nKent R. Hughes\n\nR.C. Sproul\n\nCharles Spurgeon\n\nWayne Grudem',
      'es': '',
    },
    'pvju3xrm': {
      'en': 'Finish and View Study',
      'es': '',
    },
    'u7mf7lih': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudy8
  {
    'a4wcv8ek': {
      'en': 'View Your Study Details',
      'es': '',
    },
    'j8upxh7v': {
      'en': '100%',
      'es': '',
    },
    'welvxgvq': {
      'en': 'Previous',
      'es': '',
    },
    '8tc08v3r': {
      'en': 'FINISH',
      'es': '',
    },
    '3dbnjnmg': {
      'en':
          'Great work!  View your study notes.  This has been saved to your profile for future use.  You can also print or send study to your email.',
      'es': '',
    },
    '2ast9wj8': {
      'en': 'View Bible Study Note',
      'es': '',
    },
    'nta2j0vw': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudy1
  {
    '07c6n202': {
      'en': 'Pray',
      'es': '',
    },
    'b1r7yvq0': {
      'en': '12.5%',
      'es': '',
    },
    'ju6ub38g': {
      'en': 'Next',
      'es': '',
    },
    'lcunwh4y': {
      'en': 'Stop and pray before studying.',
      'es': '',
    },
    'xfk8itzv': {
      'en':
          'It is only by the Holy Spirit that we are able to correctly discern and interpret the Scriptures.  Stop and pray that the Holy Spirit would help you and that you would remain in a position of submission and humility to what He teaches you.',
      'es': '',
    },
    'ubtk2jcl': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudy2
  {
    'togfuwmz': {
      'en': 'Read the text',
      'es': '',
    },
    '6fh6ddw0': {
      'en': '25%',
      'es': '',
    },
    'h5m621e1': {
      'en':
          'Familiarize yourself with the text you are studying.  Try to know it so well you don\'t have to go back and reference it as much.\n\n*Note: for our exercise, we will need to use the KJV Bible as it has Strong\'s references',
      'es': '',
    },
    'nngpe1ip': {
      'en': 'Select your verse:',
      'es': '',
    },
    '3g6i6zoe': {
      'en': 'Option 1',
      'es': '',
    },
    '4cd2722d': {
      'en': 'Pick a Book then click ->',
      'es': '',
    },
    '2qttd65o': {
      'en': 'Option 1',
      'es': '',
    },
    'og22ta4s': {
      'en': 'Pick a Chapter then click ->',
      'es': '',
    },
    'i03g7khx': {
      'en': 'Option 1',
      'es': '',
    },
    'eeypv66d': {
      'en': 'Pick a Verse then click ->',
      'es': '',
    },
    'qx987paf': {
      'en': 'Reset Verse',
      'es': '',
    },
    'wvxrdk7q': {
      'en': 'Previous',
      'es': '',
    },
    't2pkot84': {
      'en': 'Next',
      'es': '',
    },
    'y750bgjr': {
      'en': 'Previous notes on this verse',
      'es': '',
    },
    'p0sq1hrn': {
      'en': ' ',
      'es': '',
    },
    'qk4qicid': {
      'en': 'Yo',
      'es': '',
    },
  },
  // discipleshipMenteeOLD
  {
    'frna55zk': {
      'en': 'Remind Them',
      'es': '',
    },
    'g5qdi64y': {
      'en': 'Send Message',
      'es': '',
    },
    'pfwcvdlo': {
      'en': 'My Items',
      'es': '',
    },
    '45xpyzdj': {
      'en': 'Due: Today',
      'es': '',
    },
    'y61vtk8u': {
      'en': '70% Completed',
      'es': '',
    },
    'j4dfdfty': {
      'en': '1',
      'es': '',
    },
    'nll7a2fb': {
      'en': 'Daily Worship',
      'es': '',
    },
    'uortu5cr': {
      'en': 'Daily Worship',
      'es': '',
    },
    'jocc1s5h': {
      'en': '2',
      'es': '',
    },
    'j8zuofm1': {
      'en': 'Catechism Practice',
      'es': '',
    },
    'rlaeib1b': {
      'en': 'Catechism Practice',
      'es': '',
    },
    '2cubonas': {
      'en': '3',
      'es': '',
    },
    'olze84le': {
      'en': 'Journal (Coming Soon)',
      'es': '',
    },
    'nc8bnasu': {
      'en': '4',
      'es': '',
    },
    '9yc4x0vn': {
      'en': 'Reading List (Coming Soon)',
      'es': '',
    },
    'v859rcj5': {
      'en': '5',
      'es': '',
    },
    'cj39vx25': {
      'en': 'Prayer List (Coming Soon)',
      'es': '',
    },
    'v27x6qhj': {
      'en': '6',
      'es': '',
    },
    'hcasm0ky': {
      'en': 'Weeds to Pull (Coming Soon)',
      'es': '',
    },
    '907lfvm7': {
      'en': '7',
      'es': '',
    },
    'gdlull95': {
      'en': 'Seeds to Plant (Coming Soon)',
      'es': '',
    },
    'ka4xqq05': {
      'en': 'YoYo',
      'es': '',
    },
  },
  // discipleshipMentorOLD
  {
    'tc5tbadd': {
      'en': 'YoYo',
      'es': '',
    },
  },
  // discipleshipPrayers
  {
    'zgqguwus': {
      'en': 'Prayers',
      'es': '',
    },
    '5zoatio3': {
      'en': 'Expired\n\nDo you want to renew?',
      'es': '',
    },
    '2bf8kqsb': {
      'en': 'Pray',
      'es': '',
    },
  },
  // discipleshipHome
  {
    'q7p9tqa2': {
      'en': 'Discipleship Coaching',
      'es': '',
    },
    'he0tbh6z': {
      'en': 'Here are some tools to help you in your spiritual growth.  ',
      'es': '',
    },
    '7vlzk20z': {
      'en': 'History',
      'es': '',
    },
    'g48rj8w9': {
      'en': 'How are you today?',
      'es': '',
    },
    'tpyxiotq': {
      'en': 'Physically',
      'es': '',
    },
    'k4y1q77e': {
      'en': 'Rate how you are doing physically today.',
      'es': '',
    },
    'g4ko0go3': {
      'en': 'Mentally',
      'es': '',
    },
    'y3gnukpu': {
      'en': 'Rate how you are doing mentally.',
      'es': '',
    },
    '62q040xk': {
      'en': 'Spiritually',
      'es': '',
    },
    '12r113qz': {
      'en': 'Rate how you are doing spiritually.',
      'es': '',
    },
    'r3vmhdxl': {
      'en': 'Prayer',
      'es': '',
    },
    'aos4ej5w': {
      'en': 'How can we pray for you?',
      'es': '',
    },
    'wino0c8s': {
      'en': '[Enter Prayer...]',
      'es': '',
    },
    'dm6eeksj': {
      'en': 'Submit your prayer for public',
      'es': '',
    },
    '3zjskaqv': {
      'en': 'Submit Prayer',
      'es': '',
    },
    '16ml9h83': {
      'en': 'How are you today?',
      'es': '',
    },
    'fdq4z10c': {
      'en': 'Today, I need help with... (Pick One)',
      'es': '',
    },
    'x7yec5z5': {
      'en': 'Studying the Bible',
      'es': '',
    },
    '769ifjs0': {
      'en': 'Praying',
      'es': '',
    },
    'pk43f7u1': {
      'en': 'Forgiveness',
      'es': '',
    },
    'c6b30tb7': {
      'en': 'Joy',
      'es': '',
    },
    'nv7foc1j': {
      'en': 'Patience',
      'es': '',
    },
    'd3yr9tew': {
      'en': 'Gratitude',
      'es': '',
    },
    'idki8y3u': {
      'en': 'Compassion',
      'es': '',
    },
    'zvqihf49': {
      'en': 'Submit',
      'es': '',
    },
    'xsey2bak': {
      'en': 'Studying the Bible',
      'es': '',
    },
    'ux3rmup8': {
      'en': '1',
      'es': '',
    },
    'hxoy9cc1': {
      'en': 'Study a Verse Today',
      'es': '',
    },
    'frqjsvwj': {
      'en': 'Walk through the study of a verse and create a study note',
      'es': '',
    },
    '43kkiuq9': {
      'en': '2',
      'es': '',
    },
    '89few0t8': {
      'en': 'Daily Worship',
      'es': '',
    },
    '7afba4dy': {
      'en':
          'Look at the daily verse, and try to answer the questions for the verse.',
      'es': '',
    },
    '27505ws1': {
      'en': 'Praying',
      'es': '',
    },
    'smhs7kkr': {
      'en': '1',
      'es': '',
    },
    'yt0y7hv5': {
      'en': 'Pray the Lord\'s Prayer',
      'es': '',
    },
    'gi1u6ynb': {
      'en': 'Matthew 6:9-13',
      'es': '',
    },
    'd3s123bf': {
      'en': '2',
      'es': '',
    },
    'sryoqp89': {
      'en': 'Daily Worship',
      'es': '',
    },
    '6hoe97ht': {
      'en':
          'Look at the daily verse, and try to answer the questions for the verse.',
      'es': '',
    },
    '61khltq3': {
      'en': 'Forgiveness',
      'es': '',
    },
    'c9edk9oi': {
      'en': '1',
      'es': '',
    },
    'jmollpuq': {
      'en': 'Daily Worship',
      'es': '',
    },
    'sjzzk688': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    'feg1ucfi': {
      'en': '2',
      'es': '',
    },
    'hmr8a0tw': {
      'en': 'Write a Letter',
      'es': '',
    },
    'eon7hoas': {
      'en':
          'Write a letter to the person you need to forgive, even if you don\'t intend on sending it.',
      'es': '',
    },
    '89q1c1z7': {
      'en': 'Joy',
      'es': '',
    },
    'dm1pnmsk': {
      'en': '1',
      'es': '',
    },
    'f295mndx': {
      'en': 'Daily Worship',
      'es': '',
    },
    'trk75l90': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    'p8b2jfji': {
      'en': '2',
      'es': '',
    },
    'k7f8146e': {
      'en': 'Read Philippians',
      'es': '',
    },
    'fc6jnby2': {
      'en': 'Read through the book of Philippians.',
      'es': '',
    },
    '1hqmv7o3': {
      'en': 'Patience',
      'es': '',
    },
    '39vds13o': {
      'en': '1',
      'es': '',
    },
    'f58cgdn3': {
      'en': 'Daily Worship',
      'es': '',
    },
    '9q0y967h': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    'jyay2qob': {
      'en': '2',
      'es': '',
    },
    'y6ps44b5': {
      'en': 'Wait Upon the Lord',
      'es': '',
    },
    'mdphe5ql': {
      'en': 'Set a timer, and dedicate 15 mins to prayer and study.',
      'es': '',
    },
    'bsdohxlv': {
      'en': 'Gratitude',
      'es': '',
    },
    'ub5wb0no': {
      'en': '1',
      'es': '',
    },
    '33w9layz': {
      'en': 'Daily Worship',
      'es': '',
    },
    '7ioigvgf': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    '7228fhzn': {
      'en': '2',
      'es': '',
    },
    'ytxtpa37': {
      'en': 'Make a List',
      'es': '',
    },
    'pld47yom': {
      'en': 'Write down 10 things you are thankful for.',
      'es': '',
    },
    'gefxypch': {
      'en': 'Compassion',
      'es': '',
    },
    '51c549pb': {
      'en': '1',
      'es': '',
    },
    '4b7c9p52': {
      'en': 'Daily Worship',
      'es': '',
    },
    'e08klywf': {
      'en': 'Review the daily worship page.',
      'es': '',
    },
    's78pk6jd': {
      'en': '2',
      'es': '',
    },
    'urnmmgdx': {
      'en': 'Serve Someone',
      'es': '',
    },
    '4zdeescs': {
      'en': 'Choose one thing today to help someone that needs help.',
      'es': '',
    },
    '24g3s4sh': {
      'en': 'Your activity today',
      'es': '',
    },
    'tmnymacx': {
      'en': 'Daily Worship',
      'es': '',
    },
    'bsv0iqrm': {
      'en': 'Catechism Practice',
      'es': '',
    },
    'c2o237gz': {
      'en': 'Journal',
      'es': '',
    },
    'b1u7o0bo': {
      'en': 'Pray for someone (Coming Soon)',
      'es': '',
    },
    'a4ff5ui2': {
      'en': 'Study a verse (Coming Soon)',
      'es': '',
    },
    'r003ys35': {
      'en': 'Pray the Lord\'s Prayer (Coming Soon)',
      'es': '',
    },
    'yc3qrw2j': {
      'en': 'Write a Letter (Coming Soon)',
      'es': '',
    },
    'mozdy0sh': {
      'en': 'Read in Philippians (Coming Soon)',
      'es': '',
    },
    'ulzr6c5f': {
      'en': 'Wait Upon the Lord (Coming Soon)',
      'es': '',
    },
    'pox188vv': {
      'en': 'Make a List (Coming Soon)',
      'es': '',
    },
    'yaxvpmi3': {
      'en': 'Serve Someone (Coming Soon)',
      'es': '',
    },
    'v63a4yld': {
      'en': 'YoYo',
      'es': '',
    },
  },
  // viewPrayer
  {
    '4a4cs1ny': {
      'en': 'How they are doing',
      'es': '',
    },
    'xkdhsz82': {
      'en': 'Physically',
      'es': '',
    },
    '6juplrij': {
      'en': 'Mentally',
      'es': '',
    },
    'nip9haog': {
      'en': 'Spiritually',
      'es': '',
    },
    '7c6qfefo': {
      'en': 'Pray',
      'es': '',
    },
  },
  // discipleshipIntroOLD
  {
    'g4llk4dd': {
      'en': 'Discipleship Coaching',
      'es': '',
    },
    'un5wkws3': {
      'en':
          'Here are some tools to help you in your spiritual growth.  Pick a mentor and go for it!',
      'es': '',
    },
    'sssugs2x': {
      'en': 'Your Mentor',
      'es': '',
    },
    '5qq81zoq': {
      'en': 'You!',
      'es': '',
    },
    'p1o40hu1': {
      'en': 'Pick a Mentor',
      'es': '',
    },
    'www1pmgr': {
      'en':
          'Pick someone you will be accountable to.  If you cannot find them, encourage them to download the app.',
      'es': '',
    },
    '1v26qzad': {
      'en': 'Search for friends...',
      'es': '',
    },
    'zx7hhpru': {
      'en': 'Search',
      'es': '',
    },
    '8zse7v6e': {
      'en': 'Request',
      'es': '',
    },
    '37npjz02': {
      'en': 'My Items',
      'es': '',
    },
    '3w7mr72i': {
      'en': 'Due: Today',
      'es': '',
    },
    'nogpyb9a': {
      'en': '1',
      'es': '',
    },
    '8gyzq1q7': {
      'en': 'Daily Worship',
      'es': '',
    },
    '9a5xvlze': {
      'en': 'Daily Worship',
      'es': '',
    },
    '8agaihh2': {
      'en': '2',
      'es': '',
    },
    '8xb5q0u7': {
      'en': 'Catechism Practice',
      'es': '',
    },
    'mq94pgey': {
      'en': 'Catechism Practice',
      'es': '',
    },
    'gsd5z5mn': {
      'en': '3',
      'es': '',
    },
    'u8kmy6tn': {
      'en': 'Journal (Coming Soon)',
      'es': '',
    },
    'ryqi9mun': {
      'en': '4',
      'es': '',
    },
    'fjh4mgf0': {
      'en': 'Reading List (Coming Soon)',
      'es': '',
    },
    'zhs0sc1q': {
      'en': '5',
      'es': '',
    },
    '6gejo3jc': {
      'en': 'Prayer List (Coming Soon)',
      'es': '',
    },
    'zfbmo1ag': {
      'en': '6',
      'es': '',
    },
    '5dt26idq': {
      'en': 'Weeds to Pull (Coming Soon)',
      'es': '',
    },
    'af1nem17': {
      'en': '7',
      'es': '',
    },
    '93j7ohyv': {
      'en': 'Seeds to Plant (Coming Soon)',
      'es': '',
    },
    '1s2jiii0': {
      'en': 'YoYo',
      'es': '',
    },
  },
  // pushNotificationOptions
  {
    'y2aib8q2': {
      'en': 'Users that haven\'t logged in for 30 days',
      'es': '',
    },
    '6ai1t4hn': {
      'en': 'Users that have an outdated app',
      'es': '',
    },
    '9iq8d6ky': {
      'en': 'Light haptic',
      'es': '',
    },
    '2lsh7imd': {
      'en': 'Medium haptic',
      'es': '',
    },
    'ij3rrnef': {
      'en': 'Heavy haptic',
      'es': '',
    },
    'bd8mfmto': {
      'en': 'Selection click',
      'es': '',
    },
    'lj1zxri8': {
      'en': 'Vibrate',
      'es': '',
    },
    '92kjzxy4': {
      'en': 'Home',
      'es': '',
    },
  },
  // bibleStudyNotesAll
  {
    '8vgeybct': {
      'en': 'Search for verse reference or content...',
      'es': '',
    },
    've0z4330': {
      'en': 'Search',
      'es': '',
    },
    'ma9y8nr5': {
      'en': 'Tap and hold for the option to delete.',
      'es': '',
    },
    'xr30vtnm': {
      'en': 'Your Notes',
      'es': '',
    },
    '032w6r1n': {
      'en': 'Notes Shared with You',
      'es': '',
    },
    'q7s12oyr': {
      'en': 'Public Notes',
      'es': '',
    },
    'f1884op0': {
      'en': 'Daily',
      'es': '',
    },
  },
  // BibleVersesImage
  {
    '31mf8u4m': {
      'en': 'Bible',
      'es': '',
    },
  },
  // bibleStudyNoteOLD
  {
    'kv6kat54': {
      'en': 'WHAT IS THE CONTEXT?  (GRAMMATICAL AND CONTEXTUAL)',
      'es': '',
    },
    'dmm4c30l': {
      'en': 'WHAT IS THE ORIGINAL INTENT OF THE AUTHOR?',
      'es': '',
    },
    '0shajyo1': {
      'en': 'HOW DOES THIS TRANSLATE TO OUR CONTEXT?',
      'es': '',
    },
    '2ql78k5v': {
      'en': 'WHAT DOES THIS DEMAND OF US?',
      'es': '',
    },
    'c8ysvbo4': {
      'en': 'WHAT ABOUT THIS MAKES YOU UNCOMFORTABLE?',
      'es': '',
    },
    'lui5smyg': {
      'en': 'HOW DOES THIS POINT TO JESUS?',
      'es': '',
    },
    'q0tiz97w': {
      'en': 'Yo',
      'es': '',
    },
  },
  // bibleStudyNoteNEW
  {
    '9cf7x5ii': {
      'en': 'Send Note',
      'es': '',
    },
    '1p9sk6lk': {
      'en': 'Book Overview',
      'es': '',
    },
    '9c1z08xg': {
      'en': 'Key Word(s)',
      'es': '',
    },
    'wwwsqft2': {
      'en': 'Cross Reference(s)',
      'es': '',
    },
    '5sn1bzuo': {
      'en': 'WHAT IS THE CONTEXT?  (GRAMMATICAL AND CONTEXTUAL)',
      'es': '',
    },
    'e6lzgw2s': {
      'en': 'WHAT IS THE ORIGINAL INTENT OF THE AUTHOR?',
      'es': '',
    },
    'b1dr2so1': {
      'en': 'HOW DOES THIS TRANSLATE TO OUR CONTEXT?',
      'es': '',
    },
    'we04k7lr': {
      'en': 'WHAT DOES THIS DEMAND OF US?',
      'es': '',
    },
    '7su8upur': {
      'en': 'WHAT ABOUT THIS MAKES YOU UNCOMFORTABLE?',
      'es': '',
    },
    'ufwst3dr': {
      'en': 'HOW DOES THIS POINT TO JESUS?',
      'es': '',
    },
    'g1yuw448': {
      'en': 'Yo',
      'es': '',
    },
  },
  // SermonHub
  {
    'eqg6ode0': {
      'en': 'Option 1',
      'es': '',
    },
    'g3vdh08z': {
      'en': 'Select series...',
      'es': '',
    },
    'xf0k4b6s': {
      'en': '',
      'es': '',
    },
    'loqittmy': {
      'en': 'Option 1',
      'es': '',
    },
    '5nnp2ndu': {
      'en': 'Sermon Jams (1-7 mins)',
      'es': '',
    },
    'ymjm7vdg': {
      'en': 'Full Sermons (30-60 mins)',
      'es': '',
    },
    'ki6j5ew3': {
      'en': 'Clear Filter',
      'es': '',
    },
    'q2gadoq8': {
      'en': 'NEW',
      'es': '',
    },
    'ko0m3hbx': {
      'en': 'NEW',
      'es': '',
    },
    'cj1vk2nd': {
      'en': 'NEW',
      'es': '',
    },
    'q8ajado9': {
      'en': 'NEW',
      'es': '',
    },
    'zocmh1jb': {
      'en': 'NEW',
      'es': '',
    },
    '562qwuve': {
      'en': 'NEW',
      'es': '',
    },
    '5abzw4hg': {
      'en': 'Hub',
      'es': '',
    },
  },
  // MyChurch
  {
    '1rn67akv': {
      'en': 'Live Church',
      'es': '',
    },
    'oe1wvxjm': {
      'en': '1244 US Hwy 60 E, Republic, MO 65738',
      'es': '',
    },
    '5jd7t6m3': {
      'en': 'Phone: 417-815-5775',
      'es': '',
    },
    'm80nar0y': {
      'en': 'Sunday Guide',
      'es': '',
    },
    'njq4iiyg': {
      'en': 'NEW',
      'es': '',
    },
    '23tg1fm8': {
      'en': 'Text Us',
      'es': '',
    },
    '4t6ns6pg': {
      'en': 'Home',
      'es': '',
    },
  },
  // FindMyChurch
  {
    '8vpn4fuh': {
      'en':
          'We couldn\'t find a church attached to your account.  Would you like to find one?',
      'es': '',
    },
    '2dc88b4c': {
      'en': 'Select',
      'es': '',
    },
    '5978owbo': {
      'en': 'What if my church isn\'t on this list?',
      'es': '',
    },
    'xtc4kmir': {
      'en': 'Register a Church by Chat',
      'es': '',
    },
    'u84drj8n': {
      'en': 'Home',
      'es': '',
    },
  },
  // StudyGuide
  {
    'bppcw8nh': {
      'en': 'Live Church',
      'es': '',
    },
    '28jxrgms': {
      'en': '1244 US Hwy 60 E, Republic, MO 65738',
      'es': '',
    },
    'zpao46cw': {
      'en': 'Phone: 417-815-5775',
      'es': '',
    },
    'comhe1hu': {
      'en': 'Home',
      'es': '',
    },
  },
  // HelpModal
  {
    '4keapt50': {
      'en': 'Check In Today ',
      'es': '',
    },
    'ogjxbadm': {
      'en': 'Let us know how you are doing',
      'es': '',
    },
    'pk37jnw6': {
      'en': 'Pray for Others',
      'es': '',
    },
    'tma00v0b': {
      'en': 'Check here for prayer requests',
      'es': '',
    },
    'r5dc8vo9': {
      'en': 'Watch LiveTV (Coming Soon)',
      'es': '',
    },
    '1iwfitvb': {
      'en': 'Streaming and on demand content',
      'es': '',
    },
    'wt9vngf2': {
      'en': 'Featured Sermon',
      'es': '',
    },
    'f9bf05e8': {
      'en': 'Featured Sermon Jam',
      'es': '',
    },
    'gzvjdu7u': {
      'en': 'Daily Worship',
      'es': '',
    },
    '4bb9hpg5': {
      'en': 'NEW',
      'es': '',
    },
    'vv81gnjc': {
      'en': 'NEW',
      'es': '',
    },
    'oo5mohvf': {
      'en': 'Bible',
      'es': '',
    },
    '3aja0sp0': {
      'en': 'Teaching Content',
      'es': '',
    },
    '7n7mywyt': {
      'en': 'Study a Verse',
      'es': '',
    },
    'mnoyq865': {
      'en': 'Chat',
      'es': '',
    },
    'tfqsvsx3': {
      'en': 'Social Feed',
      'es': '',
    },
    'npdiwx2a': {
      'en': 'NEW',
      'es': '',
    },
    'd9yy13ff': {
      'en': 'NEW',
      'es': '',
    },
    '67gf0iq0': {
      'en': 'My Journals',
      'es': '',
    },
    'dze7w8ca': {
      'en': 'NEW',
      'es': '',
    },
    'nbcp0um7': {
      'en': 'My Study Notes',
      'es': '',
    },
    '92p40wzc': {
      'en': 'Home',
      'es': '',
    },
  },
  // congratsDiscipleship
  {
    'z0hcrh7q': {
      'en': 'Congratulations!',
      'es': '',
    },
    '948xnxnt': {
      'en':
          'Completing your steps helps you grow in your walk with Christ.\n\nHit the GO Home button to choose another topic or close the option for now. Topics will appear again on the Home screen in two weeks.',
      'es': '',
    },
    'toy3qe78': {
      'en': 'Go Home',
      'es': '',
    },
    'f92ftcu6': {
      'en': 'Daily',
      'es': '',
    },
  },
  // BroadcastListing
  {
    '1u9xzuov': {
      'en': 'Videos',
      'es': '',
    },
    'sdinch0n': {
      'en': 'NEW',
      'es': '',
    },
    'ymwhr6u7': {
      'en': 'Start Broadcast',
      'es': '',
    },
    '11bj5ccb': {
      'en': 'Home',
      'es': '',
    },
  },
  // StartBroadcast
  {
    'ujlb6i82': {
      'en': 'Live',
      'es': '',
    },
    'uqznyyqg': {
      'en': 'Live',
      'es': '',
    },
    'wyz7y138': {
      'en': 'Start Stream',
      'es': '',
    },
    'rzki7fab': {
      'en': 'Home',
      'es': '',
    },
  },
  // NewBroadcast2
  {
    '2g7z8htb': {
      'en': 'Live',
      'es': '',
    },
    '3fjlp3bg': {
      'en': 'Live',
      'es': '',
    },
    '7nopicu9': {
      'en': 'Start Stream',
      'es': '',
    },
    'z5l5sdqm': {
      'en': 'Home',
      'es': '',
    },
  },
  // VideoFeed
  {
    'uskuvz5d': {
      'en': 'Home',
      'es': '',
    },
  },
  // EndDrawer
  {
    '0ocp1cvu': {
      'en': 'Settings',
      'es': 'Ajustes',
    },
    '2kmkc9e3': {
      'en': 'Daily Worship Reminders',
      'es': 'Recordatorios diarios de adoración',
    },
    'dc42lcno': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'ihctqkz3': {
      'en': 'My Activity',
      'es': 'Editar perfil',
    },
    'gmp1q2ey': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
    },
    'rruv9mjg': {
      'en': 'Delete Account',
      'es': 'Borrar cuenta',
    },
    '1kx9jig7': {
      'en': 'Send Worship Reminder',
      'es': 'Enviar recordatorios',
    },
    'qrcbimcw': {
      'en': 'Test YouTube Player',
      'es': 'Enviar recordatorios',
    },
    'kpsv18qr': {
      'en': 'Push Notifications',
      'es': 'Notificaciones push',
    },
  },
  // homeHeader
  {
    '5pxb5t7v': {
      'en': 'UPDATE APP',
      'es': '',
    },
    'nma65174': {
      'en': 'My Church',
      'es': '',
    },
  },
  // levelUpSheet
  {
    'rumzscav': {
      'en': 'Congrats!',
      'es': '',
    },
    '48m3rvvs': {
      'en': 'You\'ve leveled up!',
      'es': '',
    },
  },
  // journalBottomSheet
  {
    'l61t7i1h': {
      'en': 'Save',
      'es': '',
    },
    'ygxe2me4': {
      'en': 'Save and Send Journal to Someone',
      'es': '',
    },
    'oasbdwqv': {
      'en': 'Save and Post Journal to Social Feed',
      'es': '',
    },
    'td0z3e41': {
      'en': 'Cancel',
      'es': '',
    },
  },
  // sendJournalToChat
  {
    'leiw1nuf': {
      'en': 'Search for friends...',
      'es': '',
    },
    'y3i9ybcd': {
      'en': 'Search',
      'es': '',
    },
    'tomtafvl': {
      'en': 'Cancel',
      'es': '',
    },
  },
  // StrongsSheet
  {
    'zaqy707i': {
      'en': 'Add to Study Notes',
      'es': '',
    },
  },
  // bibleNoteBottomSheet
  {
    'muamb4pq': {
      'en': 'Make Note Public',
      'es': '',
    },
    'kcdqixkd': {
      'en': 'Send Note to Someone',
      'es': '',
    },
    'iqtl63bg': {
      'en': 'Cancel',
      'es': '',
    },
  },
  // FrontDrawer
  {
    'iwrn0yaa': {
      'en': 'Daily Worship',
      'es': '',
    },
    '53eka271': {
      'en': 'Bible',
      'es': '',
    },
    'taiqm5mg': {
      'en': 'Teaching',
      'es': '',
    },
    'gcuwpqs8': {
      'en': 'Study a Verse',
      'es': '',
    },
    'eqskyudp': {
      'en': 'Chat',
      'es': '',
    },
    '4s4vwn09': {
      'en': 'Social Feed',
      'es': '',
    },
    'low8ry54': {
      'en': 'My Journals',
      'es': '',
    },
    '3jagxthm': {
      'en': 'My Notes',
      'es': '',
    },
  },
  // sendBibleNoteToPerson
  {
    '29209g0g': {
      'en': 'Search for friends...',
      'es': '',
    },
    '5a6lu9xc': {
      'en': 'Search',
      'es': '',
    },
    'uvxageil': {
      'en': 'Cancel',
      'es': '',
    },
  },
  // editPrayerBottomSheet
  {
    'u0qaz9bz': {
      'en': 'Rate how you are doing physically today.',
      'es': '',
    },
    'tb4jj5je': {
      'en': 'Rate how you are doing mentally.',
      'es': '',
    },
    'm22c7fek': {
      'en': 'Rate how you are doing spiritually.',
      'es': '',
    },
    '2ox1u39p': {
      'en': 'Prayer',
      'es': '',
    },
    '0s0x6mpi': {
      'en': 'How can we pray for you?',
      'es': '',
    },
    'z9p0pah9': {
      'en': 'Submit your prayer for public',
      'es': '',
    },
    'fli55c9v': {
      'en': 'Submit Prayer',
      'es': '',
    },
    'lo78i6ep': {
      'en': 'Delete Prayer',
      'es': '',
    },
  },
  // NewPrayerBottomSheet
  {
    'yanii5r1': {
      'en': 'Rate how you are doing physically today.',
      'es': '',
    },
    'zyshj2on': {
      'en': 'Rate how you are doing mentally.',
      'es': '',
    },
    'm7pp93kv': {
      'en': 'Rate how you are doing spiritually.',
      'es': '',
    },
    'i1guagba': {
      'en': 'Prayer',
      'es': '',
    },
    '4gvn1aje': {
      'en': 'How can we pray for you?',
      'es': '',
    },
    'djlt2o0b': {
      'en': '[Enter Prayer...]',
      'es': '',
    },
    'ap2rsvmb': {
      'en': 'Submit your prayer for public',
      'es': '',
    },
    'uxnkto16': {
      'en': 'Submit Prayer',
      'es': '',
    },
    'o0ah2uth': {
      'en': 'Close',
      'es': '',
    },
  },
  // modalHome
  {
    'ql1wl21b': {
      'en': 'Today, I need help with... (Pick One)',
      'es': '',
    },
    'heevecc5': {
      'en': 'Studying the Bible',
      'es': '',
    },
    'kbwyt47t': {
      'en': 'Praying',
      'es': '',
    },
    'iw1nmhky': {
      'en': 'Forgiveness',
      'es': '',
    },
    'blg2bcgj': {
      'en': 'Joy',
      'es': '',
    },
    'dus1hby1': {
      'en': 'Patience',
      'es': '',
    },
    'pqz8d11d': {
      'en': 'Gratitude',
      'es': '',
    },
    'c84j1bcd': {
      'en': 'Compassion',
      'es': '',
    },
    's16n50s1': {
      'en': 'Submit',
      'es': '',
    },
  },
  // HelpSheet
  {
    'f8i53ees': {
      'en': 'Help me grow...\n(Pick One)',
      'es': '',
    },
    '3qgitfqt': {
      'en': 'Studying the Bible',
      'es': '',
    },
    'esm3pcbl': {
      'en': 'Praying',
      'es': '',
    },
    '8zi177o6': {
      'en': 'Forgiveness',
      'es': '',
    },
    'fnifpx6g': {
      'en': 'Joy',
      'es': '',
    },
    'hsxerr9e': {
      'en': 'Patience',
      'es': '',
    },
    'a41uw3m2': {
      'en': 'Gratitude',
      'es': '',
    },
    '3n0qkb5e': {
      'en': 'Compassion',
      'es': '',
    },
    'w0smw7iq': {
      'en': 'Submit',
      'es': '',
    },
    'ltydup9q': {
      'en': 'Close',
      'es': '',
    },
  },
  // BroadcastName
  {
    '5oeo1o1p': {
      'en': 'Video Name',
      'es': '',
    },
    'a8euyxee': {
      'en': '[Enter broadcast name...]',
      'es': '',
    },
    'w1e16pwu': {
      'en': 'Save Name',
      'es': '',
    },
  },
  // Miscellaneous
  {
    '08kyxfpy': {
      'en':
          'In order to provide analytics, this app requests access to your current location.',
      'es':
          'Para proporcionar análisis, esta aplicación solicita acceso a su ubicación actual.',
    },
    '2ww2ke0x': {
      'en': '',
      'es': '',
    },
    '9ctdaspn': {
      'en': '',
      'es': '',
    },
    'uqfko1yf': {
      'en': '',
      'es': '',
    },
    'k0f0q440': {
      'en': '',
      'es': '',
    },
    'isgr0m3h': {
      'en': '',
      'es': '',
    },
    'sypom8jz': {
      'en': '',
      'es': '',
    },
    'ki2ldjrc': {
      'en': '',
      'es': '',
    },
    'vxvypg3z': {
      'en': '',
      'es': '',
    },
    '33ltzeiv': {
      'en': '',
      'es': '',
    },
    'wh69s7o5': {
      'en': '',
      'es': '',
    },
    'ytgn0xfh': {
      'en': '',
      'es': '',
    },
    'tw2ilaxw': {
      'en': '',
      'es': '',
    },
    'xfazdxq3': {
      'en': '',
      'es': '',
    },
    'vah0wqw0': {
      'en': '',
      'es': '',
    },
    '3ojb8ung': {
      'en': '',
      'es': '',
    },
    'pfksnsee': {
      'en': '',
      'es': '',
    },
    '5snkunp7': {
      'en': '',
      'es': '',
    },
    'uc5h9n99': {
      'en': '',
      'es': '',
    },
    '02xcaejq': {
      'en': '',
      'es': '',
    },
    'ii413vgj': {
      'en': '',
      'es': '',
    },
    'qu1z4eve': {
      'en': '',
      'es': '',
    },
    'v46gy324': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
