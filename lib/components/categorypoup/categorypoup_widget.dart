import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'categorypoup_model.dart';
export 'categorypoup_model.dart';

class CategorypoupWidget extends StatefulWidget {
  const CategorypoupWidget({
    super.key,
    this.appSetting,
  });

  final AppSettingsRecord? appSetting;

  @override
  State<CategorypoupWidget> createState() => _CategorypoupWidgetState();
}

class _CategorypoupWidgetState extends State<CategorypoupWidget> {
  late CategorypoupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategorypoupModel());

    _model.textFieldsearchTextController ??= TextEditingController();
    _model.textFieldsearchFocusNode ??= FocusNode();

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          StreamBuilder<List<CategoryMasterRecord>>(
            stream: queryCategoryMasterRecord(
              queryBuilder: (categoryMasterRecord) =>
                  categoryMasterRecord.orderBy('name'),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitFadingCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                  ),
                );
              }
              List<CategoryMasterRecord> containerCategoryMasterRecordList =
                  snapshot.data!;

              return Container(
                width: 300.0,
                height: 330.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  'addCategoryM',
                                  queryParameters: {
                                    'codeLen': serializeParam(
                                      FFAppState().catCodelength,
                                      ParamType.int,
                                    ),
                                    'appSetting': serializeParam(
                                      widget!.appSetting,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'appSetting': widget!.appSetting,
                                  },
                                );
                              },
                              child: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: TextFormField(
                          controller: _model.textFieldsearchTextController,
                          focusNode: _model.textFieldsearchFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textFieldsearchTextController',
                            Duration(milliseconds: 100),
                            () async {
                              await queryCategoryMasterRecordOnce()
                                  .then(
                                    (records) => _model.simpleSearchResults =
                                        TextSearch(
                                      records
                                          .map(
                                            (record) =>
                                                TextSearchItem.fromTerms(
                                                    record, [record.name!]),
                                          )
                                          .toList(),
                                    )
                                            .search(_model
                                                .textFieldsearchTextController
                                                .text)
                                            .map((r) => r.object)
                                            .take(8)
                                            .toList(),
                                  )
                                  .onError((_, __) =>
                                      _model.simpleSearchResults = [])
                                  .whenComplete(() => safeSetState(() {}));

                              FFAppState().isFullistShown = false;
                              FFAppState().update(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: FFLocalizations.of(context).getText(
                              'yn0q2f1l' /* Search here.... */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            suffixIcon: Icon(
                              Icons.search_sharp,
                              color: Color(0xFF757575),
                              size: 18.0,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelSmallFamily),
                              ),
                          validator: _model
                              .textFieldsearchTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 250.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Stack(
                            children: [
                              if (FFAppState().isFullistShown == true)
                                Builder(
                                  builder: (context) {
                                    final categorymasterlist =
                                        containerCategoryMasterRecordList
                                            .toList()
                                            .take(8)
                                            .toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          categorymasterlist.length,
                                          (categorymasterlistIndex) {
                                        final categorymasterlistItem =
                                            categorymasterlist[
                                                categorymasterlistIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 3.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState()
                                                      .setCategoryMasterName =
                                                  categorymasterlistItem.name;
                                              FFAppState().setCategoryRef =
                                                  categorymasterlistItem
                                                      .reference;
                                              FFAppState().update(() {});
                                              FFAppState().isFullistShown =
                                                  true;
                                              FFAppState().update(() {});

                                              context.goNamed(
                                                'addCategoryM',
                                                queryParameters: {
                                                  'codeLen': serializeParam(
                                                    FFAppState().catCodelength,
                                                    ParamType.int,
                                                  ),
                                                  'appSetting': serializeParam(
                                                    widget!.appSetting,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'appSetting':
                                                      widget!.appSetting,
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 270.0,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      categorymasterlistItem
                                                          .name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                    Container(
                                                      width: 270.0,
                                                      height: 0.1,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              if (FFAppState().isFullistShown == false)
                                Builder(
                                  builder: (context) {
                                    final searchresults =
                                        _model.simpleSearchResults.toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(searchresults.length,
                                              (searchresultsIndex) {
                                        final searchresultsItem =
                                            searchresults[searchresultsIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 3.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState()
                                                      .setCategoryMasterName =
                                                  searchresultsItem.name;
                                              FFAppState().setCategoryRef =
                                                  searchresultsItem.reference;
                                              FFAppState().isFullistShown =
                                                  true;
                                              FFAppState().update(() {});

                                              context.goNamed(
                                                'addCategoryM',
                                                queryParameters: {
                                                  'codeLen': serializeParam(
                                                    FFAppState().catCodelength,
                                                    ParamType.int,
                                                  ),
                                                  'appSetting': serializeParam(
                                                    widget!.appSetting,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'appSetting':
                                                      widget!.appSetting,
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 270.0,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      searchresultsItem.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
