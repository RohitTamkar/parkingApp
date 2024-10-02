import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grocery_header_model.dart';
export 'grocery_header_model.dart';

class GroceryHeaderWidget extends StatefulWidget {
  const GroceryHeaderWidget({super.key});

  @override
  State<GroceryHeaderWidget> createState() => _GroceryHeaderWidgetState();
}

class _GroceryHeaderWidgetState extends State<GroceryHeaderWidget> {
  late GroceryHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroceryHeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).customColor2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                '9uyrkgzp' /* Masters */,
              ),
              icon: Icon(
                Icons.content_paste,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'r94pmace' /* Purchase */,
              ),
              icon: Icon(
                Icons.shopping_cart,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'qbrchsco' /* Sales */,
              ),
              icon: Icon(
                Icons.receipt_long_sharp,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'qspbgtxi' /* Reports */,
              ),
              icon: Icon(
                Icons.bar_chart,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'jeup6rze' /* Shift */,
              ),
              icon: Icon(
                Icons.lock_clock,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'u7ti7eko' /* Print Settings */,
              ),
              icon: Icon(
                Icons.print_rounded,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'h6cu660m' /* Settings */,
              ),
              icon: Icon(
                Icons.settings_sharp,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'ptjuu1rn' /* Edit Bill */,
              ),
              icon: Icon(
                Icons.edit_square,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: FFLocalizations.of(context).getText(
                'h66bkli9' /* Logout */,
              ),
              icon: Icon(
                Icons.power_settings_new,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
        ].divide(SizedBox(width: 2.0)),
      ),
    );
  }
}
