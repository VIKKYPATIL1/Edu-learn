import '/backend/backend.dart';
import '/components/notes_count_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notes_screen_widget.dart' show NotesScreenWidget;
import 'package:flutter/material.dart';

class NotesScreenModel extends FlutterFlowModel<NotesScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in NotesScreen widget.
  List<NotesContributionRecord>? notesSearchFromFirebase;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<NotesContributionRecord>? notesSearchusingSearchButton;
  List<NotesContributionRecord> simpleSearchResults = [];
  // Models for notesCount dynamic component.
  late FlutterFlowDynamicModels<NotesCountModel> notesCountModels;

  @override
  void initState(BuildContext context) {
    notesCountModels = FlutterFlowDynamicModels(() => NotesCountModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    notesCountModels.dispose();
  }
}
