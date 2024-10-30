import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'contribute_notes_model.dart';
export 'contribute_notes_model.dart';

class ContributeNotesWidget extends StatefulWidget {
  const ContributeNotesWidget({super.key});

  @override
  State<ContributeNotesWidget> createState() => _ContributeNotesWidgetState();
}

class _ContributeNotesWidgetState extends State<ContributeNotesWidget> {
  late ContributeNotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContributeNotesModel());

    _model.subjectTextController ??= TextEditingController();
    _model.subjectFocusNode ??= FocusNode();

    _model.chapterTextController ??= TextEditingController();
    _model.chapterFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

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
        title: 'ContributeNotes',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contribute Your Notes',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ),
                ].divide(const SizedBox(height: 4.0)),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).tertiary,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'HomePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 1270.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: Wrap(
                                    spacing: 16.0,
                                    runSpacing: 16.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.center,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 20.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: 330.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final selectedFiles =
                                                              await selectFiles(
                                                            allowedExtensions: [
                                                              'pdf'
                                                            ],
                                                            multiFile: false,
                                                          );
                                                          if (selectedFiles !=
                                                              null) {
                                                            safeSetState(() =>
                                                                _model.isDataUploading =
                                                                    true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              showUploadMessage(
                                                                context,
                                                                'Uploading file...',
                                                                showLoading:
                                                                    true,
                                                              );
                                                              selectedUploadedFiles =
                                                                  selectedFiles
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedFiles
                                                                    .map(
                                                                  (f) async =>
                                                                      await uploadData(
                                                                          f.storagePath,
                                                                          f.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .hideCurrentSnackBar();
                                                              _model.isDataUploading =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedFiles
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedFiles
                                                                        .length) {
                                                              safeSetState(() {
                                                                _model.uploadedLocalFile =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                              showUploadMessage(
                                                                context,
                                                                'Success!',
                                                              );
                                                            } else {
                                                              safeSetState(
                                                                  () {});
                                                              showUploadMessage(
                                                                context,
                                                                'Failed to upload file',
                                                              );
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        22.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    10.0),
                                                            child: GradientText(
                                                              'Select File',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displayMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .displayMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).displayMediumFamily),
                                                                  ),
                                                              colors: [
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning
                                                              ],
                                                              gradientDirection:
                                                                  GradientDirection
                                                                      .ltr,
                                                              gradientType:
                                                                  GradientType
                                                                      .linear,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowPdfViewer(
                                                      networkPath: _model
                                                          .uploadedFileUrl,
                                                      height: 274.0,
                                                      horizontalScroll: true,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            TextFormField(
                                              controller:
                                                  _model.subjectTextController,
                                              focusNode:
                                                  _model.subjectFocusNode,
                                              autofocus: true,
                                              textCapitalization:
                                                  TextCapitalization.characters,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Subject',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily),
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                errorStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 20.0,
                                                            16.0, 20.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .subjectTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                            TextFormField(
                                              controller:
                                                  _model.chapterTextController,
                                              focusNode:
                                                  _model.chapterFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Chapter',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily),
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                errorStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 20.0,
                                                            16.0, 20.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .chapterTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                            TextFormField(
                                              controller: _model
                                                  .descriptionTextController,
                                              focusNode:
                                                  _model.descriptionFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Notes Description',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
                                                        ),
                                                alignLabelWithHint: true,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                errorStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 16.0,
                                                            16.0, 16.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                              maxLines: 9,
                                              minLines: 5,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .descriptionTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ].divide(const SizedBox(height: 12.0)),
                                        ),
                                      ),
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: const BoxDecoration(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 770.0,
                        ),
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 12.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await NotesContributionRecord.collection
                                    .doc()
                                    .set(createNotesContributionRecordData(
                                      notesPath: _model.uploadedFileUrl,
                                      subjectName:
                                          _model.subjectTextController.text,
                                      topicName:
                                          _model.chapterTextController.text,
                                      description:
                                          _model.descriptionTextController.text,
                                    ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Thank you',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              },
                              text: 'Contribute',
                              options: FFButtonOptions(
                                width: 150.0,
                                height: 48.0,
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
