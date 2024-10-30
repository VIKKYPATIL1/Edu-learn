import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserSavedPlayListRecord extends FirestoreRecord {
  UserSavedPlayListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "channel_title" field.
  String? _channelTitle;
  String get channelTitle => _channelTitle ?? '';
  bool hasChannelTitle() => _channelTitle != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "playListID" field.
  String? _playListID;
  String get playListID => _playListID ?? '';
  bool hasPlayListID() => _playListID != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _thumbnail = snapshotData['thumbnail'] as String?;
    _channelTitle = snapshotData['channel_title'] as String?;
    _description = snapshotData['description'] as String?;
    _playListID = snapshotData['playListID'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userSavedPlayList')
          : FirebaseFirestore.instance.collectionGroup('userSavedPlayList');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userSavedPlayList').doc(id);

  static Stream<UserSavedPlayListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserSavedPlayListRecord.fromSnapshot(s));

  static Future<UserSavedPlayListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserSavedPlayListRecord.fromSnapshot(s));

  static UserSavedPlayListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserSavedPlayListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserSavedPlayListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserSavedPlayListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserSavedPlayListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserSavedPlayListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserSavedPlayListRecordData({
  String? thumbnail,
  String? channelTitle,
  String? description,
  String? playListID,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'thumbnail': thumbnail,
      'channel_title': channelTitle,
      'description': description,
      'playListID': playListID,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserSavedPlayListRecordDocumentEquality
    implements Equality<UserSavedPlayListRecord> {
  const UserSavedPlayListRecordDocumentEquality();

  @override
  bool equals(UserSavedPlayListRecord? e1, UserSavedPlayListRecord? e2) {
    return e1?.thumbnail == e2?.thumbnail &&
        e1?.channelTitle == e2?.channelTitle &&
        e1?.description == e2?.description &&
        e1?.playListID == e2?.playListID &&
        e1?.title == e2?.title;
  }

  @override
  int hash(UserSavedPlayListRecord? e) => const ListEquality().hash(
      [e?.thumbnail, e?.channelTitle, e?.description, e?.playListID, e?.title]);

  @override
  bool isValidKey(Object? o) => o is UserSavedPlayListRecord;
}
