import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserSavedVideoRecord extends FirestoreRecord {
  UserSavedVideoRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _thumbnail = snapshotData['thumbnail'] as String?;
    _title = snapshotData['title'] as String?;
    _channelTitle = snapshotData['channel_title'] as String?;
    _videoId = snapshotData['video_id'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userSavedVideo')
          : FirebaseFirestore.instance.collectionGroup('userSavedVideo');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userSavedVideo').doc(id);

  static Stream<UserSavedVideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserSavedVideoRecord.fromSnapshot(s));

  static Future<UserSavedVideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserSavedVideoRecord.fromSnapshot(s));

  static UserSavedVideoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserSavedVideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserSavedVideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserSavedVideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserSavedVideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserSavedVideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserSavedVideoRecordData({
  String? thumbnail,
  String? title,
  String? channelTitle,
  String? videoId,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'thumbnail': thumbnail,
      'title': title,
      'channel_title': channelTitle,
      'video_id': videoId,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserSavedVideoRecordDocumentEquality
    implements Equality<UserSavedVideoRecord> {
  const UserSavedVideoRecordDocumentEquality();

  @override
  bool equals(UserSavedVideoRecord? e1, UserSavedVideoRecord? e2) {
    return e1?.thumbnail == e2?.thumbnail &&
        e1?.title == e2?.title &&
        e1?.channelTitle == e2?.channelTitle &&
        e1?.videoId == e2?.videoId &&
        e1?.description == e2?.description;
  }

  @override
  int hash(UserSavedVideoRecord? e) => const ListEquality().hash(
      [e?.thumbnail, e?.title, e?.channelTitle, e?.videoId, e?.description]);

  @override
  bool isValidKey(Object? o) => o is UserSavedVideoRecord;
}
