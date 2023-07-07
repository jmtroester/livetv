import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SermonHubBackupRecord extends FirestoreRecord {
  SermonHubBackupRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video_id" field.
  int? _videoId;
  int get videoId => _videoId ?? 0;
  bool hasVideoId() => _videoId != null;

  // "video_link" field.
  String? _videoLink;
  String get videoLink => _videoLink ?? '';
  bool hasVideoLink() => _videoLink != null;

  // "sermon_name" field.
  String? _sermonName;
  String get sermonName => _sermonName ?? '';
  bool hasSermonName() => _sermonName != null;

  // "sermon_thumbnail" field.
  String? _sermonThumbnail;
  String get sermonThumbnail => _sermonThumbnail ?? '';
  bool hasSermonThumbnail() => _sermonThumbnail != null;

  // "audio_link" field.
  String? _audioLink;
  String get audioLink => _audioLink ?? '';
  bool hasAudioLink() => _audioLink != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "audio_id" field.
  int? _audioId;
  int get audioId => _audioId ?? 0;
  bool hasAudioId() => _audioId != null;

  // "url_string" field.
  String? _urlString;
  String get urlString => _urlString ?? '';
  bool hasUrlString() => _urlString != null;

  // "featured" field.
  bool? _featured;
  bool get featured => _featured ?? false;
  bool hasFeatured() => _featured != null;

  // "date_presented" field.
  DateTime? _datePresented;
  DateTime? get datePresented => _datePresented;
  bool hasDatePresented() => _datePresented != null;

  // "full_sermon" field.
  bool? _fullSermon;
  bool get fullSermon => _fullSermon ?? false;
  bool hasFullSermon() => _fullSermon != null;

  // "book" field.
  DocumentReference? _book;
  DocumentReference? get book => _book;
  bool hasBook() => _book != null;

  // "sermon_series" field.
  DocumentReference? _sermonSeries;
  DocumentReference? get sermonSeries => _sermonSeries;
  bool hasSermonSeries() => _sermonSeries != null;

  // "sermon_topic" field.
  List<DocumentReference>? _sermonTopic;
  List<DocumentReference> get sermonTopic => _sermonTopic ?? const [];
  bool hasSermonTopic() => _sermonTopic != null;

  void _initializeFields() {
    _videoId = castToType<int>(snapshotData['video_id']);
    _videoLink = snapshotData['video_link'] as String?;
    _sermonName = snapshotData['sermon_name'] as String?;
    _sermonThumbnail = snapshotData['sermon_thumbnail'] as String?;
    _audioLink = snapshotData['audio_link'] as String?;
    _text = snapshotData['text'] as String?;
    _audioId = castToType<int>(snapshotData['audio_id']);
    _urlString = snapshotData['url_string'] as String?;
    _featured = snapshotData['featured'] as bool?;
    _datePresented = snapshotData['date_presented'] as DateTime?;
    _fullSermon = snapshotData['full_sermon'] as bool?;
    _book = snapshotData['book'] as DocumentReference?;
    _sermonSeries = snapshotData['sermon_series'] as DocumentReference?;
    _sermonTopic = getDataList(snapshotData['sermon_topic']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sermon_hub_backup');

  static Stream<SermonHubBackupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SermonHubBackupRecord.fromSnapshot(s));

  static Future<SermonHubBackupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SermonHubBackupRecord.fromSnapshot(s));

  static SermonHubBackupRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SermonHubBackupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SermonHubBackupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SermonHubBackupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SermonHubBackupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SermonHubBackupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSermonHubBackupRecordData({
  int? videoId,
  String? videoLink,
  String? sermonName,
  String? sermonThumbnail,
  String? audioLink,
  String? text,
  int? audioId,
  String? urlString,
  bool? featured,
  DateTime? datePresented,
  bool? fullSermon,
  DocumentReference? book,
  DocumentReference? sermonSeries,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_id': videoId,
      'video_link': videoLink,
      'sermon_name': sermonName,
      'sermon_thumbnail': sermonThumbnail,
      'audio_link': audioLink,
      'text': text,
      'audio_id': audioId,
      'url_string': urlString,
      'featured': featured,
      'date_presented': datePresented,
      'full_sermon': fullSermon,
      'book': book,
      'sermon_series': sermonSeries,
    }.withoutNulls,
  );

  return firestoreData;
}

class SermonHubBackupRecordDocumentEquality
    implements Equality<SermonHubBackupRecord> {
  const SermonHubBackupRecordDocumentEquality();

  @override
  bool equals(SermonHubBackupRecord? e1, SermonHubBackupRecord? e2) {
    const listEquality = ListEquality();
    return e1?.videoId == e2?.videoId &&
        e1?.videoLink == e2?.videoLink &&
        e1?.sermonName == e2?.sermonName &&
        e1?.sermonThumbnail == e2?.sermonThumbnail &&
        e1?.audioLink == e2?.audioLink &&
        e1?.text == e2?.text &&
        e1?.audioId == e2?.audioId &&
        e1?.urlString == e2?.urlString &&
        e1?.featured == e2?.featured &&
        e1?.datePresented == e2?.datePresented &&
        e1?.fullSermon == e2?.fullSermon &&
        e1?.book == e2?.book &&
        e1?.sermonSeries == e2?.sermonSeries &&
        listEquality.equals(e1?.sermonTopic, e2?.sermonTopic);
  }

  @override
  int hash(SermonHubBackupRecord? e) => const ListEquality().hash([
        e?.videoId,
        e?.videoLink,
        e?.sermonName,
        e?.sermonThumbnail,
        e?.audioLink,
        e?.text,
        e?.audioId,
        e?.urlString,
        e?.featured,
        e?.datePresented,
        e?.fullSermon,
        e?.book,
        e?.sermonSeries,
        e?.sermonTopic
      ]);

  @override
  bool isValidKey(Object? o) => o is SermonHubBackupRecord;
}
