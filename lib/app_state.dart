import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _date = '';
  String get date => _date;
  set date(String _value) {
    _date = _value;
  }

  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  set timeStamp(DateTime? _value) {
    _timeStamp = _value;
  }

  String _photo = '';
  String get photo => _photo;
  set photo(String _value) {
    _photo = _value;
  }

  List<DocumentReference> _pushNotificationUsers = [];
  List<DocumentReference> get pushNotificationUsers => _pushNotificationUsers;
  set pushNotificationUsers(List<DocumentReference> _value) {
    _pushNotificationUsers = _value;
  }

  void addToPushNotificationUsers(DocumentReference _value) {
    _pushNotificationUsers.add(_value);
  }

  void removeFromPushNotificationUsers(DocumentReference _value) {
    _pushNotificationUsers.remove(_value);
  }

  void removeAtIndexFromPushNotificationUsers(int _index) {
    _pushNotificationUsers.removeAt(_index);
  }

  void updatePushNotificationUsersAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _pushNotificationUsers[_index] = updateFn(_pushNotificationUsers[_index]);
  }

  bool _journalUpdate = false;
  bool get journalUpdate => _journalUpdate;
  set journalUpdate(bool _value) {
    _journalUpdate = _value;
  }

  bool _isEdit = false;
  bool get isEdit => _isEdit;
  set isEdit(bool _value) {
    _isEdit = _value;
  }

  int _totalFullSermons = 0;
  int get totalFullSermons => _totalFullSermons;
  set totalFullSermons(int _value) {
    _totalFullSermons = _value;
  }

  int _totalMiniSermons = 0;
  int get totalMiniSermons => _totalMiniSermons;
  set totalMiniSermons(int _value) {
    _totalMiniSermons = _value;
  }

  int _totalAudioSermons = 0;
  int get totalAudioSermons => _totalAudioSermons;
  set totalAudioSermons(int _value) {
    _totalAudioSermons = _value;
  }

  int _totalPodcasts = 0;
  int get totalPodcasts => _totalPodcasts;
  set totalPodcasts(int _value) {
    _totalPodcasts = _value;
  }

  bool _showCatechism = false;
  bool get showCatechism => _showCatechism;
  set showCatechism(bool _value) {
    _showCatechism = _value;
  }

  String _bibleVerseReference = '';
  String get bibleVerseReference => _bibleVerseReference;
  set bibleVerseReference(String _value) {
    _bibleVerseReference = _value;
  }

  String _bibleStudyBook = '';
  String get bibleStudyBook => _bibleStudyBook;
  set bibleStudyBook(String _value) {
    _bibleStudyBook = _value;
  }

  bool _showChapterField = false;
  bool get showChapterField => _showChapterField;
  set showChapterField(bool _value) {
    _showChapterField = _value;
  }

  bool _showVerseField = false;
  bool get showVerseField => _showVerseField;
  set showVerseField(bool _value) {
    _showVerseField = _value;
  }

  String _chapterID = '';
  String get chapterID => _chapterID;
  set chapterID(String _value) {
    _chapterID = _value;
  }

  String _bookID = '';
  String get bookID => _bookID;
  set bookID(String _value) {
    _bookID = _value;
  }

  int _bookIDInt = 0;
  int get bookIDInt => _bookIDInt;
  set bookIDInt(int _value) {
    _bookIDInt = _value;
  }

  int _chapterIDInt = 0;
  int get chapterIDInt => _chapterIDInt;
  set chapterIDInt(int _value) {
    _chapterIDInt = _value;
  }

  int _verseID = 0;
  int get verseID => _verseID;
  set verseID(int _value) {
    _verseID = _value;
  }

  String _verseIDString = '';
  String get verseIDString => _verseIDString;
  set verseIDString(String _value) {
    _verseIDString = _value;
  }

  String _verseRef = '';
  String get verseRef => _verseRef;
  set verseRef(String _value) {
    _verseRef = _value;
  }

  String _lexiconPrefix = '';
  String get lexiconPrefix => _lexiconPrefix;
  set lexiconPrefix(String _value) {
    _lexiconPrefix = _value;
  }

  String _verseText = '';
  String get verseText => _verseText;
  set verseText(String _value) {
    _verseText = _value;
  }

  int _bibleNotesID = 0;
  int get bibleNotesID => _bibleNotesID;
  set bibleNotesID(int _value) {
    _bibleNotesID = _value;
  }

  DocumentReference? _bibleStudyDoc;
  DocumentReference? get bibleStudyDoc => _bibleStudyDoc;
  set bibleStudyDoc(DocumentReference? _value) {
    _bibleStudyDoc = _value;
  }

  bool _showNext2 = false;
  bool get showNext2 => _showNext2;
  set showNext2(bool _value) {
    _showNext2 = _value;
  }

  bool _showNext3 = false;
  bool get showNext3 => _showNext3;
  set showNext3(bool _value) {
    _showNext3 = _value;
  }

  bool _showNext4 = false;
  bool get showNext4 => _showNext4;
  set showNext4(bool _value) {
    _showNext4 = _value;
  }

  bool _showNext5 = false;
  bool get showNext5 => _showNext5;
  set showNext5(bool _value) {
    _showNext5 = _value;
  }

  bool _showNext6 = false;
  bool get showNext6 => _showNext6;
  set showNext6(bool _value) {
    _showNext6 = _value;
  }

  bool _showNext7 = false;
  bool get showNext7 => _showNext7;
  set showNext7(bool _value) {
    _showNext7 = _value;
  }

  bool _showNext8 = false;
  bool get showNext8 => _showNext8;
  set showNext8(bool _value) {
    _showNext8 = _value;
  }

  bool _showVerse = false;
  bool get showVerse => _showVerse;
  set showVerse(bool _value) {
    _showVerse = _value;
  }

  bool _showPrevVerses = false;
  bool get showPrevVerses => _showPrevVerses;
  set showPrevVerses(bool _value) {
    _showPrevVerses = _value;
  }

  bool _bibleStudyNoteCreated = false;
  bool get bibleStudyNoteCreated => _bibleStudyNoteCreated;
  set bibleStudyNoteCreated(bool _value) {
    _bibleStudyNoteCreated = _value;
  }

  bool _showBookField = false;
  bool get showBookField => _showBookField;
  set showBookField(bool _value) {
    _showBookField = _value;
  }

  bool _hideBookField = false;
  bool get hideBookField => _hideBookField;
  set hideBookField(bool _value) {
    _hideBookField = _value;
  }

  bool _hideChapterField = false;
  bool get hideChapterField => _hideChapterField;
  set hideChapterField(bool _value) {
    _hideChapterField = _value;
  }

  bool _hideVerseField = false;
  bool get hideVerseField => _hideVerseField;
  set hideVerseField(bool _value) {
    _hideVerseField = _value;
  }

  bool _showResetButton = false;
  bool get showResetButton => _showResetButton;
  set showResetButton(bool _value) {
    _showResetButton = _value;
  }

  String _verseNo = '';
  String get verseNo => _verseNo;
  set verseNo(String _value) {
    _verseNo = _value;
  }

  bool _showAddToBibleNotes = false;
  bool get showAddToBibleNotes => _showAddToBibleNotes;
  set showAddToBibleNotes(bool _value) {
    _showAddToBibleNotes = _value;
  }

  bool _showImageButton = false;
  bool get showImageButton => _showImageButton;
  set showImageButton(bool _value) {
    _showImageButton = _value;
  }

  bool _fromPush = false;
  bool get fromPush => _fromPush;
  set fromPush(bool _value) {
    _fromPush = _value;
  }

  bool _searchIn = false;
  bool get searchIn => _searchIn;
  set searchIn(bool _value) {
    _searchIn = _value;
  }

  bool _showHowYouAreFeeling = false;
  bool get showHowYouAreFeeling => _showHowYouAreFeeling;
  set showHowYouAreFeeling(bool _value) {
    _showHowYouAreFeeling = _value;
  }

  bool _showStudyingTheBible = false;
  bool get showStudyingTheBible => _showStudyingTheBible;
  set showStudyingTheBible(bool _value) {
    _showStudyingTheBible = _value;
  }

  bool _showPraying = false;
  bool get showPraying => _showPraying;
  set showPraying(bool _value) {
    _showPraying = _value;
  }

  bool _showForgiveness = false;
  bool get showForgiveness => _showForgiveness;
  set showForgiveness(bool _value) {
    _showForgiveness = _value;
  }

  bool _showJoy = false;
  bool get showJoy => _showJoy;
  set showJoy(bool _value) {
    _showJoy = _value;
  }

  bool _showPatience = false;
  bool get showPatience => _showPatience;
  set showPatience(bool _value) {
    _showPatience = _value;
  }

  bool _showGratitude = false;
  bool get showGratitude => _showGratitude;
  set showGratitude(bool _value) {
    _showGratitude = _value;
  }

  bool _showCompassion = false;
  bool get showCompassion => _showCompassion;
  set showCompassion(bool _value) {
    _showCompassion = _value;
  }

  bool _showINeedHelp = false;
  bool get showINeedHelp => _showINeedHelp;
  set showINeedHelp(bool _value) {
    _showINeedHelp = _value;
  }

  bool _prayIcon = false;
  bool get prayIcon => _prayIcon;
  set prayIcon(bool _value) {
    _prayIcon = _value;
  }

  bool _likeIcon = false;
  bool get likeIcon => _likeIcon;
  set likeIcon(bool _value) {
    _likeIcon = _value;
  }

  bool _allSermons = false;
  bool get allSermons => _allSermons;
  set allSermons(bool _value) {
    _allSermons = _value;
  }

  bool _filterBySeries = false;
  bool get filterBySeries => _filterBySeries;
  set filterBySeries(bool _value) {
    _filterBySeries = _value;
  }

  bool _filterByTopic = false;
  bool get filterByTopic => _filterByTopic;
  set filterByTopic(bool _value) {
    _filterByTopic = _value;
  }

  bool _filterByBook = false;
  bool get filterByBook => _filterByBook;
  set filterByBook(bool _value) {
    _filterByBook = _value;
  }

  DocumentReference? _churchSelection;
  DocumentReference? get churchSelection => _churchSelection;
  set churchSelection(DocumentReference? _value) {
    _churchSelection = _value;
  }

  bool _blur = false;
  bool get blur => _blur;
  set blur(bool _value) {
    _blur = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
