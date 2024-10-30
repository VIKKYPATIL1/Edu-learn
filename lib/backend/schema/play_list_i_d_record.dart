import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayListIDRecord extends FirestoreRecord {
  PlayListIDRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TopicName" field.
  String? _topicName;
  String get topicName => _topicName ?? '';
  bool hasTopicName() => _topicName != null;

  // "IDPlayList" field.
  String? _iDPlayList;
  String get iDPlayList => _iDPlayList ?? '';
  bool hasIDPlayList() => _iDPlayList != null;

  // "Channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  bool hasChannel() => _channel != null;

  // "Subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "SubjectImage" field.
  String? _subjectImage;
  String get subjectImage => _subjectImage ?? '';
  bool hasSubjectImage() => _subjectImage != null;

  void _initializeFields() {
    _topicName = snapshotData['TopicName'] as String?;
    _iDPlayList = snapshotData['IDPlayList'] as String?;
    _channel = snapshotData['Channel'] as String?;
    _subject = snapshotData['Subject'] as String?;
    _subjectImage = snapshotData['SubjectImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PlayListID');

  static Stream<PlayListIDRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlayListIDRecord.fromSnapshot(s));

  static Future<PlayListIDRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlayListIDRecord.fromSnapshot(s));

  static PlayListIDRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlayListIDRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlayListIDRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlayListIDRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlayListIDRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlayListIDRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlayListIDRecordData({
  String? topicName,
  String? iDPlayList,
  String? channel,
  String? subject,
  String? subjectImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TopicName': topicName,
      'IDPlayList': iDPlayList,
      'Channel': channel,
      'Subject': subject,
      'SubjectImage': subjectImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlayListIDRecordDocumentEquality implements Equality<PlayListIDRecord> {
  const PlayListIDRecordDocumentEquality();

  @override
  bool equals(PlayListIDRecord? e1, PlayListIDRecord? e2) {
    return e1?.topicName == e2?.topicName &&
        e1?.iDPlayList == e2?.iDPlayList &&
        e1?.channel == e2?.channel &&
        e1?.subject == e2?.subject &&
        e1?.subjectImage == e2?.subjectImage;
  }

  @override
  int hash(PlayListIDRecord? e) => const ListEquality().hash(
      [e?.topicName, e?.iDPlayList, e?.channel, e?.subject, e?.subjectImage]);

  @override
  bool isValidKey(Object? o) => o is PlayListIDRecord;
}
