import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notes_viewer_model.dart';
export 'notes_viewer_model.dart';

class NotesViewerWidget extends StatefulWidget {
  const NotesViewerWidget({
    super.key,
    required this.subjectName,
    required this.notesPdfPath,
    required this.topicName,
  });

  final String? subjectName;
  final String? notesPdfPath;
  final String? topicName;

  @override
  State<NotesViewerWidget> createState() => _NotesViewerWidgetState();
}

class _NotesViewerWidgetState extends State<NotesViewerWidget> {
  late NotesViewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesViewerModel());

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
        title: 'NotesViewer',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  widget.subjectName,
                  'Subject',
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).titleMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleMediumFamily),
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.topicName,
                              'Topic',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleLargeFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                    FlutterFlowPdfViewer(
                      networkPath: valueOrDefault<String>(
                        widget.notesPdfPath,
                        'https://firebasestorage.googleapis.com/v0/b/job-seeker-24a9a.appspot.com/o/users%2FJ1ZlgjBN1jTTxWjKtgxsDSrOAD52%2Fuploads%2F1730032346495000.pdf?alt=media&token=996387e0-205a-4254-b5b9-da8a3ef10912',
                      ),
                      height: MediaQuery.sizeOf(context).height,
                      horizontalScroll: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
