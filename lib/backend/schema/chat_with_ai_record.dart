import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatWithAiRecord extends FirestoreRecord {
  ChatWithAiRecord._(
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

  void _initializeFields() {
    _userMsg = snapshotData['userMsg'] as String?;
    _aiResponse = snapshotData['ai_response'] as String?;
    _id = snapshotData['id'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_with_ai');

  static Stream<ChatWithAiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatWithAiRecord.fromSnapshot(s));

  static Future<ChatWithAiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatWithAiRecord.fromSnapshot(s));

  static ChatWithAiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatWithAiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatWithAiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatWithAiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatWithAiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatWithAiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatWithAiRecordData({
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

class ChatWithAiRecordDocumentEquality implements Equality<ChatWithAiRecord> {
  const ChatWithAiRecordDocumentEquality();

  @override
  bool equals(ChatWithAiRecord? e1, ChatWithAiRecord? e2) {
    return e1?.userMsg == e2?.userMsg &&
        e1?.aiResponse == e2?.aiResponse &&
        e1?.id == e2?.id;
  }

  @override
  int hash(ChatWithAiRecord? e) =>
      const ListEquality().hash([e?.userMsg, e?.aiResponse, e?.id]);

  @override
  bool isValidKey(Object? o) => o is ChatWithAiRecord;
}
