import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'road_map_widget.dart' show RoadMapWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RoadMapModel extends FlutterFlowModel<RoadMapWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for StaggeredView widget.

  PagingController<DocumentSnapshot?, RoadMapCollectionRecord>?
      staggeredViewPagingController;
  Query? staggeredViewPagingQuery;
  List<StreamSubscription?> staggeredViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    for (var s in staggeredViewStreamSubscriptions) {
      s?.cancel();
    }
    staggeredViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, RoadMapCollectionRecord>
      setStaggeredViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    staggeredViewPagingController ??=
        _createStaggeredViewController(query, parent);
    if (staggeredViewPagingQuery != query) {
      staggeredViewPagingQuery = query;
      staggeredViewPagingController?.refresh();
    }
    return staggeredViewPagingController!;
  }

  PagingController<DocumentSnapshot?, RoadMapCollectionRecord>
      _createStaggeredViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, RoadMapCollectionRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryRoadMapCollectionRecordPage(
          queryBuilder: (_) => staggeredViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: staggeredViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
