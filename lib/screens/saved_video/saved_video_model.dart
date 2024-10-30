import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'saved_video_widget.dart' show SavedVideoWidget;
import 'package:flutter/material.dart';

class SavedVideoModel extends FlutterFlowModel<SavedVideoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Create Document] action in SavedVideoDetails widget.
  RecentCollectionRecord? recentCollection;
  // Stores action output result for [Backend Call - API (YoutubePlayList)] action in SavedPlayListDetails widget.
  ApiCallResponse? savedPlayListResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
