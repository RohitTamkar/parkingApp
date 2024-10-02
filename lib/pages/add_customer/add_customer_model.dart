import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_customer_widget.dart' show AddCustomerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCustomerModel extends FlutterFlowModel<AddCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  String? _textFieldNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k6d14gmo' /* Field is required */,
      );
    }

    if (!RegExp('[a-z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode;
  TextEditingController? textFieldMobileTextController;
  String? Function(BuildContext, String?)?
      textFieldMobileTextControllerValidator;
  String? _textFieldMobileTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lz2qbnhn' /* Field is required */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextFieldAltno widget.
  FocusNode? textFieldAltnoFocusNode;
  TextEditingController? textFieldAltnoTextController;
  String? Function(BuildContext, String?)?
      textFieldAltnoTextControllerValidator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for TextFieldRefName widget.
  FocusNode? textFieldRefNameFocusNode;
  TextEditingController? textFieldRefNameTextController;
  String? Function(BuildContext, String?)?
      textFieldRefNameTextControllerValidator;
  // State field(s) for TextFieldVehicleNo widget.
  FocusNode? textFieldVehicleNoFocusNode;
  TextEditingController? textFieldVehicleNoTextController;
  String? Function(BuildContext, String?)?
      textFieldVehicleNoTextControllerValidator;
  // State field(s) for TextFieldAdharNo widget.
  FocusNode? textFieldAdharNoFocusNode;
  TextEditingController? textFieldAdharNoTextController;
  String? Function(BuildContext, String?)?
      textFieldAdharNoTextControllerValidator;
  // State field(s) for TextFieldPanNo widget.
  FocusNode? textFieldPanNoFocusNode;
  TextEditingController? textFieldPanNoTextController;
  String? Function(BuildContext, String?)?
      textFieldPanNoTextControllerValidator;
  // State field(s) for TextFieldGstNo widget.
  FocusNode? textFieldGstNoFocusNode;
  TextEditingController? textFieldGstNoTextController;
  String? Function(BuildContext, String?)?
      textFieldGstNoTextControllerValidator;
  // State field(s) for DropDownProofOfID widget.
  String? dropDownProofOfIDValue;
  FormFieldController<String>? dropDownProofOfIDValueController;
  // State field(s) for TextFieldCreditLimit widget.
  FocusNode? textFieldCreditLimitFocusNode;
  TextEditingController? textFieldCreditLimitTextController;
  String? Function(BuildContext, String?)?
      textFieldCreditLimitTextControllerValidator;
  // State field(s) for TextFieldOldBal widget.
  FocusNode? textFieldOldBalFocusNode;
  TextEditingController? textFieldOldBalTextController;
  String? Function(BuildContext, String?)?
      textFieldOldBalTextControllerValidator;
  // State field(s) for CheckboxListTileCredit widget.
  bool? checkboxListTileCreditValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextFieldFirmName widget.
  FocusNode? textFieldFirmNameFocusNode;
  TextEditingController? textFieldFirmNameTextController;
  String? Function(BuildContext, String?)?
      textFieldFirmNameTextControllerValidator;
  // State field(s) for TextFieldExtraDetails widget.
  FocusNode? textFieldExtraDetailsFocusNode;
  TextEditingController? textFieldExtraDetailsTextController;
  String? Function(BuildContext, String?)?
      textFieldExtraDetailsTextControllerValidator;
  // State field(s) for DropDownGender widget.
  String? dropDownGenderValue;
  FormFieldController<String>? dropDownGenderValueController;
  // State field(s) for TextFieldFamilySize widget.
  FocusNode? textFieldFamilySizeFocusNode;
  TextEditingController? textFieldFamilySizeTextController;
  String? Function(BuildContext, String?)?
      textFieldFamilySizeTextControllerValidator;
  // State field(s) for TextFieldAddress widget.
  FocusNode? textFieldAddressFocusNode;
  TextEditingController? textFieldAddressTextController;
  String? Function(BuildContext, String?)?
      textFieldAddressTextControllerValidator;
  // State field(s) for TextFieldCity widget.
  FocusNode? textFieldCityFocusNode;
  TextEditingController? textFieldCityTextController;
  String? Function(BuildContext, String?)? textFieldCityTextControllerValidator;
  // State field(s) for TextFieldPostalAdd widget.
  FocusNode? textFieldPostalAddFocusNode;
  TextEditingController? textFieldPostalAddTextController;
  String? Function(BuildContext, String?)?
      textFieldPostalAddTextControllerValidator;
  // State field(s) for TextFieldFIrstVisit widget.
  FocusNode? textFieldFIrstVisitFocusNode;
  TextEditingController? textFieldFIrstVisitTextController;
  String? Function(BuildContext, String?)?
      textFieldFIrstVisitTextControllerValidator;
  // State field(s) for TextFieldLastVisit widget.
  FocusNode? textFieldLastVisitFocusNode;
  TextEditingController? textFieldLastVisitTextController;
  String? Function(BuildContext, String?)?
      textFieldLastVisitTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PartyRecord? custDoc;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
    textFieldMobileTextControllerValidator =
        _textFieldMobileTextControllerValidator;
  }

  @override
  void dispose() {
    headerModel.dispose();
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileTextController?.dispose();

    textFieldAltnoFocusNode?.dispose();
    textFieldAltnoTextController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldRefNameFocusNode?.dispose();
    textFieldRefNameTextController?.dispose();

    textFieldVehicleNoFocusNode?.dispose();
    textFieldVehicleNoTextController?.dispose();

    textFieldAdharNoFocusNode?.dispose();
    textFieldAdharNoTextController?.dispose();

    textFieldPanNoFocusNode?.dispose();
    textFieldPanNoTextController?.dispose();

    textFieldGstNoFocusNode?.dispose();
    textFieldGstNoTextController?.dispose();

    textFieldCreditLimitFocusNode?.dispose();
    textFieldCreditLimitTextController?.dispose();

    textFieldOldBalFocusNode?.dispose();
    textFieldOldBalTextController?.dispose();

    textFieldFirmNameFocusNode?.dispose();
    textFieldFirmNameTextController?.dispose();

    textFieldExtraDetailsFocusNode?.dispose();
    textFieldExtraDetailsTextController?.dispose();

    textFieldFamilySizeFocusNode?.dispose();
    textFieldFamilySizeTextController?.dispose();

    textFieldAddressFocusNode?.dispose();
    textFieldAddressTextController?.dispose();

    textFieldCityFocusNode?.dispose();
    textFieldCityTextController?.dispose();

    textFieldPostalAddFocusNode?.dispose();
    textFieldPostalAddTextController?.dispose();

    textFieldFIrstVisitFocusNode?.dispose();
    textFieldFIrstVisitTextController?.dispose();

    textFieldLastVisitFocusNode?.dispose();
    textFieldLastVisitTextController?.dispose();
  }
}
