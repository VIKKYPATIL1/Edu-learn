import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_courses_model.dart';
export 'search_courses_model.dart';

class SearchCoursesWidget extends StatefulWidget {
  const SearchCoursesWidget({super.key});

  @override
  State<SearchCoursesWidget> createState() => _SearchCoursesWidgetState();
}

class _SearchCoursesWidgetState extends State<SearchCoursesWidget> {
  late SearchCoursesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchCoursesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pageLoadSearch = await YoutubeSearchCall.call();

      if ((_model.pageLoadSearch?.succeeded ?? true)) {
        safeSetState(() {
          _model.textController?.clear();
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: const Text('Something went wrong'),
                content: const Text('Please Check Internet'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
      }

      FFAppState().searchButtonClick = false;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Title(
        title: 'SearchCourses',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                actions: const [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Container(
                                  width: 280.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        offset: const Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Seach here...',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                hoverColor:
                                    FlutterFlowTheme.of(context).success,
                                hoverIconColor:
                                    FlutterFlowTheme.of(context).accent1,
                                icon: Icon(
                                  Icons.search_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 30.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  _model.searchYoutubeVideoResult =
                                      await YoutubeSearchCall.call(
                                    q: _model.textController.text,
                                  );

                                  if ((_model.searchYoutubeVideoResult
                                          ?.succeeded ??
                                      true)) {
                                    safeSetState(() {});
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title:
                                                const Text('Something went wronge'),
                                            content: const Text(
                                                'Please check your internet or try to search again'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }

                                  FFAppState().searchButtonClick = true;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 10.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Builder(
                  builder: (context) {
                    final searchVideoItems = (FFAppState().searchButtonClick
                                ? YoutubeSearchCall.searchItems(
                                    (_model.searchYoutubeVideoResult
                                            ?.jsonBody ??
                                        ''),
                                  )
                                    ?.where((e) => valueOrDefault<bool>(
                                          getJsonField(
                                                e,
                                                r'''$.id.channelId''',
                                              ) ==
                                              null,
                                          true,
                                        ))
                                    .toList()
                                : YoutubeSearchCall.searchItems(
                                    (_model.pageLoadSearch?.jsonBody ?? ''),
                                  )
                                    ?.where((e) => valueOrDefault<bool>(
                                          getJsonField(
                                                e,
                                                r'''$.id.channelId''',
                                              ) ==
                                              null,
                                          false,
                                        ))
                                    .toList())
                            ?.toList() ??
                        [];

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      scrollDirection: Axis.vertical,
                      itemCount: searchVideoItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                      itemBuilder: (context, searchVideoItemsIndex) {
                        final searchVideoItemsItem =
                            searchVideoItems[searchVideoItemsIndex];
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
                                  if (getJsonField(
                                        searchVideoItemsItem,
                                        r'''$.id.playlistId''',
                                      ) ==
                                      null) {
                                    await RecentVideosUserViewRecord.createDoc(
                                            currentUserReference!)
                                        .set(
                                            createRecentVideosUserViewRecordData(
                                      thumbnail: getJsonField(
                                        searchVideoItemsItem,
                                        r'''$.snippet.thumbnails.high.url''',
                                      ).toString(),
                                      title: getJsonField(
                                        searchVideoItemsItem,
                                        r'''$.snippet.title''',
                                      ).toString(),
                                      channelTitle: getJsonField(
                                        searchVideoItemsItem,
                                        r'''$.snippet.channelTitle''',
                                      ).toString(),
                                      videoId: getJsonField(
                                        searchVideoItemsItem,
                                        r'''$.id.videoId''',
                                      ).toString(),
                                      description: getJsonField(
                                        searchVideoItemsItem,
                                        r'''$.snippet.description''',
                                      ).toString(),
                                      viewTime: getCurrentTimestamp,
                                    ));

                                    context.pushNamed(
                                      'videoPlayer',
                                      queryParameters: {
                                        'videoid': serializeParam(
                                          getJsonField(
                                            searchVideoItemsItem,
                                            r'''$.id.videoId''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'description': serializeParam(
                                          getJsonField(
                                            searchVideoItemsItem,
                                            r'''$.snippet.description''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'videoTitle': serializeParam(
                                          getJsonField(
                                            searchVideoItemsItem,
                                            r'''$.snippet.title''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'thumbnail': serializeParam(
                                          getJsonField(
                                            searchVideoItemsItem,
                                            r'''$.snippet.thumbnails.default.url''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'channelTitle': serializeParam(
                                          getJsonField(
                                            searchVideoItemsItem,
                                            r'''$.snippet.channelTitle''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 200),
                                        ),
                                      },
                                    );
                                  } else {
                                    _model.playListIDfromSearchScreen =
                                        await YoutubePlayListCall.call(
                                      playlistId: getJsonField(
                                        searchVideoItemsItem,
                                        r'''$.id.playlistId''',
                                      ).toString(),
                                    );

                                    context.pushNamed(
                                      'playlist',
                                      queryParameters: {
                                        'description': serializeParam(
                                          getJsonField(
                                            (_model.playListIDfromSearchScreen
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.items.snippet.description''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'channelTitle': serializeParam(
                                          getJsonField(
                                            searchVideoItemsItem,
                                            r'''$.snippet.channelTitle''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'videoIDListPath': serializeParam(
                                          getJsonField(
                                            (_model.playListIDfromSearchScreen
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
                                            searchVideoItemsItem,
                                            r'''$.snippet.thumbnails.default.url''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'playListID': serializeParam(
                                          getJsonField(
                                            searchVideoItemsItem,
                                            r'''$.id.playlistId''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 200),
                                        ),
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
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 10.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: 130.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0x4C4B39EF),
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
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                child: Image.network(
                                                  getJsonField(
                                                    searchVideoItemsItem,
                                                    r'''$.snippet.thumbnails.default.url''',
                                                  ).toString(),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  getJsonField(
                                                    searchVideoItemsItem,
                                                    r'''$.snippet.title''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            searchVideoItemsItem,
                                                            r'''$.snippet.channelTitle''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Plus Jakarta Sans'),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
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
          ),
        ));
  }
}
