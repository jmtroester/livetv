import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FrontVideosRecord extends FirestoreRecord {
  FrontVideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video_name" field.
  String? _videoName;
  String get videoName => _videoName ?? '';
  bool hasVideoName() => _videoName != null;

  // "video_id" field.
  int? _videoId;
  int get videoId => _videoId ?? 0;
  bool hasVideoId() => _videoId != null;

  // "video_link" field.
  String? _videoLink;
  String get videoLink => _videoLink ?? '';
  bool hasVideoLink() => _videoLink != null;

  // "video_thumbnail" field.
  String? _videoThumbnail;
  String get videoThumbnail => _videoThumbnail ?? '';
  bool hasVideoThumbnail() => _videoThumbnail != null;

  // "video_length" field.
  String? _videoLength;
  String get videoLength => _videoLength ?? '';
  bool hasVideoLength() => _videoLength != null;

  // "url_string" field.
  String? _urlString;
  String get urlString => _urlString ?? '';
  bool hasUrlString() => _urlString != null;

  // "featured" field.
  bool? _featured;
  bool get featured => _featured ?? false;
  bool hasFeatured() => _featured != null;

  void _initializeFields() {
    _videoName = snapshotData['video_name'] as String?;
    _videoId = castToType<int>(snapshotData['video_id']);
    _videoLink = snapshotData['video_link'] as String?;
    _videoThumbnail = snapshotData['video_thumbnail'] as String?;
    _videoLength = snapshotData['video_length'] as String?;
    _urlString = snapshotData['url_string'] as String?;
    _featured = snapshotData['featured'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('front_videos');

  static Stream<FrontVideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FrontVideosRecord.fromSnapshot(s));

  static Future<FrontVideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FrontVideosRecord.fromSnapshot(s));

  static FrontVideosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FrontVideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FrontVideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FrontVideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FrontVideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FrontVideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFrontVideosRecordData({
  String? videoName,
  int? videoId,
  String? videoLink,
  String? videoThumbnail,
  String? videoLength,
  String? urlString,
  bool? featured,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_name': videoName,
      'video_id': videoId,
      'video_link': videoLink,
      'video_thumbnail': videoThumbnail,
      'video_length': videoLength,
      'url_string': urlString,
      'featured': featured,
    }.withoutNulls,
  );

  return firestoreData;
}

class FrontVideosRecordDocumentEquality implements Equality<FrontVideosRecord> {
  const FrontVideosRecordDocumentEquality();

  @override
  bool equals(FrontVideosRecord? e1, FrontVideosRecord? e2) {
    return e1?.videoName == e2?.videoName &&
        e1?.videoId == e2?.videoId &&
        e1?.videoLink == e2?.videoLink &&
        e1?.videoThumbnail == e2?.videoThumbnail &&
        e1?.videoLength == e2?.videoLength &&
        e1?.urlString == e2?.urlString &&
        e1?.featured == e2?.featured;
  }

  @override
  int hash(FrontVideosRecord? e) => const ListEquality().hash([
        e?.videoName,
        e?.videoId,
        e?.videoLink,
        e?.videoThumbnail,
        e?.videoLength,
        e?.urlString,
        e?.featured
      ]);

  @override
  bool isValidKey(Object? o) => o is FrontVideosRecord;
}
