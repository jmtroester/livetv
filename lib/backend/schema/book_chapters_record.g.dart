// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapters_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookChaptersRecord> _$bookChaptersRecordSerializer =
    new _$BookChaptersRecordSerializer();

class _$BookChaptersRecordSerializer
    implements StructuredSerializer<BookChaptersRecord> {
  @override
  final Iterable<Type> types = const [BookChaptersRecord, _$BookChaptersRecord];
  @override
  final String wireName = 'BookChaptersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BookChaptersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.chapterNo;
    if (value != null) {
      result
        ..add('chapter_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookName;
    if (value != null) {
      result
        ..add('book_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  BookChaptersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookChaptersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'chapter_no':
          result.chapterNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'book_name':
          result.bookName = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$BookChaptersRecord extends BookChaptersRecord {
  @override
  final String chapterNo;
  @override
  final DocumentReference<Object> bookName;
  @override
  final DocumentReference<Object> reference;

  factory _$BookChaptersRecord(
          [void Function(BookChaptersRecordBuilder) updates]) =>
      (new BookChaptersRecordBuilder()..update(updates)).build();

  _$BookChaptersRecord._({this.chapterNo, this.bookName, this.reference})
      : super._();

  @override
  BookChaptersRecord rebuild(
          void Function(BookChaptersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookChaptersRecordBuilder toBuilder() =>
      new BookChaptersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookChaptersRecord &&
        chapterNo == other.chapterNo &&
        bookName == other.bookName &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, chapterNo.hashCode), bookName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BookChaptersRecord')
          ..add('chapterNo', chapterNo)
          ..add('bookName', bookName)
          ..add('reference', reference))
        .toString();
  }
}

class BookChaptersRecordBuilder
    implements Builder<BookChaptersRecord, BookChaptersRecordBuilder> {
  _$BookChaptersRecord _$v;

  String _chapterNo;
  String get chapterNo => _$this._chapterNo;
  set chapterNo(String chapterNo) => _$this._chapterNo = chapterNo;

  DocumentReference<Object> _bookName;
  DocumentReference<Object> get bookName => _$this._bookName;
  set bookName(DocumentReference<Object> bookName) =>
      _$this._bookName = bookName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BookChaptersRecordBuilder() {
    BookChaptersRecord._initializeBuilder(this);
  }

  BookChaptersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chapterNo = $v.chapterNo;
      _bookName = $v.bookName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookChaptersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookChaptersRecord;
  }

  @override
  void update(void Function(BookChaptersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BookChaptersRecord build() {
    final _$result = _$v ??
        new _$BookChaptersRecord._(
            chapterNo: chapterNo, bookName: bookName, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
