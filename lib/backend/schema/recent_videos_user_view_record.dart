import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecentVideosUserViewRecord extends FirestoreRecord {
  RecentVideosUserViewRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "channel_title" field.
  String? _channelTitle;
  String get channelTitle => _channelTitle ?? '';
  bool hasChannelTitle() => _channelTitle != null;

  // "video_id" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  bool hasVideoId() => _videoId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "viewTime" field.
  DateTime? _viewTime;
  DateTime? get viewTime => _viewTime;
  bool hasViewTime() => _viewTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _thumbnail = snapshotData['thumbnail'] as String?;
    _title = snapshotData['title'] as String?;
    _channelTitle = snapshotData['channel_title'] as String?;
    _videoId = snapshotData['video_id'] as String?;
    _description = snapshotData['description'] as String?;
    _viewTime = snapshotData['viewTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('recentVideosUserView')
          : FirebaseFirestore.instance.collectionGroup('recentVideosUserView');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('recentVideosUserView').doc(id);

  static Stream<RecentVideosUserViewRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => RecentVideosUserViewRecord.fromSnapshot(s));

  static Future<RecentVideosUserViewRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RecentVideosUserViewRecord.fromSnapshot(s));

  static RecentVideosUserViewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecentVideosUserViewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecentVideosUserViewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecentVideosUserViewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecentVideosUserViewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecentVideosUserViewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecentVideosUserViewRecordData({
  String? thumbnail,
  String? title,
  String? channelTitle,
  String? videoId,
  String? description,
  DateTime? viewTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'thumbnail': thumbnail,
      'title': title,
      'channel_title': channelTitle,
      'video_id': videoId,
      'description': description,
      'viewTime': viewTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecentVideosUserViewRecordDocumentEquality
    implements Equality<RecentVideosUserViewRecord> {
  const RecentVideosUserViewRecordDocumentEquality();

  @override
  bool equals(RecentVideosUserViewRecord? e1, RecentVideosUserViewRecord? e2) {
    return e1?.thumbnail == e2?.thumbnail &&
        e1?.title == e2?.title &&
        e1?.channelTitle == e2?.channelTitle &&
        e1?.videoId == e2?.videoId &&
        e1?.description == e2?.description &&
        e1?.viewTime == e2?.viewTime;
  }

  @override
  int hash(RecentVideosUserViewRecord? e) => const ListEquality().hash([
        e?.thumbnail,
        e?.title,
        e?.channelTitle,
        e?.videoId,
        e?.description,
        e?.viewTime
      ]);

  @override
  bool isValidKey(Object? o) => o is RecentVideosUserViewRecord;
}
