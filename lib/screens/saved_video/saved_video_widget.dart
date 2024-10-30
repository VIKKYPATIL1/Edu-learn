import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/blank_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'saved_video_model.dart';
export 'saved_video_model.dart';

class SavedVideoWidget extends StatefulWidget {
  const SavedVideoWidget({super.key});

  @override
  State<SavedVideoWidget> createState() => _SavedVideoWidgetState();
}

class _SavedVideoWidgetState extends State<SavedVideoWidget> {
  late SavedVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SavedVideoModel());

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
        title: 'SavedVideo',
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
                  context.pushNamed(
                    'HomePage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.topToBottom,
                        duration: Duration(milliseconds: 200),
                      ),
                    },
                  );
                },
              ),
              title: Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Saved Content',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 10.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 500.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              onPageChanged: (_) => safeSetState(() {}),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child:
                                      StreamBuilder<List<UserSavedVideoRecord>>(
                                    stream: queryUserSavedVideoRecord(
                                      parent: currentUserReference,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UserSavedVideoRecord>
                                          listViewUserSavedVideoRecordList =
                                          snapshot.data!;

                                      return ListView.separated(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewUserSavedVideoRecordList
                                                .length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 10.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewUserSavedVideoRecord =
                                              listViewUserSavedVideoRecordList[
                                                  listViewIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
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
                                                    var recentCollectionRecordReference =
                                                        RecentCollectionRecord
                                                            .collection
                                                            .doc();
                                                    await recentCollectionRecordReference
                                                        .set(
                                                            createRecentCollectionRecordData(
                                                      thumbnail:
                                                          listViewUserSavedVideoRecord
                                                              .thumbnail,
                                                      title:
                                                          listViewUserSavedVideoRecord
                                                              .title,
                                                      channelTitle: '',
                                                      videoId:
                                                          listViewUserSavedVideoRecord
                                                              .videoId,
                                                      description:
                                                          listViewUserSavedVideoRecord
                                                              .description,
                                                      viewTime:
                                                          getCurrentTimestamp,
                                                    ));
                                                    _model.recentCollection =
                                                        RecentCollectionRecord
                                                            .getDocumentFromData(
                                                                createRecentCollectionRecordData(
                                                                  thumbnail:
                                                                      listViewUserSavedVideoRecord
                                                                          .thumbnail,
                                                                  title:
                                                                      listViewUserSavedVideoRecord
                                                                          .title,
                                                                  channelTitle:
                                                                      '',
                                                                  videoId:
                                                                      listViewUserSavedVideoRecord
                                                                          .videoId,
                                                                  description:
                                                                      listViewUserSavedVideoRecord
                                                                          .description,
                                                                  viewTime:
                                                                      getCurrentTimestamp,
                                                                ),
                                                                recentCollectionRecordReference);

                                                    context.pushNamed(
                                                      'videoPlayer',
                                                      queryParameters: {
                                                        'videoid':
                                                            serializeParam(
                                                          listViewUserSavedVideoRecord
                                                              .videoId,
                                                          ParamType.String,
                                                        ),
                                                        'description':
                                                            serializeParam(
                                                          listViewUserSavedVideoRecord
                                                              .description,
                                                          ParamType.String,
                                                        ),
                                                        'videoTitle':
                                                            serializeParam(
                                                          listViewUserSavedVideoRecord
                                                              .title,
                                                          ParamType.String,
                                                        ),
                                                        'thumbnail':
                                                            serializeParam(
                                                          listViewUserSavedVideoRecord
                                                              .thumbnail,
                                                          ParamType.String,
                                                        ),
                                                        'channelTitle':
                                                            serializeParam(
                                                          listViewUserSavedVideoRecord
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
                                                                  .bottomToTop,
                                                        ),
                                                      },
                                                    );

                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 5.0,
                                                          color:
                                                              Color(0x44111417),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 130.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0x4C4B39EF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: const Color(
                                                                    0xFF4B39EF),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                                child: Image
                                                                    .network(
                                                                  listViewUserSavedVideoRecord
                                                                      .thumbnail,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    listViewUserSavedVideoRecord
                                                                        .title,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewUserSavedVideoRecord.channelTitle,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              2.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(2.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await listViewUserSavedVideoRecord.reference.delete();
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Video Removed Successfully',
                                                                                        style: GoogleFonts.getFont(
                                                                                          'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                },
                                                                                text: 'Remove',
                                                                                options: FFButtonOptions(
                                                                                  height: 30.0,
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 10.0,
                                                                                  borderSide: const BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(22.0),
                                                                                ),
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
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: StreamBuilder<
                                      List<UserSavedPlayListRecord>>(
                                    stream: queryUserSavedPlayListRecord(
                                      parent: currentUserReference,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UserSavedPlayListRecord>
                                          listViewUserSavedPlayListRecordList =
                                          snapshot.data!;
                                      if (listViewUserSavedPlayListRecordList
                                          .isEmpty) {
                                        return const Center(
                                          child: SizedBox(
                                            height: 200.0,
                                            child: BlankListWidget(
                                              messageForComponent:
                                                  'No PlayList is saved',
                                            ),
                                          ),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewUserSavedPlayListRecordList
                                                .length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 10.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewUserSavedPlayListRecord =
                                              listViewUserSavedPlayListRecordList[
                                                  listViewIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
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
                                                    _model.savedPlayListResult =
                                                        await YoutubePlayListCall
                                                            .call(
                                                      playlistId:
                                                          listViewUserSavedPlayListRecord
                                                              .playListID,
                                                    );

                                                    if ((_model
                                                            .savedPlayListResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      context.pushNamed(
                                                        'playlist',
                                                        queryParameters: {
                                                          'description':
                                                              serializeParam(
                                                            listViewUserSavedPlayListRecord
                                                                .description,
                                                            ParamType.String,
                                                          ),
                                                          'channelTitle':
                                                              serializeParam(
                                                            listViewUserSavedPlayListRecord
                                                                .channelTitle,
                                                            ParamType.String,
                                                          ),
                                                          'videoIDListPath':
                                                              serializeParam(
                                                            getJsonField(
                                                              (_model.savedPlayListResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items''',
                                                              true,
                                                            ),
                                                            ParamType.JSON,
                                                            isList: true,
                                                          ),
                                                          'thumbnail':
                                                              serializeParam(
                                                            listViewUserSavedPlayListRecord
                                                                .thumbnail,
                                                            ParamType.String,
                                                          ),
                                                          'playListID':
                                                              serializeParam(
                                                            listViewUserSavedPlayListRecord
                                                                .playListID,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .bottomToTop,
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: const Text(
                                                                  'Something went wrong !'),
                                                              content: const Text(
                                                                  'Please check Internet C'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 5.0,
                                                          color:
                                                              Color(0x44111417),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 130.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0x4C4B39EF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: const Color(
                                                                    0xFF4B39EF),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                                child: Image
                                                                    .network(
                                                                  listViewUserSavedPlayListRecord
                                                                      .thumbnail,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    listViewUserSavedPlayListRecord
                                                                        .title,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              2.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(2.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await listViewUserSavedPlayListRecord.reference.delete();
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Video Removed Successfully',
                                                                                        style: GoogleFonts.getFont(
                                                                                          'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                },
                                                                                text: 'Remove',
                                                                                options: FFButtonOptions(
                                                                                  height: 30.0,
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                      ),
                                                                                  elevation: 10.0,
                                                                                  borderSide: const BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(22.0),
                                                                                ),
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
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(initialPage: 0),
                                count: 2,
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
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 2.0,
                                  spacing: 10.0,
                                  radius: 30.0,
                                  dotWidth: 10.0,
                                  dotHeight: 20.0,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
