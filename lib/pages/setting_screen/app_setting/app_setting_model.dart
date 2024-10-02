import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/components/reset_bill/reset_bill_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'app_setting_widget.dart' show AppSettingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppSettingModel extends FlutterFlowModel<AppSettingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for SwitchListTileenablePaymentMenu widget.
  bool? switchListTileenablePaymentMenuValue;
  // State field(s) for SwitchListTilegoodsReceiveMenu widget.
  bool? switchListTilegoodsReceiveMenuValue;
  // State field(s) for SwitchListTilestockOutMenu widget.
  bool? switchListTilestockOutMenuValue;
  // State field(s) for SwitchListTileEnableBarodeMenu widget.
  bool? switchListTileEnableBarodeMenuValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for SwitchListTileenableOpeningBalance widget.
  bool? switchListTileenableOpeningBalanceValue;
  // State field(s) for SwitchListTileflottingKeyboardButton widget.
  bool? switchListTileflottingKeyboardButtonValue;
  // State field(s) for SwitchListTileshowOpeningAmount widget.
  bool? switchListTileshowOpeningAmountValue;
  // State field(s) for SwitchListTiledisableSaveButton widget.
  bool? switchListTiledisableSaveButtonValue;
  // State field(s) for SwitchListTileshowHoldListBtn widget.
  bool? switchListTileshowHoldListBtnValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for SwitchListTilecustomerDetails widget.
  bool? switchListTilecustomerDetailsValue;
  // State field(s) for SwitchListTilecustomerAdv widget.
  bool? switchListTilecustomerAdvValue;
  // State field(s) for SwitchListTilecustometForcefullyBill widget.
  bool? switchListTilecustometForcefullyBillValue;
  // State field(s) for SwitchListTileaddVehicleNo widget.
  bool? switchListTileaddVehicleNoValue;
  // State field(s) for SwitchListTileloyaltyPoint widget.
  bool? switchListTileloyaltyPointValue;
  // State field(s) for SwitchListTilesendbillSms widget.
  bool? switchListTilesendbillSmsValue;
  // State field(s) for SwitchListTilestockRequestOutletWise widget.
  bool? switchListTilestockRequestOutletWiseValue;
  // State field(s) for SwitchListTilestockRequestAccept widget.
  bool? switchListTilestockRequestAcceptValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for SwitchListTileSearchonlyWithBarcode widget.
  bool? switchListTileSearchonlyWithBarcodeValue;
  // State field(s) for SwitchListTileregionalLanguage widget.
  bool? switchListTileregionalLanguageValue;
  // State field(s) for SwitchListTilecalculateReverseQty widget.
  bool? switchListTilecalculateReverseQtyValue;
  // State field(s) for SwitchListTilesortingInHotKey widget.
  bool? switchListTilesortingInHotKeyValue;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for SwitchListTileopenSoftKeyword widget.
  bool? switchListTileopenSoftKeywordValue;
  // State field(s) for SwitchListTileprintBtnAfterPay widget.
  bool? switchListTileprintBtnAfterPayValue;
  // State field(s) for SwitchListTileenableUpiBtn widget.
  bool? switchListTileenableUpiBtnValue;
  // State field(s) for SwitchListTilethreeChar widget.
  bool? switchListTilethreeCharValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for SwitchListTileincluOrReverseTax widget.
  bool? switchListTileincluOrReverseTaxValue;
  // State field(s) for SwitchListTileSaleWithTax widget.
  bool? switchListTileSaleWithTaxValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for SwitchListTileenableTable widget.
  bool? switchListTileenableTableValue;
  // State field(s) for SwitchListTileCaptonDetailAtBillCreation widget.
  bool? switchListTileCaptonDetailAtBillCreationValue;
  // State field(s) for SwitchListTileenabletableForcefully widget.
  bool? switchListTileenabletableForcefullyValue;
  // State field(s) for SwitchListTileCaptonReqest widget.
  bool? switchListTileCaptonReqestValue;
  // State field(s) for SwitchListTilewLanCommunication widget.
  bool? switchListTilewLanCommunicationValue;
  // State field(s) for SwitchListTilecheckInOut widget.
  bool? switchListTilecheckInOutValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // State field(s) for SwitchListTileenableSman widget.
  bool? switchListTileenableSmanValue;
  // State field(s) for SwitchListTilesalesmanForcefully widget.
  bool? switchListTilesalesmanForcefullyValue;
  // State field(s) for SwitchListTilesalesmanProductWise widget.
  bool? switchListTilesalesmanProductWiseValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController8;

  // State field(s) for SwitchListTilecouponSaveBill widget.
  bool? switchListTilecouponSaveBillValue;
  // State field(s) for SwitchListTilecouponPrintBill widget.
  bool? switchListTilecouponPrintBillValue;
  // State field(s) for SwitchListTilecouponOrKotHeader widget.
  bool? switchListTilecouponOrKotHeaderValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController9;

  // State field(s) for SwitchListTilekotRePrint widget.
  bool? switchListTilekotRePrintValue;
  // State field(s) for SwitchListTilekotPrintAmountColumn widget.
  bool? switchListTilekotPrintAmountColumnValue;
  // State field(s) for SwitchListTilekotRemark widget.
  bool? switchListTilekotRemarkValue;
  // State field(s) for SwitchListTiledisableSaveKot widget.
  bool? switchListTiledisableSaveKotValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController10;

  // State field(s) for SwitchListTilerfidMasterRead widget.
  bool? switchListTilerfidMasterReadValue;
  // State field(s) for SwitchListTilerfidmasterWrt widget.
  bool? switchListTilerfidmasterWrtValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController11;

  // State field(s) for SwitchListTileshowProductImg widget.
  bool? switchListTileshowProductImgValue;
  // State field(s) for SwitchListTilehideProductSearchCode widget.
  bool? switchListTilehideProductSearchCodeValue;
  // State field(s) for SwitchListTileproductListTypeEnable widget.
  bool? switchListTileproductListTypeEnableValue;
  // State field(s) for SwitchListTileproductSuggREport widget.
  bool? switchListTileproductSuggREportValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController12;

  // State field(s) for SwitchListTileestBillSettlement widget.
  bool? switchListTileestBillSettlementValue;
  // State field(s) for SwitchListTilesendbillFormatToEmail widget.
  bool? switchListTilesendbillFormatToEmailValue;
  // State field(s) for SwitchListTileEnableDisToDirectlyAddBill widget.
  bool? switchListTileEnableDisToDirectlyAddBillValue;
  // State field(s) for SwitchListTilemanualPrice widget.
  bool? switchListTilemanualPriceValue;
  // State field(s) for SwitchListTileestimateMode widget.
  bool? switchListTileestimateModeValue;
  // State field(s) for SwitchListTileeditingInSettelement widget.
  bool? switchListTileeditingInSettelementValue;
  // State field(s) for SwitchListTileopenPrice widget.
  bool? switchListTileopenPriceValue;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for SwitchListTilecomboPriceUpdate widget.
  bool? switchListTilecomboPriceUpdateValue;
  // State field(s) for SwitchListTileonlineOrderSystem widget.
  bool? switchListTileonlineOrderSystemValue;
  // State field(s) for SwitchListTilebillModification widget.
  bool? switchListTilebillModificationValue;
  // State field(s) for SwitchListTileenableStore widget.
  bool? switchListTileenableStoreValue;
  // State field(s) for SwitchListTileweightMinus widget.
  bool? switchListTileweightMinusValue;
  // State field(s) for SwitchListTilestockgettinginminus widget.
  bool? switchListTilestockgettinginminusValue;
  // State field(s) for SwitchListTileDeliveryDate widget.
  bool? switchListTileDeliveryDateValue;
  // State field(s) for SwitchListTileHideKeybord widget.
  bool? switchListTileHideKeybordValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AppSettingsRecord? doc;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
    expandableExpandableController6.dispose();
    expandableExpandableController7.dispose();
    expandableExpandableController8.dispose();
    expandableExpandableController9.dispose();
    expandableExpandableController10.dispose();
    expandableExpandableController11.dispose();
    expandableExpandableController12.dispose();
  }
}
