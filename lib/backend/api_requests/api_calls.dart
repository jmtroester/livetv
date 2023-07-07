import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetBibleVerseCall {
  static Future<ApiCallResponse> call({
    String? q = '',
    bool? includeShortCopyright,
    bool? includePassageReferences,
    bool? includeVerseNumbers,
    bool? includeFirstVerseNumbers,
    bool? includeFootnotes,
    bool? includeFootnoteBody,
    bool? includeHeadings,
    bool? includeSelahs,
    bool? indentPoetry,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Verse',
      apiUrl: 'https://api.esv.org/v3/passage/text/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token d0f3c06eb7a47ec198359c3429a0f288fff342a7',
      },
      params: {
        'q': q,
        'include-short-copyright': includeShortCopyright,
        'include-passage-references': includePassageReferences,
        'include-verse-numbers': includeVerseNumbers,
        'include-first-verse-numbers': includeFirstVerseNumbers,
        'include-footnotes': includeFootnotes,
        'include-footnote-body': includeFootnoteBody,
        'include-headings': includeHeadings,
        'include-selahs': includeSelahs,
        'indent-poetry': indentPoetry,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic passage(dynamic response) => getJsonField(
        response,
        r'''$.passages''',
      );
  static dynamic verseReference(dynamic response) => getJsonField(
        response,
        r'''$.query''',
      );
  static dynamic prevChapter(dynamic response) => getJsonField(
        response,
        r'''$.passage_meta[:].prev_chapter''',
        true,
      );
  static dynamic nextChapter(dynamic response) => getJsonField(
        response,
        r'''$.passage_meta[:].next_chapter''',
        true,
      );
  static dynamic prevVerse(dynamic response) => getJsonField(
        response,
        r'''$.passage_meta[:].next_verse''',
      );
  static dynamic nextVerse(dynamic response) => getJsonField(
        response,
        r'''$.passage_meta[:].next_verse''',
      );
  static dynamic parsed(dynamic response) => getJsonField(
        response,
        r'''$.parsed''',
      );
}

class GetBibleBooksCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Books',
      apiUrl:
          'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/books',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'a2e97cb3ad20b17701d8bc592679248d',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic books(dynamic response) => getJsonField(
        response,
        r'''$.data[:].bibleId''',
      );
  static dynamic bookId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  static dynamic bookName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
}

class GetBibleChaptersCall {
  static Future<ApiCallResponse> call({
    String? bookId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Chapters',
      apiUrl:
          'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/books/${bookId}/chapters',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'a2e97cb3ad20b17701d8bc592679248d',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic chapterNo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  static dynamic chapterReference(dynamic response) => getJsonField(
        response,
        r'''$.data[:].reference''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
}

class GetBibleVerseNumbersCall {
  static Future<ApiCallResponse> call({
    String? chapterId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Verse Numbers',
      apiUrl:
          'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/chapters/${chapterId}/verses',
      callType: ApiCallType.GET,
      headers: {
        'api-key': 'a2e97cb3ad20b17701d8bc592679248d',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic verseId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].reference''',
      );
  static dynamic verseReference(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
}

class FullSermonsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Full Sermons',
      apiUrl: 'https://api.flotiq.com/api/v1/content/livetv_app',
      callType: ApiCallType.GET,
      headers: {
        'X-AUTH-TOKEN': '8a014de7689639834d2fe0b256433523',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic videoID(dynamic response) => getJsonField(
        response,
        r'''$.data[:].sermon_thumbnail[:].dataUrl''',
      );
  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.data[:].text''',
      );
  static dynamic audioLink(dynamic response) => getJsonField(
        response,
        r'''$.data[:].audio_link''',
      );
  static dynamic videoLink(dynamic response) => getJsonField(
        response,
        r'''$.data[:].video_link''',
      );
  static dynamic sermonName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].sermon_name''',
      );
  static dynamic sermonThumbnail(dynamic response) => getJsonField(
        response,
        r'''$.data[:].sermon_thumbnail[:].dataUrl''',
      );
}

class GetBibleBooksKJVCall {
  static Future<ApiCallResponse> call({
    String? language = 'english',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Books KJV',
      apiUrl: 'https://iq-bible.p.rapidapi.com/GetBooks',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host': 'iq-bible.p.rapidapi.com',
        'X-RapidAPI-Key': '8d4da359famsh7a9617fa94049ecp1bce7bjsne9238b166955',
      },
      params: {
        'language': language,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic bookID(dynamic response) => getJsonField(
        response,
        r'''$[:].b''',
      );
  static dynamic bookName(dynamic response) => getJsonField(
        response,
        r'''$[:].n''',
      );
}

class GetBibleChaptersKJVCall {
  static Future<ApiCallResponse> call({
    int? bookId,
    int? chapterId,
    String? versionId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Chapters KJV',
      apiUrl: 'https://iq-bible.p.rapidapi.com/GetChapter',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host': 'iq-bible.p.rapidapi.com',
        'X-RapidAPI-Key': '8d4da359famsh7a9617fa94049ecp1bce7bjsne9238b166955',
      },
      params: {
        'bookId': bookId,
        'chapterId': chapterId,
        'versionId': versionId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic verseId(dynamic response) => getJsonField(
        response,
        r'''$..id''',
      );
  static dynamic bookNo(dynamic response) => getJsonField(
        response,
        r'''$..b''',
      );
  static dynamic chapterNo(dynamic response) => getJsonField(
        response,
        r'''$..c''',
      );
  static dynamic verseNo(dynamic response) => getJsonField(
        response,
        r'''$..v''',
      );
  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$..t''',
      );
}

class GetNumberOfChaptersKJVCall {
  static Future<ApiCallResponse> call({
    String? bookId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Number of Chapters KJV',
      apiUrl: 'https://iq-bible.p.rapidapi.com/GetChapterCount',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host': 'iq-bible.p.rapidapi.com',
        'X-RapidAPI-Key': '8d4da359famsh7a9617fa94049ecp1bce7bjsne9238b166955',
      },
      params: {
        'bookId': bookId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic chapterCount(dynamic response) => getJsonField(
        response,
        r'''$.chapterCount''',
      );
}

class GetBibleVerseKJVCall {
  static Future<ApiCallResponse> call({
    String? verseId = '',
    String? versionId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Verse KJV',
      apiUrl: 'https://iq-bible.p.rapidapi.com/GetVerse',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host': 'iq-bible.p.rapidapi.com',
        'X-RapidAPI-Key': '8d4da359famsh7a9617fa94049ecp1bce7bjsne9238b166955',
      },
      params: {
        'verseId': verseId,
        'versionId': versionId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic verseID(dynamic response) => getJsonField(
        response,
        r'''$..id''',
      );
  static dynamic bookNo(dynamic response) => getJsonField(
        response,
        r'''$..b''',
      );
  static dynamic chapterNo(dynamic response) => getJsonField(
        response,
        r'''$..c''',
      );
  static dynamic verseNo(dynamic response) => getJsonField(
        response,
        r'''$..v''',
      );
  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$..t''',
      );
}

class GetVerseWordsKJVCall {
  static Future<ApiCallResponse> call({
    String? verseId = '',
    String? versionId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Verse Words KJV',
      apiUrl: 'https://iq-bible.p.rapidapi.com/GetWords',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host': 'iq-bible.p.rapidapi.com',
        'X-RapidAPI-Key': '8d4da359famsh7a9617fa94049ecp1bce7bjsne9238b166955',
      },
      params: {
        'verseId': verseId,
        'versionId': versionId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic wordCount(dynamic response) => getJsonField(
        response,
        r'''$.wordCount''',
      );
}

class GetOriginalTextKJVCall {
  static Future<ApiCallResponse> call({
    String? verseId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Original Text KJV',
      apiUrl: 'https://iq-bible.p.rapidapi.com/GetOriginalText',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host': 'iq-bible.p.rapidapi.com',
        'X-RapidAPI-Key': '8d4da359famsh7a9617fa94049ecp1bce7bjsne9238b166955',
      },
      params: {
        'verseId': verseId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic originalWord(dynamic response) => getJsonField(
        response,
        r'''$..word''',
      );
  static dynamic strongs(dynamic response) => getJsonField(
        response,
        r'''$..strongs''',
      );
  static dynamic originalOrder(dynamic response) => getJsonField(
        response,
        r'''$..orig_order''',
      );
}

class GetGreekReferenceInfomationKJVCall {
  static Future<ApiCallResponse> call({
    String? lexiconId = '',
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Greek Reference Infomation KJV',
      apiUrl: 'https://iq-bible.p.rapidapi.com/GetStrongs',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host': 'iq-bible.p.rapidapi.com',
        'X-RapidAPI-Key': '8d4da359famsh7a9617fa94049ecp1bce7bjsne9238b166955',
      },
      params: {
        'lexiconId': lexiconId,
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic word(dynamic response) => getJsonField(
        response,
        r'''$..part_of_speech''',
      );
  static dynamic glossary(dynamic response) => getJsonField(
        response,
        r'''$..glossary''',
      );
  static dynamic noOfOccurances(dynamic response) => getJsonField(
        response,
        r'''$..occurences''',
      );
  static dynamic rootWord(dynamic response) => getJsonField(
        response,
        r'''$..root''',
      );
  static dynamic partOfSpeech(dynamic response) => getJsonField(
        response,
        r'''$..part_of_speech''',
      );
}

class CrossReferencesKJVCall {
  static Future<ApiCallResponse> call({
    String? verseId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Cross References KJV',
      apiUrl: 'https://iq-bible.p.rapidapi.com/GetCrossReferences',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host': 'iq-bible.p.rapidapi.com',
        'X-RapidAPI-Key': '8d4da359famsh7a9617fa94049ecp1bce7bjsne9238b166955',
      },
      params: {
        'verseId': verseId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic startingVerse1(dynamic response) => getJsonField(
        response,
        r'''$[:].sv''',
        true,
      );
  static dynamic endingVerse1(dynamic response) => getJsonField(
        response,
        r'''$[:].ev''',
        true,
      );
  static dynamic startingVerseUse(dynamic response) => getJsonField(
        response,
        r'''$..sv''',
        true,
      );
  static dynamic endingVerseUse(dynamic response) => getJsonField(
        response,
        r'''$..ev''',
        true,
      );
}

class GetBibleVerseHTMLESVCall {
  static Future<ApiCallResponse> call({
    String? q = '',
    bool? includeAudioLink = true,
    String? attachAudioLinkTo = 'passage',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Verse HTML ESV',
      apiUrl: 'https://api.esv.org/v3/passage/html/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token d0f3c06eb7a47ec198359c3429a0f288fff342a7',
      },
      params: {
        'q': q,
        'include-audio-link': includeAudioLink,
        'attach-audio-link-to': attachAudioLinkTo,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic passages(dynamic response) => getJsonField(
        response,
        r'''$.passages''',
      );
}

class GetBibleVerseAudioESVCall {
  static Future<ApiCallResponse> call({
    String? q = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Bible Verse Audio ESV',
      apiUrl: 'https://api.esv.org/v3/passage/audio/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token d0f3c06eb7a47ec198359c3429a0f288fff342a7',
      },
      params: {
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MakeVerseGraphicCall {
  static Future<ApiCallResponse> call({
    String? verseRef = '',
    String? passage = '',
    String? uuid = '6c0d2403-0ff1-437e-874e-449adbf6c052',
  }) {
    final body = '''
{
    "templateId": "6173ddc1-2180-429c-97a7-1bf5862bdaf5",
    "requestName": "Request from Dashboard - 29-09-2022",
    "formats": ["jpg"],
    "variantName": "myvariant",
    "transparent": false,
    "fill": {
       "img-1": {
              "background": {
                     "type": "color",
                     "color": "",
                     "value": null
              },
              "data": "https://assets.duply.co/uploads/cf47b645-56f0-4261-87b7-5d88d4e45651/6173ddc1-2180-429c-97a7-1bf5862bdaf5/1664470200232-sample-upload.jpg",
              "type": "img",
              "border": {
                     "style": "solid",
                     "radius": 0
              }
       },
       "reference": {
              "background": {
                     "type": "color",
                     "color": "",
                     "value": null
              },
              "data": "${verseRef}",
              "type": "body",
              "border": {
                     "style": "solid",
                     "radius": 0
              }
       },
       "passage": {
              "background": {
                     "type": "color",
                     "color": "",
                     "value": null
              },
              "data": "${passage}",
              "type": "h2",
              "border": {
                     "style": "solid",
                     "radius": 0
              }
       }


    }
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'Make Verse Graphic',
      apiUrl: 'https://gen.duply.co/v1/generate/',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic TkNHVDY3Ni1RTjk0R1FaLU1TS1Y2OEUtM0IwUzhLSDphYjIxYTMxYy1iZDUyLTQ4NWYtYTY2Ny1iMzIxMWFjMTk0NGU=',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imagePath(dynamic response) => getJsonField(
        response,
        r'''$.data.urls.filepathJPG''',
      );
}

class GetLiveStreamIdCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getLiveStreamId',
      apiUrl: 'https://api.mux.com/video/v1/playback-ids/${playbackId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NTQyY2UxMTMtNWIwYi00MjIyLThjNDgtMWJiZDVhM2QwNmYzOlByOHkvejN1ZEdkZktleWJacGE2WE42bmRGem9MUzJMaU9FL0hJR1VYQmpwWk1RK29RTSs5em40M3Q4ZGxOS3ErZ1dMc05HSWxOVA==',
      },
      params: {
        'playbackID': "1",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic streamId(dynamic response) => getJsonField(
        response,
        r'''$.data.object.id''',
      );
  static dynamic playbackId(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class GetPastLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? streamId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPastLiveStream',
      apiUrl: 'https://api.mux.com/video/v1/assets?live_stream_id=${streamId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic NTQyY2UxMTMtNWIwYi00MjIyLThjNDgtMWJiZDVhM2QwNmYzOlByOHkvejN1ZEdkZktleWJacGE2WE42bmRGem9MUzJMaU9FL0hJR1VYQmpwWk1RK29RTSs5em40M3Q4ZGxOS3ErZ1dMc05HSWxOVA==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic playbackId(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
