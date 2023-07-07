import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialPostsRecord extends FirestoreRecord {
  SocialPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "posted_by" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  bool hasPostedBy() => _postedBy != null;

  // "posted_time" field.
  DateTime? _postedTime;
  DateTime? get postedTime => _postedTime;
  bool hasPostedTime() => _postedTime != null;

  // "video_link" field.
  String? _videoLink;
  String get videoLink => _videoLink ?? '';
  bool hasVideoLink() => _videoLink != null;

  // "video_name" field.
  String? _videoName;
  String get videoName => _videoName ?? '';
  bool hasVideoName() => _videoName != null;

  // "is_video_post" field.
  bool? _isVideoPost;
  bool get isVideoPost => _isVideoPost ?? false;
  bool hasIsVideoPost() => _isVideoPost != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _likes = getDataList(snapshotData['likes']);
    _photo = snapshotData['photo'] as String?;
    _postedBy = snapshotData['posted_by'] as DocumentReference?;
    _postedTime = snapshotData['posted_time'] as DateTime?;
    _videoLink = snapshotData['video_link'] as String?;
    _videoName = snapshotData['video_name'] as String?;
    _isVideoPost = snapshotData['is_video_post'] as bool?;
    _likedBy = getDataList(snapshotData['liked_by']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('social_posts');

  static Stream<SocialPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SocialPostsRecord.fromSnapshot(s));

  static Future<SocialPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SocialPostsRecord.fromSnapshot(s));

  static SocialPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialPostsRecordData({
  String? content,
  String? photo,
  DocumentReference? postedBy,
  DateTime? postedTime,
  String? videoLink,
  String? videoName,
  bool? isVideoPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'photo': photo,
      'posted_by': postedBy,
      'posted_time': postedTime,
      'video_link': videoLink,
      'video_name': videoName,
      'is_video_post': isVideoPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialPostsRecordDocumentEquality implements Equality<SocialPostsRecord> {
  const SocialPostsRecordDocumentEquality();

  @override
  bool equals(SocialPostsRecord? e1, SocialPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.content == e2?.content &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.photo == e2?.photo &&
        e1?.postedBy == e2?.postedBy &&
        e1?.postedTime == e2?.postedTime &&
        e1?.videoLink == e2?.videoLink &&
        e1?.videoName == e2?.videoName &&
        e1?.isVideoPost == e2?.isVideoPost &&
        listEquality.equals(e1?.likedBy, e2?.likedBy);
  }

  @override
  int hash(SocialPostsRecord? e) => const ListEquality().hash([
        e?.content,
        e?.likes,
        e?.photo,
        e?.postedBy,
        e?.postedTime,
        e?.videoLink,
        e?.videoName,
        e?.isVideoPost,
        e?.likedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is SocialPostsRecord;
}
