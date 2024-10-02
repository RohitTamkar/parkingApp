import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grocery_model.dart';
export 'grocery_model.dart';

class GroceryWidget extends StatefulWidget {
  const GroceryWidget({
    super.key,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.unitList,
    this.jsonitem,
  });

  final ProductStructStruct? parameter2;
  final List<TaxMasterRecord>? parameter3;
  final bool? parameter4;
  final List<UnitTypeRecord>? unitList;
  final dynamic jsonitem;

  @override
  State<GroceryWidget> createState() => _GroceryWidgetState();
}

class _GroceryWidgetState extends State<GroceryWidget> {
  late GroceryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroceryModel());

    _model.textFieldqtTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.quantity''',
    ).toString().toString());
    _model.textFieldqtFocusNode ??= FocusNode();

    _model.textFieldrateTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.price''',
    ).toString().toString());
    _model.textFieldrateFocusNode ??= FocusNode();

    _model.textFielddisPerTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.disPer''',
    ).toString().toString());
    _model.textFielddisPerFocusNode ??= FocusNode();

    _model.textFielddisAmtTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.disAmt''',
    ).toString().toString());
    _model.textFielddisAmtFocusNode ??= FocusNode();

    _model.textFieldtaxPerTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.taxPer''',
    ).toString().toString());
    _model.textFieldtaxPerFocusNode ??= FocusNode();

    _model.textFieldTaxAmtTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.taxAmt''',
    ).toString().toString());
    _model.textFieldTaxAmtFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 3.0, 0.0, 3.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        getJsonField(
                          widget!.jsonitem,
                          r'''$.srno''',
                        ).toString(),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'az2ckbjv' /* 1 */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 15,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        getJsonField(
                          widget!.jsonitem,
                          r'''$.name''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              color: Color(0xFF446AFE),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 25.0,
                      fillColor: FlutterFlowTheme.of(context).alternate,
                      icon: Icon(
                        Icons.remove,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 10.0,
                      ),
                      onPressed: () async {
                        if (_model.textFieldqtTextController.text != '1') {
                          safeSetState(() {
                            _model.textFieldqtTextController
                                ?.text = (double.parse(
                                        _model.textFieldqtTextController.text) -
                                    1)
                                .toString();
                            _model.textFieldqtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model.textFieldqtTextController!
                                        .text.length);
                          });
                          _model.allbillistplusCopy =
                              await actions.addToHoldListGrCalculationqty(
                            widget!.parameter2!,
                            FFAppState().selBill,
                            widget!.parameter3!.toList(),
                            functions.enabletaxinclusive(widget!.parameter4!),
                            widget!.unitList!.toList(),
                            int.parse(
                                _model.textFielddisPerTextController.text),
                            double.parse(
                                _model.textFielddisAmtTextController.text),
                            double.parse(
                                _model.textFieldrateTextController.text),
                            double.parse(_model.textFieldqtTextController.text),
                            int.parse(
                                _model.textFieldtaxPerTextController.text),
                            double.parse(
                                _model.textFieldTaxAmtTextController.text),
                          );
                          safeSetState(() {
                            _model.textFielddisAmtTextController?.text =
                                getJsonField(
                              _model.allbillistplusCopy!
                                  .where((e) =>
                                      getJsonField(
                                        e,
                                        r'''$.id''',
                                      ) ==
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .first,
                              r'''$.disAmt''',
                            ).toString();
                            _model.textFielddisAmtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFielddisAmtTextController!
                                        .text
                                        .length);
                          });
                          safeSetState(() {
                            _model.textFieldTaxAmtTextController?.text =
                                getJsonField(
                              _model.allbillistplusCopy!
                                  .where((e) =>
                                      getJsonField(
                                        e,
                                        r'''$.id''',
                                      ) ==
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .first,
                              r'''$.taxAmt''',
                            ).toString();
                            _model.textFieldTaxAmtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFieldTaxAmtTextController!
                                        .text
                                        .length);
                          });
                          _model.output1Copy =
                              await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                          );
                          _model.reuslt121Copy =
                              await actions.calBillAmtGrocery(
                            valueOrDefault<double>(
                              FFAppState().disAmt,
                              0.0,
                            ),
                            FFAppState().delCharges,
                          );
                          FFAppState().finalAmt = FFAppState().finalAmt;
                          FFAppState().update(() {});
                        } else {
                          safeSetState(() {
                            _model.textFieldqtTextController?.text = '1';
                            _model.textFieldqtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model.textFieldqtTextController!
                                        .text.length);
                          });
                        }

                        safeSetState(() {});
                      },
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _model.textFieldqtTextController,
                        focusNode: _model.textFieldqtFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.allbillist =
                              await actions.addToHoldListGrCalculationqty(
                            widget!.parameter2!,
                            FFAppState().selBill,
                            widget!.parameter3!.toList(),
                            functions.enabletaxinclusive(widget!.parameter4!),
                            widget!.unitList!.toList(),
                            int.parse(
                                _model.textFielddisPerTextController.text),
                            double.parse(
                                _model.textFielddisAmtTextController.text),
                            double.parse(
                                _model.textFieldrateTextController.text),
                            double.parse(_model.textFieldqtTextController.text),
                            int.parse(
                                _model.textFieldtaxPerTextController.text),
                            double.parse(
                                _model.textFieldTaxAmtTextController.text),
                          );
                          safeSetState(() {
                            _model.textFielddisAmtTextController?.text =
                                getJsonField(
                              _model.allbillist!
                                  .where((e) =>
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.id''',
                                      ) ==
                                      getJsonField(
                                        e,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .first,
                              r'''$.disAmt''',
                            ).toString();
                            _model.textFielddisAmtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFielddisAmtTextController!
                                        .text
                                        .length);
                          });
                          safeSetState(() {
                            _model.textFieldTaxAmtTextController?.text =
                                getJsonField(
                              _model.allbillist!
                                  .where((e) =>
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.id''',
                                      ) ==
                                      getJsonField(
                                        e,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .first,
                              r'''$.taxAmt''',
                            ).toString();
                            _model.textFieldTaxAmtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFieldTaxAmtTextController!
                                        .text
                                        .length);
                          });
                          _model.output = await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                          );
                          _model.reuslt12 = await actions.calBillAmtGrocery(
                            valueOrDefault<double>(
                              FFAppState().disAmt,
                              0.0,
                            ),
                            FFAppState().delCharges,
                          );

                          safeSetState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).customColor2,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).info,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF5F6FB),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                        textAlign: TextAlign.center,
                        validator: _model.textFieldqtTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 25.0,
                      fillColor: FlutterFlowTheme.of(context).alternate,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 10.0,
                      ),
                      onPressed: () async {
                        safeSetState(() {
                          _model
                              .textFieldqtTextController?.text = (double.parse(
                                      _model.textFieldqtTextController.text) +
                                  1)
                              .toString();
                          _model.textFieldqtTextController?.selection =
                              TextSelection.collapsed(
                                  offset: _model
                                      .textFieldqtTextController!.text.length);
                        });
                        _model.all =
                            await actions.addToHoldListGrCalculationqty(
                          widget!.parameter2!,
                          FFAppState().selBill,
                          widget!.parameter3!.toList(),
                          functions.enabletaxinclusive(widget!.parameter4!),
                          widget!.unitList!.toList(),
                          int.parse(_model.textFielddisPerTextController.text),
                          double.parse(
                              _model.textFielddisAmtTextController.text),
                          double.parse(_model.textFieldrateTextController.text),
                          double.parse(_model.textFieldqtTextController.text),
                          int.parse(_model.textFieldtaxPerTextController.text),
                          double.parse(
                              _model.textFieldTaxAmtTextController.text),
                        );
                        safeSetState(() {
                          _model.textFielddisAmtTextController?.text =
                              getJsonField(
                            _model.all!
                                .where((e) =>
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.id''',
                                    ) ==
                                    getJsonField(
                                      e,
                                      r'''$.id''',
                                    ))
                                .toList()
                                .first,
                            r'''$.disAmt''',
                          ).toString();
                          _model.textFielddisAmtTextController?.selection =
                              TextSelection.collapsed(
                                  offset: _model.textFielddisAmtTextController!
                                      .text.length);
                        });
                        safeSetState(() {
                          _model.textFieldTaxAmtTextController?.text =
                              getJsonField(
                            _model.all!
                                .where((e) =>
                                    getJsonField(
                                      widget!.jsonitem,
                                      r'''$.id''',
                                    ) ==
                                    getJsonField(
                                      e,
                                      r'''$.id''',
                                    ))
                                .toList()
                                .first,
                            r'''$.taxAmt''',
                          ).toString();
                          _model.textFieldTaxAmtTextController?.selection =
                              TextSelection.collapsed(
                                  offset: _model.textFieldTaxAmtTextController!
                                      .text.length);
                        });
                        _model.output1 = await actions.calSubTotalForGrocery(
                          FFAppState().selBill.toString(),
                          FFAppState().allBillsList.toList(),
                        );
                        _model.reuslt121 = await actions.calBillAmtGrocery(
                          valueOrDefault<double>(
                            FFAppState().disAmt,
                            0.0,
                          ),
                          FFAppState().delCharges,
                        );
                        FFAppState().finalAmt = FFAppState().finalAmt;
                        FFAppState().update(() {});

                        safeSetState(() {});
                      },
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        getJsonField(
                          widget!.jsonitem,
                          r'''$.unit''',
                        ).toString(),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textFieldrateTextController,
                        focusNode: _model.textFieldrateFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.ratechanged =
                              await actions.ratePriceChangedFunctiongrocery(
                            widget!.parameter2!,
                            FFAppState().selBill,
                            widget!.parameter3!.toList(),
                            functions.enabletaxinclusive(widget!.parameter4!),
                            widget!.unitList!.toList(),
                            int.parse(
                                _model.textFielddisPerTextController.text),
                            double.parse(
                                _model.textFielddisAmtTextController.text),
                            double.parse(
                                _model.textFieldrateTextController.text),
                            double.parse(_model.textFieldqtTextController.text),
                            int.parse(
                                _model.textFieldtaxPerTextController.text),
                            double.parse(
                                _model.textFieldTaxAmtTextController.text),
                          );
                          safeSetState(() {
                            _model.textFieldTaxAmtTextController?.text =
                                valueOrDefault<String>(
                              getJsonField(
                                _model.ratechanged
                                    ?.where((e) =>
                                        getJsonField(
                                          e,
                                          r'''$.id''',
                                        ) ==
                                        getJsonField(
                                          widget!.jsonitem,
                                          r'''$.id''',
                                        ))
                                    .toList()
                                    ?.first,
                                r'''$.taxAmt''',
                              )?.toString(),
                              '0',
                            );
                            _model.textFieldTaxAmtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFieldTaxAmtTextController!
                                        .text
                                        .length);
                          });
                          safeSetState(() {
                            _model.textFielddisAmtTextController?.text =
                                valueOrDefault<String>(
                              getJsonField(
                                _model.ratechanged
                                    ?.where((e) =>
                                        getJsonField(
                                          e,
                                          r'''$.id''',
                                        ) ==
                                        getJsonField(
                                          widget!.jsonitem,
                                          r'''$.id''',
                                        ))
                                    .toList()
                                    ?.first,
                                r'''$.disAmt''',
                              )?.toString(),
                              '0',
                            );
                            _model.textFielddisAmtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFielddisAmtTextController!
                                        .text
                                        .length);
                          });
                          _model.outputr2 = await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                          );
                          _model.reuslt122 = await actions.calBillAmtGrocery(
                            valueOrDefault<double>(
                              FFAppState().disAmt,
                              0.0,
                            ),
                            FFAppState().delCharges,
                          );

                          safeSetState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).customColor2,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).info,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF5F6FB),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                        textAlign: TextAlign.center,
                        validator: _model.textFieldrateTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        getJsonField(
                          widget!.jsonitem,
                          r'''$.mrpPrice''',
                        ).toString(),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textFielddisPerTextController,
                        focusNode: _model.textFielddisPerFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.itemlist =
                              await actions.addToHoldListGrCalculationdisPer(
                            widget!.parameter2!,
                            FFAppState().selBill,
                            widget!.parameter3!.toList(),
                            functions.enabletaxinclusive(widget!.parameter4!),
                            widget!.unitList!.toList(),
                            int.parse(
                                _model.textFielddisPerTextController.text),
                            double.parse(
                                _model.textFielddisAmtTextController.text),
                            double.parse(
                                _model.textFieldrateTextController.text),
                            double.parse(_model.textFieldqtTextController.text),
                            int.parse(
                                _model.textFieldtaxPerTextController.text),
                            double.parse(
                                _model.textFieldTaxAmtTextController.text),
                          );
                          safeSetState(() {
                            _model.textFielddisAmtTextController?.text =
                                getJsonField(
                              _model.itemlist!
                                  .where((e) =>
                                      getJsonField(
                                        e,
                                        r'''$.id''',
                                      ) ==
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .first,
                              r'''$.disAmt''',
                            ).toString();
                            _model.textFielddisAmtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFielddisAmtTextController!
                                        .text
                                        .length);
                          });
                          _model.outputdisper =
                              await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                          );
                          _model.reuslt12ss = await actions.calBillAmtGrocery(
                            valueOrDefault<double>(
                              FFAppState().disAmt,
                              0.0,
                            ),
                            FFAppState().delCharges,
                          );

                          safeSetState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).customColor2,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).info,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF5F6FB),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                        textAlign: TextAlign.center,
                        validator: _model.textFielddisPerTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textFielddisAmtTextController,
                        focusNode: _model.textFielddisAmtFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.allbillistdiscper =
                              await actions.disAmtChangedFunctiongrocery(
                            widget!.parameter2!,
                            FFAppState().selBill,
                            widget!.parameter3!.toList(),
                            functions.enabletaxinclusive(widget!.parameter4!),
                            widget!.unitList!.toList(),
                            int.parse(
                                _model.textFielddisPerTextController.text),
                            double.parse(
                                _model.textFielddisAmtTextController.text),
                            double.parse(
                                _model.textFieldrateTextController.text),
                            double.parse(_model.textFieldqtTextController.text),
                            int.parse(
                                _model.textFieldtaxPerTextController.text),
                            double.parse(
                                _model.textFieldTaxAmtTextController.text),
                          );
                          safeSetState(() {
                            _model.textFielddisPerTextController?.text =
                                getJsonField(
                              _model.allbillistdiscper!
                                  .where((e) =>
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.id''',
                                      ) ==
                                      getJsonField(
                                        e,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .first,
                              r'''$.disPer''',
                            ).toString();
                            _model.textFielddisPerTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFielddisPerTextController!
                                        .text
                                        .length);
                          });
                          _model.output5 = await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                          );
                          _model.reuslt1245 = await actions.calBillAmtGrocery(
                            valueOrDefault<double>(
                              FFAppState().disAmt,
                              0.0,
                            ),
                            FFAppState().delCharges,
                          );

                          safeSetState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).customColor2,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).info,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF5F6FB),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                        textAlign: TextAlign.center,
                        validator: _model.textFielddisAmtTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textFieldtaxPerTextController,
                        focusNode: _model.textFieldtaxPerFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.taxperchenged =
                              await actions.taxPerChangedFunctiongrocery(
                            widget!.parameter2!,
                            FFAppState().selBill,
                            widget!.parameter3!.toList(),
                            functions.enabletaxinclusive(widget!.parameter4!),
                            widget!.unitList!.toList(),
                            int.parse(
                                _model.textFielddisPerTextController.text),
                            double.parse(
                                _model.textFielddisAmtTextController.text),
                            double.parse(
                                _model.textFieldrateTextController.text),
                            double.parse(_model.textFieldqtTextController.text),
                            int.parse(
                                _model.textFieldtaxPerTextController.text),
                            double.parse(
                                _model.textFieldTaxAmtTextController.text),
                          );
                          safeSetState(() {
                            _model.textFieldTaxAmtTextController?.text =
                                getJsonField(
                              _model.taxperchenged!
                                  .where((e) =>
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.id''',
                                      ) ==
                                      getJsonField(
                                        e,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .first,
                              r'''$.taxAmt''',
                            ).toString();
                            _model.textFieldTaxAmtTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFieldTaxAmtTextController!
                                        .text
                                        .length);
                          });
                          _model.output2 = await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                          );
                          _model.reuslt12m = await actions.calBillAmtGrocery(
                            valueOrDefault<double>(
                              FFAppState().disAmt,
                              0.0,
                            ),
                            FFAppState().delCharges,
                          );

                          safeSetState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).customColor2,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).info,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF5F6FB),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                        textAlign: TextAlign.center,
                        validator: _model.textFieldtaxPerTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textFieldTaxAmtTextController,
                        focusNode: _model.textFieldTaxAmtFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.taxamtchanged =
                              await actions.taxAmtChangedFunctiongrocery(
                            widget!.parameter2!,
                            FFAppState().selBill,
                            widget!.parameter3!.toList(),
                            functions.enabletaxinclusive(widget!.parameter4!),
                            widget!.unitList!.toList(),
                            int.parse(
                                _model.textFielddisPerTextController.text),
                            double.parse(
                                _model.textFielddisAmtTextController.text),
                            double.parse(
                                _model.textFieldrateTextController.text),
                            double.parse(_model.textFieldqtTextController.text),
                            int.parse(
                                _model.textFieldtaxPerTextController.text),
                            double.parse(
                                _model.textFieldTaxAmtTextController.text),
                          );
                          safeSetState(() {
                            _model.textFieldtaxPerTextController?.text =
                                getJsonField(
                              _model.taxamtchanged!
                                  .where((e) =>
                                      getJsonField(
                                        widget!.jsonitem,
                                        r'''$.id''',
                                      ) ==
                                      getJsonField(
                                        e,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .first,
                              r'''$.taxPer''',
                            ).toString();
                            _model.textFieldtaxPerTextController?.selection =
                                TextSelection.collapsed(
                                    offset: _model
                                        .textFieldtaxPerTextController!
                                        .text
                                        .length);
                          });
                          _model.output3 = await actions.calSubTotalForGrocery(
                            FFAppState().selBill.toString(),
                            FFAppState().allBillsList.toList(),
                          );
                          _model.reuslt12g = await actions.calBillAmtGrocery(
                            valueOrDefault<double>(
                              FFAppState().disAmt,
                              0.0,
                            ),
                            FFAppState().delCharges,
                          );

                          safeSetState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).customColor2,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).info,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF5F6FB),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                        textAlign: TextAlign.center,
                        validator: _model.textFieldTaxAmtTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        getJsonField(
                          widget!.jsonitem,
                          r'''$.total''',
                        ).toString(),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        width: 20.0,
                        thickness: 0.5,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
