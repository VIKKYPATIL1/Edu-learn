import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'video_player_model.dart';
export 'video_player_model.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.videoid,
    required this.description,
    required this.videoTitle,
    required this.thumbnail,
    required this.channelTitle,
  });

  final String? videoid;
  final String? description;
  final String? videoTitle;
  final String? thumbnail;
  final String? channelTitle;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
      child: Title(
          title: 'videoPlayer',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  unawaited(
                    () async {
                      await UserSavedVideoRecord.createDoc(
                              currentUserReference!)
                          .set(createUserSavedVideoRecordData(
                        thumbnail: widget.thumbnail,
                        title: widget.videoTitle,
                        channelTitle: widget.channelTitle,
                        videoId: widget.videoid,
                        description: widget.description,
                      ));
                    }(),
                  );
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Video Saved successfully ',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                },
                backgroundColor: FlutterFlowTheme.of(context).tertiary,
                elevation: 8.0,
                child: Icon(
                  Icons.save,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
              appBar: AppBar(
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
                    widget.videoTitle,
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
                elevation: 10.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    offset: const Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    spreadRadius: 5.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(0.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              child: FlutterFlowYoutubePlayer(
                                url:
                                    'https://www.youtube.com/watch?v=${widget.videoid}',
                                width: double.infinity,
                                autoPlay: false,
                                looping: true,
                                mute: false,
                                showControls: true,
                                showFullScreen: true,
                                strictRelatedVideos: true,
                              ),
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
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.description,
                                    'Description',
                                  ),
                                  style: FlutterFlowTheme.of(context)
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
                                ),
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
          )),
    );
  }
}
