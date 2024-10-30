import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoadMapCollectionRecord extends FirestoreRecord {
  RoadMapCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "RoadMapTitle" field.
  String? _roadMapTitle;
  String get roadMapTitle => _roadMapTitle ?? '';
  bool hasRoadMapTitle() => _roadMapTitle != null;

  // "RoadMapLink" field.
  String? _roadMapLink;
  String get roadMapLink => _roadMapLink ?? '';
  bool hasRoadMapLink() => _roadMapLink != null;

  // "colorcode" field.
  String? _colorcode;
  String get colorcode => _colorcode ?? '';
  bool hasColorcode() => _colorcode != null;

  // "RoadMapImage" field.
  String? _roadMapImage;
  String get roadMapImage => _roadMapImage ?? '';
  bool hasRoadMapImage() => _roadMapImage != null;

  void _initializeFields() {
    _roadMapTitle = snapshotData['RoadMapTitle'] as String?;
    _roadMapLink = snapshotData['RoadMapLink'] as String?;
    _colorcode = snapshotData['colorcode'] as String?;
    _roadMapImage = snapshotData['RoadMapImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('roadMapCollection');

  static Stream<RoadMapCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoadMapCollectionRecord.fromSnapshot(s));

  static Future<RoadMapCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RoadMapCollectionRecord.fromSnapshot(s));

  static RoadMapCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RoadMapCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoadMapCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoadMapCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoadMapCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoadMapCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoadMapCollectionRecordData({
  String? roadMapTitle,
  String? roadMapLink,
  String? colorcode,
  String? roadMapImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RoadMapTitle': roadMapTitle,
      'RoadMapLink': roadMapLink,
      'colorcode': colorcode,
      'RoadMapImage': roadMapImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoadMapCollectionRecordDocumentEquality
    implements Equality<RoadMapCollectionRecord> {
  const RoadMapCollectionRecordDocumentEquality();

  @override
  bool equals(RoadMapCollectionRecord? e1, RoadMapCollectionRecord? e2) {
    return e1?.roadMapTitle == e2?.roadMapTitle &&
        e1?.roadMapLink == e2?.roadMapLink &&
        e1?.colorcode == e2?.colorcode &&
        e1?.roadMapImage == e2?.roadMapImage;
  }

  @override
  int hash(RoadMapCollectionRecord? e) => const ListEquality()
      .hash([e?.roadMapTitle, e?.roadMapLink, e?.colorcode, e?.roadMapImage]);

  @override
  bool isValidKey(Object? o) => o is RoadMapCollectionRecord;
}
