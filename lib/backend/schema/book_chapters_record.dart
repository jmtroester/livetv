import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'book_chapters_record.g.dart';

abstract class BookChaptersRecord
    implements Built<BookChaptersRecord, BookChaptersRecordBuilder> {
  static Serializer<BookChaptersRecord> get serializer =>
      _$bookChaptersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'chapter_no')
  String get chapterNo;

  @nullable
  @BuiltValueField(wireName: 'book_name')
  DocumentReference get bookName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BookChaptersRecordBuilder builder) =>
      builder..chapterNo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('book_chapters');

  static Stream<BookChaptersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BookChaptersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BookChaptersRecord._();
  factory BookChaptersRecord(
          [void Function(BookChaptersRecordBuilder) updates]) =
      _$BookChaptersRecord;

  static BookChaptersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBookChaptersRecordData({
  String chapterNo,
  DocumentReference bookName,
}) =>
    serializers.toFirestore(
        BookChaptersRecord.serializer,
        BookChaptersRecord((b) => b
          ..chapterNo = chapterNo
          ..bookName = bookName));
