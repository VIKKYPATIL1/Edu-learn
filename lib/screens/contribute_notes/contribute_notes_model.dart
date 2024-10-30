import '/flutter_flow/flutter_flow_util.dart';
import 'contribute_notes_widget.dart' show ContributeNotesWidget;
import 'package:flutter/material.dart';

class ContributeNotesModel extends FlutterFlowModel<ContributeNotesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Subject widget.
  FocusNode? subjectFocusNode;
  TextEditingController? subjectTextController;
  String? Function(BuildContext, String?)? subjectTextControllerValidator;
  // State field(s) for Chapter widget.
  FocusNode? chapterFocusNode;
  TextEditingController? chapterTextController;
  String? Function(BuildContext, String?)? chapterTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    subjectFocusNode?.dispose();
    subjectTextController?.dispose();

    chapterFocusNode?.dispose();
    chapterTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
