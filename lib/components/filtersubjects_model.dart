import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filtersubjects_widget.dart' show FiltersubjectsWidget;
import 'package:flutter/material.dart';

class FiltersubjectsModel extends FlutterFlowModel<FiltersubjectsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.
  Map<SubjectsRecord, bool> checkboxListTileValueMap = {};
  List<SubjectsRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
