import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatWithJobRecord extends FirestoreRecord {
  ChatWithJobRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userMsg" field.
  String? _userMsg;
  String get userMsg => _userMsg ?? '';
  bool hasUserMsg() => _userMsg != null;

  // "ai_response" field.
  String? _aiResponse;
  String get aiResponse => _aiResponse ?? '';
  bool hasAiResponse() => _aiResponse != null;

  // "id" field.
  DateTime? _id;
  DateTime? get id => _id;
  bool hasId() => _id != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userMsg = snapshotData['userMsg'] as String?;
    _aiResponse = snapshotData['ai_response'] as String?;
    _id = snapshotData['id'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_with_job')
          : FirebaseFirestore.instance.collectionGroup('chat_with_job');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chat_with_job').doc(id);

  static Stream<ChatWithJobRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatWithJobRecord.fromSnapshot(s));

  static Future<ChatWithJobRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatWithJobRecord.fromSnapshot(s));

  static ChatWithJobRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatWithJobRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatWithJobRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatWithJobRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatWithJobRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatWithJobRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatWithJobRecordData({
  String? userMsg,
  String? aiResponse,
  DateTime? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userMsg': userMsg,
      'ai_response': aiResponse,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatWithJobRecordDocumentEquality implements Equality<ChatWithJobRecord> {
  const ChatWithJobRecordDocumentEquality();

  @override
  bool equals(ChatWithJobRecord? e1, ChatWithJobRecord? e2) {
    return e1?.userMsg == e2?.userMsg &&
        e1?.aiResponse == e2?.aiResponse &&
        e1?.id == e2?.id;
  }

  @override
  int hash(ChatWithJobRecord? e) =>
      const ListEquality().hash([e?.userMsg, e?.aiResponse, e?.id]);

  @override
  bool isValidKey(Object? o) => o is ChatWithJobRecord;
}
