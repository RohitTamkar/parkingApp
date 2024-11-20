import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_user_model.dart';
export 'add_user_model.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({super.key});

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  late AddUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddUserModel());

    _model.textFieldNameTextController ??= TextEditingController();
    _model.textFieldNameFocusNode ??= FocusNode();

    _model.textFieldMobileTextController ??= TextEditingController();
    _model.textFieldMobileFocusNode ??= FocusNode();

    _model.emailTextFieldTextController ??= TextEditingController();
    _model.emailTextFieldFocusNode ??= FocusNode();

    _model.pwdlTextFieldTextController ??= TextEditingController();
    _model.pwdlTextFieldFocusNode ??= FocusNode();

    _model.confirmpwdlTextFieldTextController ??= TextEditingController();
    _model.confirmpwdlTextFieldFocusNode ??= FocusNode();

    _model.pinnTextFieldTextController ??= TextEditingController();
    _model.pinnTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'AddUser',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).parkingPrimary,
              body: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).parkingPrimary,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 45.0,
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                              'UserAccount',
                                              queryParameters: {
                                                'mobile': serializeParam(
                                                  '',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                        AutoSizeText(
                                          FFLocalizations.of(context).getText(
                                            '9xi0hr6k' /* Add User  */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineMediumFamily),
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 45.0,
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: FlutterFlowTheme.of(context)
                                                .parkingPrimary,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 24,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldNameTextController,
                                      focusNode: _model.textFieldNameFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textFieldNameTextController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'eqv0re49' /* User Name */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      validator: _model
                                          .textFieldNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldMobileTextController,
                                      focusNode:
                                          _model.textFieldMobileFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textFieldMobileTextController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'pjj3ktjb' /* Mob. No. */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      keyboardType: TextInputType.phone,
                                      validator: _model
                                          .textFieldMobileTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: TextFormField(
                                      controller:
                                          _model.emailTextFieldTextController,
                                      focusNode: _model.emailTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.emailTextFieldTextController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'p26lrubm' /* Email ID */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .emailTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: TextFormField(
                                      controller:
                                          _model.pwdlTextFieldTextController,
                                      focusNode: _model.pwdlTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.pwdlTextFieldTextController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText:
                                          !_model.pwdlTextFieldVisibility,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          's29qt4ma' /* Password */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => safeSetState(
                                            () => _model
                                                    .pwdlTextFieldVisibility =
                                                !_model.pwdlTextFieldVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.pwdlTextFieldVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      validator: _model
                                          .pwdlTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: TextFormField(
                                      controller: _model
                                          .confirmpwdlTextFieldTextController,
                                      focusNode:
                                          _model.confirmpwdlTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.confirmpwdlTextFieldTextController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: !_model
                                          .confirmpwdlTextFieldVisibility,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'ytnqz4ig' /* Password */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => safeSetState(
                                            () => _model
                                                    .confirmpwdlTextFieldVisibility =
                                                !_model
                                                    .confirmpwdlTextFieldVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.confirmpwdlTextFieldVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      validator: _model
                                          .confirmpwdlTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: TextFormField(
                                      controller:
                                          _model.pinnTextFieldTextController,
                                      focusNode: _model.pinnTextFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.pinnTextFieldTextController',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText:
                                          !_model.pinnTextFieldVisibility,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'bzsauvvr' /* Quick PIN */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => safeSetState(
                                            () => _model
                                                    .pinnTextFieldVisibility =
                                                !_model.pinnTextFieldVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.pinnTextFieldVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .pinnTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: StreamBuilder<List<OutletRecord>>(
                                      stream: queryOutletRecord(
                                        queryBuilder: (outletRecord) =>
                                            outletRecord.where(
                                          'id',
                                          isEqualTo: FFAppState().outletId,
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: SpinKitFadingCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OutletRecord>
                                            buttonOutletRecordList =
                                            snapshot.data!;
                                        final buttonOutletRecord =
                                            buttonOutletRecordList.isNotEmpty
                                                ? buttonOutletRecordList.first
                                                : null;

                                        return FFButtonWidget(
                                          onPressed: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            if (_model
                                                    .pwdlTextFieldTextController
                                                    .text !=
                                                _model
                                                    .confirmpwdlTextFieldTextController
                                                    .text) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Passwords don\'t match!',
                                                  ),
                                                ),
                                              );
                                              return;
                                            }

                                            final user = await authManager
                                                .createAccountWithEmail(
                                              context,
                                              _model
                                                  .emailTextFieldTextController
                                                  .text,
                                              _model.pwdlTextFieldTextController
                                                  .text,
                                            );
                                            if (user == null) {
                                              return;
                                            }

                                            await UserProfileRecord.collection
                                                .doc(user.uid)
                                                .update({
                                              ...createUserProfileRecordData(
                                                name: functions.toCapitalLetter(
                                                    _model
                                                        .textFieldNameTextController
                                                        .text),
                                                mobile:
                                                    '+91${_model.textFieldMobileTextController.text}',
                                                quickPin: _model
                                                    .pinnTextFieldTextController
                                                    .text,
                                                role: 'user',
                                                outletId: buttonOutletRecord
                                                    ?.reference.id,
                                                email: _model
                                                    .emailTextFieldTextController
                                                    .text,
                                                isDeleted: false,
                                                password: _model
                                                    .confirmpwdlTextFieldTextController
                                                    .text,
                                                createdDate:
                                                    functions.getcreatedDate(),
                                                renewalDate: functions
                                                    .setRenewalDateInMili(
                                                        getCurrentTimestamp),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'outlets': [
                                                    buttonOutletRecord
                                                        ?.reference.id
                                                  ],
                                                },
                                              ),
                                            });

                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('User Profile'),
                                                  content:
                                                      Text('Added Successfuly'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );

                                            context.pushNamedAuth(
                                              'UserAccount',
                                              context.mounted,
                                              queryParameters: {
                                                'mobile': serializeParam(
                                                  '+91${_model.textFieldMobileTextController.text}',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );

                                            safeSetState(() {
                                              _model.textFieldNameTextController
                                                  ?.clear();
                                              _model
                                                  .textFieldMobileTextController
                                                  ?.clear();
                                              _model
                                                  .emailTextFieldTextController
                                                  ?.clear();
                                              _model.pinnTextFieldTextController
                                                  ?.clear();
                                            });
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'fa2u2q6g' /* Save & Next */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .parkingSecondaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily),
                                                ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
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
        ));
  }
}
