import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/users_record.dart';
import 'schema/chat_with_ai_record.dart';
import 'schema/chat_with_job_record.dart';
import 'schema/subjects_record.dart';
import 'schema/play_list_i_d_record.dart';
import 'schema/notes_contribution_record.dart';
import 'schema/road_map_collection_record.dart';
import 'schema/recent_videos_user_view_record.dart';
import 'schema/user_saved_play_list_record.dart';
import 'schema/user_saved_video_record.dart';
import 'schema/recent_collection_record.dart';
import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/users_record.dart';
export 'schema/chat_with_ai_record.dart';
export 'schema/chat_with_job_record.dart';
export 'schema/subjects_record.dart';
export 'schema/play_list_i_d_record.dart';
export 'schema/notes_contribution_record.dart';
export 'schema/road_map_collection_record.dart';
export 'schema/recent_videos_user_view_record.dart';
export 'schema/user_saved_play_list_record.dart';
export 'schema/user_saved_video_record.dart';
export 'schema/recent_collection_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UsersRecord>> queryUsersRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UsersRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UsersRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ChatWithAiRecords (as a Stream and as a Future).
Future<int> queryChatWithAiRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ChatWithAiRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ChatWithAiRecord>> queryChatWithAiRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ChatWithAiRecord.collection,
      ChatWithAiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ChatWithAiRecord>> queryChatWithAiRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ChatWithAiRecord.collection,
      ChatWithAiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ChatWithAiRecord>> queryChatWithAiRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ChatWithAiRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ChatWithAiRecord.collection,
      ChatWithAiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ChatWithAiRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ChatWithJobRecords (as a Stream and as a Future).
Future<int> queryChatWithJobRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ChatWithJobRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ChatWithJobRecord>> queryChatWithJobRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ChatWithJobRecord.collection(parent),
      ChatWithJobRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ChatWithJobRecord>> queryChatWithJobRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ChatWithJobRecord.collection(parent),
      ChatWithJobRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ChatWithJobRecord>> queryChatWithJobRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ChatWithJobRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ChatWithJobRecord.collection(parent),
      ChatWithJobRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ChatWithJobRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query SubjectsRecords (as a Stream and as a Future).
Future<int> querySubjectsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SubjectsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SubjectsRecord>> querySubjectsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SubjectsRecord.collection,
      SubjectsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SubjectsRecord>> querySubjectsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SubjectsRecord.collection,
      SubjectsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<SubjectsRecord>> querySubjectsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, SubjectsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      SubjectsRecord.collection,
      SubjectsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<SubjectsRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PlayListIDRecords (as a Stream and as a Future).
Future<int> queryPlayListIDRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PlayListIDRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PlayListIDRecord>> queryPlayListIDRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PlayListIDRecord.collection,
      PlayListIDRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PlayListIDRecord>> queryPlayListIDRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PlayListIDRecord.collection,
      PlayListIDRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PlayListIDRecord>> queryPlayListIDRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PlayListIDRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PlayListIDRecord.collection,
      PlayListIDRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PlayListIDRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query NotesContributionRecords (as a Stream and as a Future).
Future<int> queryNotesContributionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NotesContributionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NotesContributionRecord>> queryNotesContributionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NotesContributionRecord.collection,
      NotesContributionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NotesContributionRecord>> queryNotesContributionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NotesContributionRecord.collection,
      NotesContributionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<NotesContributionRecord>>
    queryNotesContributionRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, NotesContributionRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          NotesContributionRecord.collection,
          NotesContributionRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<NotesContributionRecord> data) {
              for (var item in data) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              }
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query RoadMapCollectionRecords (as a Stream and as a Future).
Future<int> queryRoadMapCollectionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RoadMapCollectionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RoadMapCollectionRecord>> queryRoadMapCollectionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RoadMapCollectionRecord.collection,
      RoadMapCollectionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RoadMapCollectionRecord>> queryRoadMapCollectionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RoadMapCollectionRecord.collection,
      RoadMapCollectionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<RoadMapCollectionRecord>>
    queryRoadMapCollectionRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, RoadMapCollectionRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          RoadMapCollectionRecord.collection,
          RoadMapCollectionRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<RoadMapCollectionRecord> data) {
              for (var item in data) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              }
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query RecentVideosUserViewRecords (as a Stream and as a Future).
Future<int> queryRecentVideosUserViewRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RecentVideosUserViewRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RecentVideosUserViewRecord>> queryRecentVideosUserViewRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RecentVideosUserViewRecord.collection(parent),
      RecentVideosUserViewRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RecentVideosUserViewRecord>> queryRecentVideosUserViewRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RecentVideosUserViewRecord.collection(parent),
      RecentVideosUserViewRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<RecentVideosUserViewRecord>>
    queryRecentVideosUserViewRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, RecentVideosUserViewRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          RecentVideosUserViewRecord.collection(parent),
          RecentVideosUserViewRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<RecentVideosUserViewRecord> data) {
              for (var item in data) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              }
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query UserSavedPlayListRecords (as a Stream and as a Future).
Future<int> queryUserSavedPlayListRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserSavedPlayListRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserSavedPlayListRecord>> queryUserSavedPlayListRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserSavedPlayListRecord.collection(parent),
      UserSavedPlayListRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserSavedPlayListRecord>> queryUserSavedPlayListRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserSavedPlayListRecord.collection(parent),
      UserSavedPlayListRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UserSavedPlayListRecord>>
    queryUserSavedPlayListRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UserSavedPlayListRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          UserSavedPlayListRecord.collection(parent),
          UserSavedPlayListRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<UserSavedPlayListRecord> data) {
              for (var item in data) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              }
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query UserSavedVideoRecords (as a Stream and as a Future).
Future<int> queryUserSavedVideoRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserSavedVideoRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserSavedVideoRecord>> queryUserSavedVideoRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserSavedVideoRecord.collection(parent),
      UserSavedVideoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserSavedVideoRecord>> queryUserSavedVideoRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserSavedVideoRecord.collection(parent),
      UserSavedVideoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UserSavedVideoRecord>> queryUserSavedVideoRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UserSavedVideoRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UserSavedVideoRecord.collection(parent),
      UserSavedVideoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UserSavedVideoRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query RecentCollectionRecords (as a Stream and as a Future).
Future<int> queryRecentCollectionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RecentCollectionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RecentCollectionRecord>> queryRecentCollectionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RecentCollectionRecord.collection,
      RecentCollectionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RecentCollectionRecord>> queryRecentCollectionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RecentCollectionRecord.collection,
      RecentCollectionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<RecentCollectionRecord>>
    queryRecentCollectionRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, RecentCollectionRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          RecentCollectionRecord.collection,
          RecentCollectionRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<RecentCollectionRecord> data) {
              for (var item in data) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              }
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  getDocs(QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UsersRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUsersRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UsersRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUsersRecordData(email: email));
}
