import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'road_map_model.dart';
export 'road_map_model.dart';

class RoadMapWidget extends StatefulWidget {
  const RoadMapWidget({super.key});

  @override
  State<RoadMapWidget> createState() => _RoadMapWidgetState();
}

class _RoadMapWidgetState extends State<RoadMapWidget> {
  late RoadMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoadMapModel());

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
        title: 'RoadMap',
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
                  'Roadmaps',
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
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PagedMasonryGridView<DocumentSnapshot<Object?>?,
                    RoadMapCollectionRecord>.count(
                  pagingController: _model.setStaggeredViewController(
                    RoadMapCollectionRecord.collection.orderBy('RoadMapTitle'),
                  ),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  builderDelegate:
                      PagedChildBuilderDelegate<RoadMapCollectionRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitCircle(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    ),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitCircle(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, staggeredViewIndex) {
                      final staggeredViewRoadMapCollectionRecord = _model
                          .staggeredViewPagingController!
                          .itemList![staggeredViewIndex];
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(staggeredViewRoadMapCollectionRecord
                                .roadMapLink);
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: random_data
                                  .randomInteger(100, 300)
                                  .toDouble(),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    staggeredViewRoadMapCollectionRecord
                                        .roadMapImage,
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: const Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    spreadRadius: 2.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: AnimatedDefaultTextStyle(
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      duration: const Duration(milliseconds: 600),
                                      curve: Curves.easeOut,
                                      child: Text(
                                        staggeredViewRoadMapCollectionRecord
                                            .roadMapTitle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
