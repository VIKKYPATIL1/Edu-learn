import '/components/user_m_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_with_a_i_widget.dart' show ChatWithAIWidget;
import 'package:flutter/material.dart';

class ChatWithAIModel extends FlutterFlowModel<ChatWithAIWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Models for userM dynamic component.
  late FlutterFlowDynamicModels<UserMModel> userMModels;
  // State field(s) for prompt widget.
  FocusNode? promptFocusNode;
  TextEditingController? promptTextController;
  String? Function(BuildContext, String?)? promptTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? aiResponse;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
    userMModels = FlutterFlowDynamicModels(() => UserMModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    listViewController?.dispose();
    userMModels.dispose();
    promptFocusNode?.dispose();
    promptTextController?.dispose();
  }
}
