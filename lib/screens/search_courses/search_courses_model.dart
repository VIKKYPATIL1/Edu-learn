import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_courses_widget.dart' show SearchCoursesWidget;
import 'package:flutter/material.dart';

class SearchCoursesModel extends FlutterFlowModel<SearchCoursesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (YoutubeSearch)] action in SearchCourses widget.
  ApiCallResponse? pageLoadSearch;
  // Stores action output result for [Backend Call - API (YoutubePlayList)] action in searchVideoDetails widget.
  ApiCallResponse? playListIDfromSearchScreen;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (YoutubeSearch)] action in IconButton widget.
  ApiCallResponse? searchYoutubeVideoResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
