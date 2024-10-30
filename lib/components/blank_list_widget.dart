import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'blank_list_model.dart';
export 'blank_list_model.dart';

class BlankListWidget extends StatefulWidget {
  const BlankListWidget({
    super.key,
    String? messageForComponent,
  }) : messageForComponent = messageForComponent ?? 'Nothing';

  final String messageForComponent;

  @override
  State<BlankListWidget> createState() => _BlankListWidgetState();
}

class _BlankListWidgetState extends State<BlankListWidget> {
  late BlankListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: Container(
        width: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Lottie.asset(
              'assets/jsons/Animation_-_1729743039918.json',
              width: 400.0,
              height: 255.0,
              fit: BoxFit.fill,
              animate: true,
            ),
            Container(
              width: double.infinity,
              height: 44.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                widget.messageForComponent,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
