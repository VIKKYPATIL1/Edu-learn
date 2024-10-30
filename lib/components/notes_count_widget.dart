import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notes_count_model.dart';
export 'notes_count_model.dart';

class NotesCountWidget extends StatefulWidget {
  /// mannages Notes Count
  const NotesCountWidget({super.key});

  @override
  State<NotesCountWidget> createState() => _NotesCountWidgetState();
}

class _NotesCountWidgetState extends State<NotesCountWidget> {
  late NotesCountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesCountModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
      ),
      child: FlutterFlowCountController(
        decrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.solidThumbsDown,
          color: enabled
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).alternate,
          size: 24.0,
        ),
        incrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.solidThumbsUp,
          color: enabled
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).alternate,
          size: 24.0,
        ),
        countBuilder: (count) => Text(
          count.toString(),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
              ),
        ),
        count: _model.countControllerValue ??= _model.notesScrore!,
        updateCount: (count) async {
          safeSetState(() => _model.countControllerValue = count);
          await _model.notesDocument!.update(createNotesContributionRecordData(
            notesScore: _model.countControllerValue,
          ));

          _model.updatePage(() {});
        },
        stepSize: 1,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      ),
    );
  }
}
