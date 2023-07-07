import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_posted_by" field.
  DocumentReference? _commentPostedBy;
  DocumentReference? get commentPostedBy => _commentPostedBy;
  bool hasCommentPostedBy() => _commentPostedBy != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "comment_posted_time" field.
  DateTime? _commentPostedTime;
  DateTime? get commentPostedTime => _commentPostedTime;
  bool hasCommentPostedTime() => _commentPostedTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentPostedBy = snapshotData['comment_posted_by'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _commentPostedTime = snapshotData['comment_posted_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('comments').doc();

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? commentPostedBy,
  String? comment,
  DateTime? commentPostedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_posted_by': commentPostedBy,
      'comment': comment,
      'comment_posted_time': commentPostedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.commentPostedBy == e2?.commentPostedBy &&
        e1?.comment == e2?.comment &&
        e1?.commentPostedTime == e2?.commentPostedTime;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality()
      .hash([e?.commentPostedBy, e?.comment, e?.commentPostedTime]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
