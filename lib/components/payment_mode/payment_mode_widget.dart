import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_mode_model.dart';
export 'payment_mode_model.dart';

class PaymentModeWidget extends StatefulWidget {
  const PaymentModeWidget({super.key});

  @override
  State<PaymentModeWidget> createState() => _PaymentModeWidgetState();
}

class _PaymentModeWidgetState extends State<PaymentModeWidget> {
  late PaymentModeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PaymentModeRecord>>(
      stream: queryPaymentModeRecord(),
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
        List<PaymentModeRecord> dropDownPaymentModeRecordList = snapshot.data!;

        return FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(
            _model.dropDownValue ??= FFLocalizations.of(context).getText(
              'y2uv7xor' /* CASH */,
            ),
          ),
          options: [
            FFLocalizations.of(context).getText(
              'snikl2jw' /* CASH */,
            ),
            FFLocalizations.of(context).getText(
              'vb1guzii' /* COMPLEMENTARY */,
            ),
            FFLocalizations.of(context).getText(
              'wy5nxsum' /* CREDIT */,
            ),
            FFLocalizations.of(context).getText(
              '25knlurq' /* GOOGLEPAY */,
            ),
            FFLocalizations.of(context).getText(
              'frif7scg' /* PAYTM */,
            ),
            FFLocalizations.of(context).getText(
              '77fnzh9p' /* PHONEPE */,
            ),
            FFLocalizations.of(context).getText(
              'wfe4m0ja' /* CHEQUE */,
            ),
            FFLocalizations.of(context).getText(
              'v3x82lma' /* OTHER */,
            ),
            FFLocalizations.of(context).getText(
              '926j8pzf' /* CARD */,
            ),
            FFLocalizations.of(context).getText(
              'r0ivc463' /* UPI QR */,
            )
          ],
          onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
          textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
              ),
          hintText: FFLocalizations.of(context).getText(
            'itmkmxu3' /* Payment Mode */,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20.0,
          ),
          fillColor: FlutterFlowTheme.of(context).customColor2,
          elevation: 2.0,
          borderColor: Colors.transparent,
          borderWidth: 0.0,
          borderRadius: 8.0,
          margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
          hidesUnderline: true,
          isOverButton: true,
          isSearchable: false,
          isMultiSelect: false,
        );
      },
    );
  }
}
