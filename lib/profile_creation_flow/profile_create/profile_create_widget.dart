import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile_creation_flow/edit_profile_component/edit_profile_component_widget.dart';
import 'package:flutter/material.dart';
import 'profile_create_model.dart';
export 'profile_create_model.dart';

class ProfileCreateWidget extends StatefulWidget {
  const ProfileCreateWidget({super.key});

  @override
  State<ProfileCreateWidget> createState() => _ProfileCreateWidgetState();
}

class _ProfileCreateWidgetState extends State<ProfileCreateWidget> {
  late ProfileCreateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCreateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'profile_Create',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 570.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.editProfileComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: EditProfileComponentWidget(
                    title: 'Create Profile',
                    confirmButtonText: 'Confirm',
                    navigateAction: () async {},
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
