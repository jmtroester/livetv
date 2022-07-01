// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_books_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BibleBooksRecord> _$bibleBooksRecordSerializer =
    new _$BibleBooksRecordSerializer();

class _$BibleBooksRecordSerializer
    implements StructuredSerializer<BibleBooksRecord> {
  @override
  final Iterable<Type> types = const [BibleBooksRecord, _$BibleBooksRecord];
  @override
  final String wireName = 'BibleBooksRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BibleBooksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.bookName;
    if (value != null) {
      result
        ..add('book_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chapterNo;
    if (value != null) {
      result
        ..add('chapter_no')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.verseNo;
    if (value != null) {
      result
        ..add('verse_no')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
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
  BibleBooksRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BibleBooksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'book_name':
          result.bookName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'chapter_no':
          result.chapterNo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'verse_no':
          result.verseNo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
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

class _$BibleBooksRecord extends BibleBooksRecord {
  @override
  final String bookName;
  @override
  final BuiltList<int> chapterNo;
  @override
  final BuiltList<int> verseNo;
  @override
  final DocumentReference<Object> reference;

  factory _$BibleBooksRecord(
          [void Function(BibleBooksRecordBuilder) updates]) =>
      (new BibleBooksRecordBuilder()..update(updates)).build();

  _$BibleBooksRecord._(
      {this.bookName, this.chapterNo, this.verseNo, this.reference})
      : super._();

  @override
  BibleBooksRecord rebuild(void Function(BibleBooksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BibleBooksRecordBuilder toBuilder() =>
      new BibleBooksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BibleBooksRecord &&
        bookName == other.bookName &&
        chapterNo == other.chapterNo &&
        verseNo == other.verseNo &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, bookName.hashCode), chapterNo.hashCode),
            verseNo.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BibleBooksRecord')
          ..add('bookName', bookName)
          ..add('chapterNo', chapterNo)
          ..add('verseNo', verseNo)
          ..add('reference', reference))
        .toString();
  }
}

class BibleBooksRecordBuilder
    implements Builder<BibleBooksRecord, BibleBooksRecordBuilder> {
  _$BibleBooksRecord _$v;

  String _bookName;
  String get bookName => _$this._bookName;
  set bookName(String bookName) => _$this._bookName = bookName;

  ListBuilder<int> _chapterNo;
  ListBuilder<int> get chapterNo =>
      _$this._chapterNo ??= new ListBuilder<int>();
  set chapterNo(ListBuilder<int> chapterNo) => _$this._chapterNo = chapterNo;

  ListBuilder<int> _verseNo;
  ListBuilder<int> get verseNo => _$this._verseNo ??= new ListBuilder<int>();
  set verseNo(ListBuilder<int> verseNo) => _$this._verseNo = verseNo;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BibleBooksRecordBuilder() {
    BibleBooksRecord._initializeBuilder(this);
  }

  BibleBooksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bookName = $v.bookName;
      _chapterNo = $v.chapterNo?.toBuilder();
      _verseNo = $v.verseNo?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BibleBooksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BibleBooksRecord;
  }

  @override
  void update(void Function(BibleBooksRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BibleBooksRecord build() {
    _$BibleBooksRecord _$result;
    try {
      _$result = _$v ??
          new _$BibleBooksRecord._(
              bookName: bookName,
              chapterNo: _chapterNo?.build(),
              verseNo: _verseNo?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'chapterNo';
        _chapterNo?.build();
        _$failedField = 'verseNo';
        _verseNo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BibleBooksRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
