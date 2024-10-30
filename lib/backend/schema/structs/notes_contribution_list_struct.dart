// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NotesContributionListStruct extends FFFirebaseStruct {
  NotesContributionListStruct({
    String? notesPath,
    String? topicName,
    String? subjectName,
    String? description,
    String? notesScrore,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _notesPath = notesPath,
        _topicName = topicName,
        _subjectName = subjectName,
        _description = description,
        _notesScrore = notesScrore,
        super(firestoreUtilData);

  // "notesPath" field.
  String? _notesPath;
  String get notesPath => _notesPath ?? '';
  set notesPath(String? val) => _notesPath = val;

  bool hasNotesPath() => _notesPath != null;

  // "TopicName" field.
  String? _topicName;
  String get topicName => _topicName ?? '';
  set topicName(String? val) => _topicName = val;

  bool hasTopicName() => _topicName != null;

  // "SubjectName" field.
  String? _subjectName;
  String get subjectName => _subjectName ?? '';
  set subjectName(String? val) => _subjectName = val;

  bool hasSubjectName() => _subjectName != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "notesScrore" field.
  String? _notesScrore;
  String get notesScrore => _notesScrore ?? '';
  set notesScrore(String? val) => _notesScrore = val;

  bool hasNotesScrore() => _notesScrore != null;

  static NotesContributionListStruct fromMap(Map<String, dynamic> data) =>
      NotesContributionListStruct(
        notesPath: data['notesPath'] as String?,
        topicName: data['TopicName'] as String?,
        subjectName: data['SubjectName'] as String?,
        description: data['Description'] as String?,
        notesScrore: data['notesScrore'] as String?,
      );

  static NotesContributionListStruct? maybeFromMap(dynamic data) => data is Map
      ? NotesContributionListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'notesPath': _notesPath,
        'TopicName': _topicName,
        'SubjectName': _subjectName,
        'Description': _description,
        'notesScrore': _notesScrore,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'notesPath': serializeParam(
          _notesPath,
          ParamType.String,
        ),
        'TopicName': serializeParam(
          _topicName,
          ParamType.String,
        ),
        'SubjectName': serializeParam(
          _subjectName,
          ParamType.String,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'notesScrore': serializeParam(
          _notesScrore,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotesContributionListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotesContributionListStruct(
        notesPath: deserializeParam(
          data['notesPath'],
          ParamType.String,
          false,
        ),
        topicName: deserializeParam(
          data['TopicName'],
          ParamType.String,
          false,
        ),
        subjectName: deserializeParam(
          data['SubjectName'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        notesScrore: deserializeParam(
          data['notesScrore'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotesContributionListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotesContributionListStruct &&
        notesPath == other.notesPath &&
        topicName == other.topicName &&
        subjectName == other.subjectName &&
        description == other.description &&
        notesScrore == other.notesScrore;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([notesPath, topicName, subjectName, description, notesScrore]);
}

NotesContributionListStruct createNotesContributionListStruct({
  String? notesPath,
  String? topicName,
  String? subjectName,
  String? description,
  String? notesScrore,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotesContributionListStruct(
      notesPath: notesPath,
      topicName: topicName,
      subjectName: subjectName,
      description: description,
      notesScrore: notesScrore,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotesContributionListStruct? updateNotesContributionListStruct(
  NotesContributionListStruct? notesContributionList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notesContributionList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotesContributionListStructData(
  Map<String, dynamic> firestoreData,
  NotesContributionListStruct? notesContributionList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notesContributionList == null) {
    return;
  }
  if (notesContributionList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      notesContributionList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notesContributionListData = getNotesContributionListFirestoreData(
      notesContributionList, forFieldValue);
  final nestedData =
      notesContributionListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      notesContributionList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotesContributionListFirestoreData(
  NotesContributionListStruct? notesContributionList, [
  bool forFieldValue = false,
]) {
  if (notesContributionList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notesContributionList.toMap());

  // Add any Firestore field values
  notesContributionList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotesContributionListListFirestoreData(
  List<NotesContributionListStruct>? notesContributionLists,
) =>
    notesContributionLists
        ?.map((e) => getNotesContributionListFirestoreData(e, true))
        .toList() ??
    [];
