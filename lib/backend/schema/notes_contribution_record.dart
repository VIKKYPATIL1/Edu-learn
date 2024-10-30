import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesContributionRecord extends FirestoreRecord {
  NotesContributionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "NotesPath" field.
  String? _notesPath;
  String get notesPath => _notesPath ?? '';
  bool hasNotesPath() => _notesPath != null;

  // "SubjectName" field.
  String? _subjectName;
  String get subjectName => _subjectName ?? '';
  bool hasSubjectName() => _subjectName != null;

  // "TopicName" field.
  String? _topicName;
  String get topicName => _topicName ?? '';
  bool hasTopicName() => _topicName != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "NotesScore" field.
  int? _notesScore;
  int get notesScore => _notesScore ?? 0;
  bool hasNotesScore() => _notesScore != null;

  void _initializeFields() {
    _notesPath = snapshotData['NotesPath'] as String?;
    _subjectName = snapshotData['SubjectName'] as String?;
    _topicName = snapshotData['TopicName'] as String?;
    _description = snapshotData['Description'] as String?;
    _notesScore = castToType<int>(snapshotData['NotesScore']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('NotesContribution');

  static Stream<NotesContributionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesContributionRecord.fromSnapshot(s));

  static Future<NotesContributionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NotesContributionRecord.fromSnapshot(s));

  static NotesContributionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotesContributionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesContributionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesContributionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesContributionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesContributionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesContributionRecordData({
  String? notesPath,
  String? subjectName,
  String? topicName,
  String? description,
  int? notesScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NotesPath': notesPath,
      'SubjectName': subjectName,
      'TopicName': topicName,
      'Description': description,
      'NotesScore': notesScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesContributionRecordDocumentEquality
    implements Equality<NotesContributionRecord> {
  const NotesContributionRecordDocumentEquality();

  @override
  bool equals(NotesContributionRecord? e1, NotesContributionRecord? e2) {
    return e1?.notesPath == e2?.notesPath &&
        e1?.subjectName == e2?.subjectName &&
        e1?.topicName == e2?.topicName &&
        e1?.description == e2?.description &&
        e1?.notesScore == e2?.notesScore;
  }

  @override
  int hash(NotesContributionRecord? e) => const ListEquality().hash([
        e?.notesPath,
        e?.subjectName,
        e?.topicName,
        e?.description,
        e?.notesScore
      ]);

  @override
  bool isValidKey(Object? o) => o is NotesContributionRecord;
}
