import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fsqr_model.dart';
export 'fsqr_model.dart';

class FsqrWidget extends StatefulWidget {
  const FsqrWidget({
    super.key,
    this.json,
    this.orderId,
  });

  final dynamic json;
  final String? orderId;

  @override
  State<FsqrWidget> createState() => _FsqrWidgetState();
}

class _FsqrWidgetState extends State<FsqrWidget> {
  late FsqrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FsqrModel());

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
        title: 'FSQR',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              getJsonField(
                                widget!.json,
                                r'''$.image_url''',
                              ).toString(),
                              width: 500.0,
                              height: 500.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Text(
                            getJsonField(
                              widget!.json,
                              r'''$''',
                            ).toString(),
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                        StreamBuilder<List<QrTransactionsRecord>>(
                          stream: queryQrTransactionsRecord(
                            queryBuilder: (qrTransactionsRecord) =>
                                qrTransactionsRecord.where(
                              'orderId',
                              isEqualTo: widget!.orderId,
                            ),
                            singleRecord: true,
                          )..listen((snapshot) {
                              List<QrTransactionsRecord>
                                  listViewQrTransactionsRecordList = snapshot;
                              final listViewQrTransactionsRecord =
                                  listViewQrTransactionsRecordList.isNotEmpty
                                      ? listViewQrTransactionsRecordList.first
                                      : null;
                              if (_model.listViewPreviousSnapshot != null &&
                                  !const ListEquality(
                                          QrTransactionsRecordDocumentEquality())
                                      .equals(listViewQrTransactionsRecordList,
                                          _model.listViewPreviousSnapshot)) {
                                () async {
                                  context.pushNamed(
                                    'responsePage',
                                    queryParameters: {
                                      'doc': serializeParam(
                                        listViewQrTransactionsRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'doc': listViewQrTransactionsRecord,
                                    },
                                  );

                                  safeSetState(() {});
                                }();
                              }
                              _model.listViewPreviousSnapshot = snapshot;
                            }),
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
                            List<QrTransactionsRecord>
                                listViewQrTransactionsRecordList =
                                snapshot.data!;
                            final listViewQrTransactionsRecord =
                                listViewQrTransactionsRecordList.isNotEmpty
                                    ? listViewQrTransactionsRecordList.first
                                    : null;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {},
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [],
                              ),
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
        ));
  }
}
