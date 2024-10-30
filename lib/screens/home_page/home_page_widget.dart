import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/blank_list_widget.dart';
import '/components/profilecomponent_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          drawer: SizedBox(
            width: 300.0,
            child: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 400.0,
                        decoration: const BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.profilecomponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const ProfilecomponentWidget(),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ContributeNotes',
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
                            child: Material(
                              color: Colors.transparent,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.note_alt_rounded,
                                ),
                                title: Text(
                                  'Contribute Notes',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily),
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                dense: false,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ChatWithAI',
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
                            child: Material(
                              color: Colors.transparent,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.support_agent_outlined,
                                ),
                                title: Text(
                                  'Chat with AI',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily),
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                dense: false,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ResumeCreater',
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
                            child: Material(
                              color: Colors.transparent,
                              child: ListTile(
                                leading: const FaIcon(
                                  FontAwesomeIcons.dochub,
                                ),
                                title: Text(
                                  'Resume Creater',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily),
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                dense: false,
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
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(200.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              actions: const [],
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).primaryBackground
                              ],
                              stops: const [0.0, 1.0],
                              begin: const AlignmentDirectional(0.0, -1.0),
                              end: const AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: const Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                      size: 40.0,
                                    ),
                                    onPressed: () async {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/finalyearprojectlogo-removebg-preview.png',
                                            fit: BoxFit.contain,
                                          ),
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
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            'Welcome $currentUserDisplayName',
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: const Color(0xCCFFFFFF),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 20.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 150.0,
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Text(
                            'Choose Topic',
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().isNotesPageLoad = true;

                                context.pushNamed(
                                  'NotesScreen',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );

                                safeSetState(() {});
                              },
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            offset: const Offset(
                                              1.0,
                                              1.0,
                                            ),
                                            spreadRadius: 1.0,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.book,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 60.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Text(
                                      'Notes',
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  'RoadMap',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              },
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            offset: const Offset(
                                              1.0,
                                              1.0,
                                            ),
                                            spreadRadius: 1.0,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.road,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 70.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Text(
                                      'RoadMap',
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'SavedVideo',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 100),
                                    ),
                                  },
                                );
                              },
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Text(
                                      'Saved',
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
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            offset: const Offset(
                                              1.0,
                                              1.0,
                                            ),
                                            spreadRadius: 1.0,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Icon(
                                          Icons.video_collection_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 60.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        'Recent Videos',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<RecentVideosUserViewRecord>>(
                      stream: queryRecentVideosUserViewRecord(
                        parent: currentUserReference,
                        queryBuilder: (recentVideosUserViewRecord) =>
                            recentVideosUserViewRecord.orderBy('viewTime',
                                descending: true),
                        limit: 10,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 30.0, 30.0, 30.0),
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
                        List<RecentVideosUserViewRecord>
                            pageViewRecentVideosUserViewRecordList =
                            snapshot.data!;
                        if (pageViewRecentVideosUserViewRecordList.isEmpty) {
                          return const Center(
                            child: BlankListWidget(
                              messageForComponent: 'No Recent Activity ',
                            ),
                          );
                        }

                        return SizedBox(
                          width: double.infinity,
                          height: 500.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  0,
                                                  pageViewRecentVideosUserViewRecordList
                                                          .length -
                                                      1))),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      pageViewRecentVideosUserViewRecordList
                                          .length,
                                  itemBuilder: (context, pageViewIndex) {
                                    final pageViewRecentVideosUserViewRecord =
                                        pageViewRecentVideosUserViewRecordList[
                                            pageViewIndex];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'videoPlayer',
                                            queryParameters: {
                                              'videoid': serializeParam(
                                                pageViewRecentVideosUserViewRecord
                                                    .videoId,
                                                ParamType.String,
                                              ),
                                              'description': serializeParam(
                                                pageViewRecentVideosUserViewRecord
                                                    .description,
                                                ParamType.String,
                                              ),
                                              'videoTitle': serializeParam(
                                                pageViewRecentVideosUserViewRecord
                                                    .title,
                                                ParamType.String,
                                              ),
                                              'thumbnail': serializeParam(
                                                pageViewRecentVideosUserViewRecord
                                                    .thumbnail,
                                                ParamType.String,
                                              ),
                                              'channelTitle': serializeParam(
                                                pageViewRecentVideosUserViewRecord
                                                    .channelTitle,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                                duration:
                                                    Duration(milliseconds: 200),
                                              ),
                                            },
                                          );
                                        },
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  pageViewRecentVideosUserViewRecord
                                                      .thumbnail,
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.fitWidth,
                                                  alignment:
                                                      const Alignment(0.0, 0.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  pageViewRecentVideosUserViewRecord
                                                      .title,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLargeFamily,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: max(
                                                0,
                                                min(
                                                    0,
                                                    pageViewRecentVideosUserViewRecordList
                                                            .length -
                                                        1))),
                                    count:
                                        pageViewRecentVideosUserViewRecordList
                                            .length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!
                                          .animateToPage(
                                        i,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                      safeSetState(() {});
                                    },
                                    effect: smooth_page_indicator.SlideEffect(
                                      spacing: 8.0,
                                      radius: 10.0,
                                      dotWidth: 8.0,
                                      dotHeight: 8.0,
                                      dotColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      activeDotColor:
                                          FlutterFlowTheme.of(context).primary,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
