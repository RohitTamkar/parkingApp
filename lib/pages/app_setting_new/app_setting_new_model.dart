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
import 'app_setting_new_widget.dart' show AppSettingNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppSettingNewModel extends FlutterFlowModel<AppSettingNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for SwitchListTileTableSet widget.
  bool? switchListTileTableSetValue;
  // State field(s) for SwitchListTileCustSet widget.
  bool? switchListTileCustSetValue;
  // State field(s) for SwitchListTilebarcodeSet widget.
  bool? switchListTilebarcodeSetValue;
  // State field(s) for SwitchListTileRfidSet widget.
  bool? switchListTileRfidSetValue;
  // State field(s) for SwitchListTilesalesmanSet widget.
  bool? switchListTilesalesmanSetValue;
  // State field(s) for SwitchListTileRegularScr widget.
  bool? switchListTileRegularScrValue;
  // State field(s) for SwitchListTileProdAndList widget.
  bool? switchListTileProdAndListValue;
  // State field(s) for SwitchListTileFullScrnQR widget.
  bool? switchListTileFullScrnQRValue;
  // State field(s) for SwitchListTileFullScrBill widget.
  bool? switchListTileFullScrBillValue;
  // State field(s) for SwitchListTileTableScreen widget.
  bool? switchListTileTableScreenValue;
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
  // State field(s) for kiskbilling widget.
  bool? kiskbillingValue;
  // State field(s) for SwitchListTileestBillSettlement widget.
  bool? switchListTileestBillSettlementValue;
  // State field(s) for SwitchListTilesendbillFormatToEmail widget.
  bool? switchListTilesendbillFormatToEmailValue;
  // State field(s) for SwitchListTileEnableDisToDirectlyAddBill widget.
  bool? switchListTileEnableDisToDirectlyAddBillValue;
  // State field(s) for SwitchListTileshowProductImg widget.
  bool? switchListTileshowProductImgValue;
  // State field(s) for SwitchListTilehideProductSearchCode widget.
  bool? switchListTilehideProductSearchCodeValue;
  // State field(s) for SwitchListTileproductListTy widget.
  bool? switchListTileproductListTyValue;
  // State field(s) for SwitchListTileregionalLanguage widget.
  bool? switchListTileregionalLanguageValue;
  // State field(s) for SwitchListTiletrimProductNameForSingleLine widget.
  bool? switchListTiletrimProductNameForSingleLineValue;
  // State field(s) for SwitchListTilehsnNumber widget.
  bool? switchListTilehsnNumberValue;
  // State field(s) for SwitchListTileproductSerialNumber widget.
  bool? switchListTileproductSerialNumberValue;
  // State field(s) for SwitchListTileregionalBillPrintl widget.
  bool? switchListTileregionalBillPrintlValue;
  // State field(s) for SwitchListTilecalculateReverseQty widget.
  bool? switchListTilecalculateReverseQtyValue;
  // State field(s) for SwitchListTilesortingInHotKey widget.
  bool? switchListTilesortingInHotKeyValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for SwitchListTileopenSoftKeyword widget.
  bool? switchListTileopenSoftKeywordValue;
  // State field(s) for SwitchListTileprintBtnAfterPay widget.
  bool? switchListTileprintBtnAfterPayValue;
  // State field(s) for SwitchListTilethreeChar widget.
  bool? switchListTilethreeCharValue;
  // State field(s) for SwitchListTilemanualPrice widget.
  bool? switchListTilemanualPriceValue;
  // State field(s) for SwitchListTileestimateMode widget.
  bool? switchListTileestimateModeValue;
  // State field(s) for SwitchListTileeditingInSettelement widget.
  bool? switchListTileeditingInSettelementValue;
  // State field(s) for SwitchListTileopenPrice widget.
  bool? switchListTileopenPriceValue;
  // State field(s) for DropDownList widget.
  String? dropDownListValue;
  FormFieldController<String>? dropDownListValueController;
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
  // State field(s) for SwitchListTileenablePaymentMenu widget.
  bool? switchListTileenablePaymentMenuValue;
  // State field(s) for SwitchListTilegoodsReceiveMenu widget.
  bool? switchListTilegoodsReceiveMenuValue;
  // State field(s) for SwitchListTilestockOutMenu widget.
  bool? switchListTilestockOutMenuValue;
  // State field(s) for SwitchListTileEnableBarcodeMenu widget.
  bool? switchListTileEnableBarcodeMenuValue;
  // State field(s) for shiftEnd widget.
  bool? shiftEndValue;
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
  // State field(s) for SwitchListTilekotRePrint widget.
  bool? switchListTilekotRePrintValue;
  // State field(s) for SwitchListTilekotPrintAmountColumn widget.
  bool? switchListTilekotPrintAmountColumnValue;
  // State field(s) for SwitchListTilekotRemark widget.
  bool? switchListTilekotRemarkValue;
  // State field(s) for SwitchListTiledisableSaveKot widget.
  bool? switchListTiledisableSaveKotValue;
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
  // State field(s) for SwitchListTileAskCustInBill widget.
  bool? switchListTileAskCustInBillValue;
  // State field(s) for SwitchListTileSearchonlyWithBarcode widget.
  bool? switchListTileSearchonlyWithBarcodeValue;
  // State field(s) for SwitchListTilerfidMasterRead widget.
  bool? switchListTilerfidMasterReadValue;
  // State field(s) for SwitchListTilerfidmasterWrt widget.
  bool? switchListTilerfidmasterWrtValue;
  // State field(s) for SwitchListTilesalesmanForcefully widget.
  bool? switchListTilesalesmanForcefullyValue;
  // State field(s) for SwitchListTilesalesmanProductWise widget.
  bool? switchListTilesalesmanProductWiseValue;
  // State field(s) for SwitchListTileenableSavedMrp widget.
  bool? switchListTileenableSavedMrpValue;
  // State field(s) for SwitchListTileenableMrpPriceColumn widget.
  bool? switchListTileenableMrpPriceColumnValue;
  // State field(s) for SwitchListTileduplicateBill widget.
  bool? switchListTileduplicateBillValue;
  // State field(s) for SwitchListTiledoublePrint widget.
  bool? switchListTiledoublePrintValue;
  // State field(s) for SwitchListTilelargeBillFont widget.
  bool? switchListTilelargeBillFontValue;
  // State field(s) for SwitchListTilebillPrintServicePointWise widget.
  bool? switchListTilebillPrintServicePointWiseValue;
  // State field(s) for SwitchListTilefontBoldNetTotal widget.
  bool? switchListTilefontBoldNetTotalValue;
  // State field(s) for SwitchListTilebillAmountInWord widget.
  bool? switchListTilebillAmountInWordValue;
  // State field(s) for SwitchListTilesignatureBill widget.
  bool? switchListTilesignatureBillValue;
  // State field(s) for SwitchListTileunitTypeOnBill widget.
  bool? switchListTileunitTypeOnBillValue;
  // State field(s) for SwitchListTileuserNameOnBill widget.
  bool? switchListTileuserNameOnBillValue;
  // State field(s) for SwitchListTileregionalKotPrint widget.
  bool? switchListTileregionalKotPrintValue;
  // State field(s) for SwitchListTiledontPrintRateColumn widget.
  bool? switchListTiledontPrintRateColumnValue;
  // State field(s) for SwitchListTiledontPrintSerialNo widget.
  bool? switchListTiledontPrintSerialNoValue;
  // State field(s) for SwitchListTiledontPrintBillNumber widget.
  bool? switchListTiledontPrintBillNumberValue;
  // State field(s) for SwitchListTileenableBillRemark widget.
  bool? switchListTileenableBillRemarkValue;
  // State field(s) for SwitchListTiletotalQtyOnBill widget.
  bool? switchListTiletotalQtyOnBillValue;
  // State field(s) for SwitchListTilebarcodeOnBill widget.
  bool? switchListTilebarcodeOnBillValue;
  // State field(s) for SwitchListTileprintDiscountOnBill widget.
  bool? switchListTileprintDiscountOnBillValue;
  // State field(s) for SwitchListTilecouponOrKotSummary widget.
  bool? switchListTilecouponOrKotSummaryValue;
  // State field(s) for SwitchListTileColumnProductNameAndQty widget.
  bool? switchListTileColumnProductNameAndQtyValue;
  // State field(s) for SwitchListTileincluOrReverseTax widget.
  bool? switchListTileincluOrReverseTaxValue;
  // State field(s) for SwitchListTileSaleWithTax widget.
  bool? switchListTileSaleWithTaxValue;
  // State field(s) for SwitchListTileprintConsolidateTax widget.
  bool? switchListTileprintConsolidateTaxValue;
  // State field(s) for SwitchListTiledontPrintTaxInvoice widget.
  bool? switchListTiledontPrintTaxInvoiceValue;
  // State field(s) for SwitchListTilecgstAndSgstOnBill widget.
  bool? switchListTilecgstAndSgstOnBillValue;
  // State field(s) for SwitchListTiledontPrintGstBreakupOnBill widget.
  bool? switchListTiledontPrintGstBreakupOnBillValue;
  // State field(s) for SwitchListTileenableRateColumn widget.
  bool? switchListTileenableRateColumnValue;
  // State field(s) for SwitchListTilecouponSaveBill widget.
  bool? switchListTilecouponSaveBillValue;
  // State field(s) for SwitchListTileenableUPIBtn widget.
  bool? switchListTileenableUPIBtnValue;
  // State field(s) for SwitchListTileprintPayMode widget.
  bool? switchListTileprintPayModeValue;
  // State field(s) for DropDownpayMode widget.
  String? dropDownpayModeValue;
  FormFieldController<String>? dropDownpayModeValueController;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
