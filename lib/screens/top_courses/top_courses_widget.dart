import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/blank_list_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'top_courses_model.dart';
export 'top_courses_model.dart';

class TopCoursesWidget extends StatefulWidget {
  const TopCoursesWidget({super.key});

  @override
  State<TopCoursesWidget> createState() => _TopCoursesWidgetState();
}

class _TopCoursesWidgetState extends State<TopCoursesWidget> {
  late TopCoursesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopCoursesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allSubjectResultforPlayList = await querySubjectsRecordOnce();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<PlayListIDRecord>>(
      future: queryPlayListIDRecordOnce(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<PlayListIDRecord> topCoursesPlayListIDRecordList = snapshot.data!;

        return Title(
            title: 'TopCourses',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(200.0),
                  child: AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    actions: const [],
                    flexibleSpace: FlexibleSpaceBar(
                      title: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 10.0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: const Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    spreadRadius: 0.0,
                                  )
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    'Top Courses',
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              offset: const Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
                                          ],
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displayMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StreamBuilder<List<SubjectsRecord>>(
                            stream: querySubjectsRecord(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<SubjectsRecord> dropDownSubjectsRecordList =
                                  snapshot.data!;

                              return FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: dropDownSubjectsRecordList
                                    .map((e) => e.subjectName)
                                    .toList(),
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.dropDownValue = val);
                                  await queryPlayListIDRecordOnce()
                                      .then(
                                        (records) => _model
                                            .simpleSearchResults = TextSearch(
                                          records
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record,
                                                        [record.subject]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model.dropDownValue!)
                                            .map((r) => r.object)
                                            .toList(),
                                      )
                                      .onError((_, __) =>
                                          _model.simpleSearchResults = [])
                                      .whenComplete(() => safeSetState(() {}));

                                  FFAppState().CheckSubjectSelected = true;
                                  safeSetState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                },
                                width: 350.0,
                                height: 45.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                searchTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                hintText: 'Select Topic',
                                searchHintText: 'Search Topic',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 35.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 10.0,
                                borderColor: Colors.transparent,
                                borderWidth: 1.0,
                                borderRadius: 30.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: true,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ],
                      ),
                      centerTitle: true,
                      expandedTitleScale: 1.0,
                    ),
                    elevation: 10.0,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Builder(
                    builder: (context) {
                      final topicTopCourse = (!FFAppState().CheckSubjectSelected
                              ? topCoursesPlayListIDRecordList
                              : _model.simpleSearchResults)
                          .toList();
                      if (topicTopCourse.isEmpty) {
                        return const Center(
                          child: SizedBox(
                            height: 200.0,
                            child: BlankListWidget(),
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        scrollDirection: Axis.vertical,
                        itemCount: topicTopCourse.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                        itemBuilder: (context, topicTopCourseIndex) {
                          final topicTopCourseItem =
                              topicTopCourse[topicTopCourseIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.mainPlayListSelectedResult =
                                        await YoutubePlayListCall.call(
                                      playlistId: topicTopCourseItem.iDPlayList,
                                    );

                                    if ((_model.mainPlayListSelectedResult
                                            ?.succeeded ??
                                        true)) {
                                      context.pushNamed(
                                        'playlist',
                                        queryParameters: {
                                          'description': serializeParam(
                                            getJsonField(
                                              (_model.mainPlayListSelectedResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'channelTitle': serializeParam(
                                            topicTopCourseItem.channel,
                                            ParamType.String,
                                          ),
                                          'videoIDListPath': serializeParam(
                                            getJsonField(
                                              (_model.mainPlayListSelectedResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.items''',
                                              true,
                                            ),
                                            ParamType.JSON,
                                            isList: true,
                                          ),
                                          'thumbnail': serializeParam(
                                            getJsonField(
                                              (_model.mainPlayListSelectedResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.items.snippet.thumbnails.default.url''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'playListID': serializeParam(
                                            topicTopCourseItem.iDPlayList,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.leftToRight,
                                            duration:
                                                Duration(milliseconds: 200),
                                          ),
                                        },
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title:
                                                  const Text('Something went wrong'),
                                              content: const Text(
                                                  'Please Check your Internet'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: Color(0x44111417),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 181.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  topicTopCourseItem
                                                      .subjectImage,
                                                ).image,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 5.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  offset: const Offset(
                                                    1.0,
                                                    1.0,
                                                  ),
                                                  spreadRadius: 2.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: const Color(0xFF4B39EF),
                                                width: 2.0,
                                              ),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 149.0,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xC3FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  topicTopCourseItem.subject,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    topicTopCourseItem
                                                        .topicName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      topicTopCourseItem
                                                          .channel,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Plus Jakarta Sans'),
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
