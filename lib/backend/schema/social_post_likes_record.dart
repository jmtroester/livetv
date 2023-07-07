import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialPostLikesRecord extends FirestoreRecord {
  SocialPostLikesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  void _initializeFields() {
    _postRef = snapshotData['post_ref'] as DocumentReference?;
    _likedBy = getDataList(snapshotData['liked_by']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('social_post_likes');

  static Stream<SocialPostLikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SocialPostLikesRecord.fromSnapshot(s));

  static Future<SocialPostLikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SocialPostLikesRecord.fromSnapshot(s));

  static SocialPostLikesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialPostLikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialPostLikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialPostLikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialPostLikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialPostLikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialPostLikesRecordData({
  DocumentReference? postRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_ref': postRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialPostLikesRecordDocumentEquality
    implements Equality<SocialPostLikesRecord> {
  const SocialPostLikesRecordDocumentEquality();

  @override
  bool equals(SocialPostLikesRecord? e1, SocialPostLikesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postRef == e2?.postRef &&
        listEquality.equals(e1?.likedBy, e2?.likedBy);
  }

  @override
  int hash(SocialPostLikesRecord? e) =>
      const ListEquality().hash([e?.postRef, e?.likedBy]);

  @override
  bool isValidKey(Object? o) => o is SocialPostLikesRecord;
}
