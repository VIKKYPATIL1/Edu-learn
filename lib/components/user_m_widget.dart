import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_m_model.dart';
export 'user_m_model.dart';

class UserMWidget extends StatefulWidget {
  const UserMWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<UserMWidget> createState() => _UserMWidgetState();
}

class _UserMWidgetState extends State<UserMWidget> {
  late UserMModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserMModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Wrap(
              spacing: 0.0,
              runSpacing: 0.0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: SelectionArea(
                        child: AutoSizeText(
                      widget.parameter1!,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Open Sans',
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Open Sans'),
                          ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
