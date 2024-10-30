import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'top_courses_widget.dart' show TopCoursesWidget;
import 'package:flutter/material.dart';

class TopCoursesModel extends FlutterFlowModel<TopCoursesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in TopCourses widget.
  List<SubjectsRecord>? allSubjectResultforPlayList;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  List<PlayListIDRecord> simpleSearchResults = [];
  // Stores action output result for [Backend Call - API (YoutubePlayList)] action in PlayListDetails widget.
  ApiCallResponse? mainPlayListSelectedResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
