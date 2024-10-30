import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filtersubjects_model.dart';
export 'filtersubjects_model.dart';

class FiltersubjectsWidget extends StatefulWidget {
  const FiltersubjectsWidget({super.key});

  @override
  State<FiltersubjectsWidget> createState() => _FiltersubjectsWidgetState();
}

class _FiltersubjectsWidgetState extends State<FiltersubjectsWidget> {
  late FiltersubjectsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersubjectsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 50.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Choose Subjects',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Outfit'),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<SubjectsRecord>>(
                stream: querySubjectsRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitCircle(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<SubjectsRecord> gridViewSubjectsRecordList =
                      snapshot.data!;

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 2.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: gridViewSubjectsRecordList.length,
                    itemBuilder: (context, gridViewIndex) {
                      final gridViewSubjectsRecord =
                          gridViewSubjectsRecordList[gridViewIndex];
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.standard,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                unselectedWidgetColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                              child: CheckboxListTile(
                                value: _model.checkboxListTileValueMap[
                                    gridViewSubjectsRecord] ??= false,
                                onChanged: (newValue) async {
                                  safeSetState(() =>
                                      _model.checkboxListTileValueMap[
                                          gridViewSubjectsRecord] = newValue!);
                                },
                                title: Text(
                                  gridViewSubjectsRecord.subjectName,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily),
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                activeColor: const Color(0xFF301CE6),
                                checkColor: FlutterFlowTheme.of(context).info,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: FFButtonWidget(
                onPressed: () async {
                  FFAppState().filterSubjectButtonValue = _model
                      .checkboxListTileCheckedItems
                      .map((e) => e.subjectName)
                      .toList()
                      .cast<String>();
                  FFAppState().filterSubject =
                      FFAppState().filterSubjectButtonValue.first;
                  FFAppState().filterSubjectButtonValue = [];
                  FFAppState().IsNotesSearch = false;
                  FFAppState().isNotesPageLoad = false;
                  _model.updatePage(() {});
                  Navigator.pop(context);
                },
                text: 'Filter',
                icon: const Icon(
                  Icons.grid_view_rounded,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tertiary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(20.0),
                  hoverColor: FlutterFlowTheme.of(context).secondary,
                  hoverTextColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
