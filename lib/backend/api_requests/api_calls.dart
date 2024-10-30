import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class YoutubeSearchCall {
  static Future<ApiCallResponse> call({
    String? q = 'Java',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'YoutubeSearch',
      apiUrl: 'https://www.googleapis.com/youtube/v3/search?part=snippet',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'q': q,
        'key': "***",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? searchItems(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? itemChannelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? itemThumbnail(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.default.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class YoutubePlayListCall {
  static Future<ApiCallResponse> call({
    String? playlistId = 'PLhSp9OSVmeyJoNnAqghUK-Lit3qBgfa6o',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'YoutubePlayList',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'playlistId': playlistId,
        'key': "AIzaSyAuzZoPrL7Db6oxNvJPH-tcCdPN_aFUVug",
        'maxResults': "20",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? itemsInPlayList(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? channelID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? thumbnailsUrl(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.default.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? channelTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.channelTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoIdfromPlayList(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? playListID(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.playlistId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
