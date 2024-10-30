import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'playlist_model.dart';
export 'playlist_model.dart';

class PlaylistWidget extends StatefulWidget {
  const PlaylistWidget({
    super.key,
    required this.description,
    required this.channelTitle,
    this.videoIDListPath,
    required this.thumbnail,
    required this.playListID,
  });

  final String? description;
  final String? channelTitle;
  final List<dynamic>? videoIDListPath;
  final String? thumbnail;
  final String? playListID;

  @override
  State<PlaylistWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  late PlaylistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaylistModel());

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
        title: 'playlist',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: Align(
              alignment: const AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    unawaited(
                      () async {
                        var userSavedPlayListRecordReference =
                            UserSavedPlayListRecord.createDoc(
                                currentUserReference!);
                        await userSavedPlayListRecordReference
                            .set(createUserSavedPlayListRecordData(
                          thumbnail: getJsonField(
                            widget.videoIDListPath?.first,
                            r'''$.snippet.thumbnails.default.url''',
                          ).toString(),
                          channelTitle: widget.channelTitle,
                          description: widget.channelTitle,
                          playListID: widget.playListID,
                          title: widget.channelTitle,
                        ));
                        _model.playListSavedusignfloatingButton =
                            UserSavedPlayListRecord.getDocumentFromData(
                                createUserSavedPlayListRecordData(
                                  thumbnail: getJsonField(
                                    widget.videoIDListPath?.first,
                                    r'''$.snippet.thumbnails.default.url''',
                                  ).toString(),
                                  channelTitle: widget.channelTitle,
                                  description: widget.channelTitle,
                                  playListID: widget.playListID,
                                  title: widget.channelTitle,
                                ),
                                userSavedPlayListRecordReference);
                      }(),
                    );
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'PlayList successfully saved',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 2000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );

                    safeSetState(() {});
                  },
                  backgroundColor: FlutterFlowTheme.of(context).tertiary,
                  elevation: 20.0,
                  child: Icon(
                    Icons.save,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  valueOrDefault<String>(
                    widget.channelTitle,
                    'Title',
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            getJsonField(
                              widget.videoIDListPath!.first,
                              r'''$.snippet.thumbnails.high.url''',
                            ).toString(),
                            width: 400.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final listOfVideosfromPlayList =
                                widget.videoIDListPath?.toList() ?? [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listOfVideosfromPlayList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder:
                                  (context, listOfVideosfromPlayListIndex) {
                                final listOfVideosfromPlayListItem =
                                    listOfVideosfromPlayList[
                                        listOfVideosfromPlayListIndex];
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
                                          await RecentVideosUserViewRecord
                                                  .createDoc(
                                                      currentUserReference!)
                                              .set(
                                                  createRecentVideosUserViewRecordData(
                                            thumbnail: getJsonField(
                                              listOfVideosfromPlayListItem,
                                              r'''$.snippet.thumbnails.high.url''',
                                            ).toString(),
                                            title: getJsonField(
                                              listOfVideosfromPlayListItem,
                                              r'''$.snippet.title''',
                                            ).toString(),
                                            channelTitle: widget.channelTitle,
                                            videoId: getJsonField(
                                              listOfVideosfromPlayListItem,
                                              r'''$.snippet.resourceId.videoId''',
                                            ).toString(),
                                            description: getJsonField(
                                              listOfVideosfromPlayListItem,
                                              r'''$.snippet.description''',
                                            ).toString(),
                                            viewTime: getCurrentTimestamp,
                                          ));

                                          context.pushNamed(
                                            'videoPlayer',
                                            queryParameters: {
                                              'videoid': serializeParam(
                                                getJsonField(
                                                  listOfVideosfromPlayListItem,
                                                  r'''$.snippet.resourceId.videoId''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'description': serializeParam(
                                                getJsonField(
                                                  listOfVideosfromPlayListItem,
                                                  r'''$.snippet.description''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'videoTitle': serializeParam(
                                                getJsonField(
                                                  listOfVideosfromPlayListItem,
                                                  r'''$.snippet.title''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'thumbnail': serializeParam(
                                                widget.thumbnail,
                                                ParamType.String,
                                              ),
                                              'channelTitle': serializeParam(
                                                widget.channelTitle,
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: const Color(0xFF4B39EF),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      child: Image.network(
                                                        getJsonField(
                                                          listOfVideosfromPlayListItem,
                                                          r'''$.snippet.thumbnails.default.url''',
                                                        ).toString(),
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
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            listOfVideosfromPlayListItem,
                                                            r'''$.snippet.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
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
                ],
              ),
            ),
          ),
        ));
  }
}
