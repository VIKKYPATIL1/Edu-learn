import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectsRecord extends FirestoreRecord {
  SubjectsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "SubjectName" field.
  String? _subjectName;
  String get subjectName => _subjectName ?? '';
  bool hasSubjectName() => _subjectName != null;

  // "Year" field.
  int? _year;
  int get year => _year ?? 0;
  bool hasYear() => _year != null;

  // "SubjectImage" field.
  String? _subjectImage;
  String get subjectImage => _subjectImage ?? '';
  bool hasSubjectImage() => _subjectImage != null;

  void _initializeFields() {
    _subjectName = snapshotData['SubjectName'] as String?;
    _year = castToType<int>(snapshotData['Year']);
    _subjectImage = snapshotData['SubjectImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Subjects');

  static Stream<SubjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubjectsRecord.fromSnapshot(s));

  static Future<SubjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubjectsRecord.fromSnapshot(s));

  static SubjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubjectsRecordData({
  String? subjectName,
  int? year,
  String? subjectImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SubjectName': subjectName,
      'Year': year,
      'SubjectImage': subjectImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubjectsRecordDocumentEquality implements Equality<SubjectsRecord> {
  const SubjectsRecordDocumentEquality();

  @override
  bool equals(SubjectsRecord? e1, SubjectsRecord? e2) {
    return e1?.subjectName == e2?.subjectName &&
        e1?.year == e2?.year &&
        e1?.subjectImage == e2?.subjectImage;
  }

  @override
  int hash(SubjectsRecord? e) =>
      const ListEquality().hash([e?.subjectName, e?.year, e?.subjectImage]);

  @override
  bool isValidKey(Object? o) => o is SubjectsRecord;
}
