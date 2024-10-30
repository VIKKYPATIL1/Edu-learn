import '/backend/backend.dart';
import '/components/blank_list_widget.dart';
import '/components/filtersubjects_widget.dart';
import '/components/notes_count_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notes_screen_model.dart';
export 'notes_screen_model.dart';

class NotesScreenWidget extends StatefulWidget {
  const NotesScreenWidget({super.key});

  @override
  State<NotesScreenWidget> createState() => _NotesScreenWidgetState();
}

class _NotesScreenWidgetState extends State<NotesScreenWidget>
    with TickerProviderStateMixin {
  late NotesScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasIconButtonTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().IsNotesSearch = false;
      safeSetState(() {});
      _model.notesSearchFromFirebase = await queryNotesContributionRecordOnce();

      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1080.0.ms,
            color: const Color(0x80B22121),
            angle: 0.524,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        title: 'NotesScreen',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(150.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                actions: const [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'HomePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.topToBottom,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 35.0,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Notes',
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displayMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displayMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 252.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
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
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Seach Topic',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
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
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                          Builder(
                            builder: (context) => FlutterFlowIconButton(
                              borderRadius: 10.0,
                              buttonSize: 45.0,
                              fillColor: FlutterFlowTheme.of(context).tertiary,
                              icon: Icon(
                                Icons.grid_view_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: const FiltersubjectsWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                );

                                FFAppState().IsNotesSearch = false;
                                FFAppState().isNotesPageLoad = false;
                                safeSetState(() {});
                              },
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 10.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            fillColor: FlutterFlowTheme.of(context).tertiary,
                            icon: Icon(
                              Icons.search_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              _model.notesSearchusingSearchButton =
                                  await queryNotesContributionRecordOnce();
                              safeSetState(() {
                                _model.simpleSearchResults = TextSearch(
                                  _model.notesSearchusingSearchButton!
                                      .map(
                                        (record) => TextSearchItem.fromTerms(
                                            record, [record.topicName]),
                                      )
                                      .toList(),
                                )
                                    .search(_model.textController.text)
                                    .map((r) => r.object)
                                    .toList();
                              });
                              FFAppState().IsNotesSearch = true;
                              FFAppState().isNotesPageLoad = false;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                          ).animateOnActionTrigger(
                              animationsMap[
                                  'iconButtonOnActionTriggerAnimation']!,
                              hasBeenTriggered: hasIconButtonTriggered),
                        ],
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2.0,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  final notesContributionList = () {
                        if (FFAppState().isNotesPageLoad) {
                          return _model.notesSearchFromFirebase;
                        } else if (FFAppState().IsNotesSearch) {
                          return _model.simpleSearchResults;
                        } else {
                          return _model.notesSearchusingSearchButton
                              ?.where((e) =>
                                  e.subjectName == FFAppState().filterSubject)
                              .toList();
                        }
                      }()
                          ?.toList() ??
                      [];
                  if (notesContributionList.isEmpty) {
                    return const Center(
                      child: SizedBox(
                        height: 200.0,
                        child: BlankListWidget(
                          messageForComponent: 'Notes is not available now.',
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: notesContributionList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                    itemBuilder: (context, notesContributionListIndex) {
                      final notesContributionListItem =
                          notesContributionList[notesContributionListIndex];
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
                                context.pushNamed(
                                  'NotesViewer',
                                  queryParameters: {
                                    'subjectName': serializeParam(
                                      notesContributionListItem.subjectName,
                                      ParamType.String,
                                    ),
                                    'notesPdfPath': serializeParam(
                                      notesContributionListItem.notesPath,
                                      ParamType.String,
                                    ),
                                    'topicName': serializeParam(
                                      notesContributionListItem.topicName,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 2),
                                    ),
                                  },
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
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
                                          width: 130.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0x4C4B39EF),
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
                                                'https://images.unsplash.com/photo-1628245124458-96793b50eba0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMXx8bm90ZXN8ZW58MHx8fHwxNzI5NDQyMTQxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
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
                                                  notesContributionListItem
                                                      .topicName,
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
                                                          notesContributionListItem
                                                              .subjectName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
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
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .notesCountModels
                                                            .getModel(
                                                          notesContributionListItem
                                                              .reference.id,
                                                          notesContributionListIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        updateOnChange: true,
                                                        child: NotesCountWidget(
                                                          key: Key(
                                                            'Keyqxp_${notesContributionListItem.reference.id}',
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
  }
}
