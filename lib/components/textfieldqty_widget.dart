import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'textfieldqty_model.dart';
export 'textfieldqty_model.dart';

class TextfieldqtyWidget extends StatefulWidget {
  const TextfieldqtyWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final dynamic parameter1;
  final ProductStructStruct? parameter2;
  final List<TaxMasterRecord>? parameter3;
  final bool? parameter4;

  @override
  State<TextfieldqtyWidget> createState() => _TextfieldqtyWidgetState();
}

class _TextfieldqtyWidgetState extends State<TextfieldqtyWidget> {
  late TextfieldqtyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextfieldqtyModel());

    _model.textController ??=
        TextEditingController(text: widget!.parameter1?.toString());
    _model.textFieldFocusNode ??= FocusNode();

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onFieldSubmitted: (_) async {
                _model.resultplus = await actions.addToHoldListprdplus(
                  widget!.parameter2!,
                  FFAppState().selBill,
                  widget!.parameter3!.toList(),
                  functions.enabletaxinclusive(widget!.parameter4!),
                );
                _model.res13 = await actions.calSubTotalForHoldList(
                  FFAppState().selBill.toString(),
                  FFAppState().resultList.toList(),
                );
                _model.reuslt12 = await actions.calBillAmt(
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
                labelStyle: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelSmallFamily),
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelMediumFamily),
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              validator: _model.textControllerValidator.asValidator(context),
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
    );
  }
}
