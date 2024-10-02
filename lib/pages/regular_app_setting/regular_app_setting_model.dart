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
import 'regular_app_setting_widget.dart' show RegularAppSettingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegularAppSettingModel extends FlutterFlowModel<RegularAppSettingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for SwitchListTileRfidSet widget.
  bool? switchListTileRfidSetValue;
  // State field(s) for SwitchListTileenableOpeningBalance widget.
  bool? switchListTileenableOpeningBalanceValue;
  // State field(s) for SwitchListTiledisableSaveButton widget.
  bool? switchListTiledisableSaveButtonValue;
  // State field(s) for SwitchListTileshowOpeningAmount widget.
  bool? switchListTileshowOpeningAmountValue;
  // State field(s) for SwitchListTileshowHoldListBtn widget.
  bool? switchListTileshowHoldListBtnValue;
  // State field(s) for kiskbilling widget.
  bool? kiskbillingValue;
  // State field(s) for SwitchListTileshowProductImg widget.
  bool? switchListTileshowProductImgValue;
  // State field(s) for SwitchListTilehideProductSearchCode widget.
  bool? switchListTilehideProductSearchCodeValue;
  // State field(s) for SwitchListTileproductListTy widget.
  bool? switchListTileproductListTyValue;
  // State field(s) for SwitchListTileregionalLanguage widget.
  bool? switchListTileregionalLanguageValue;
  // State field(s) for SwitchListTilethreeChar widget.
  bool? switchListTilethreeCharValue;
  // State field(s) for DropDownList widget.
  String? dropDownListValue;
  FormFieldController<String>? dropDownListValueController;
  // State field(s) for SwitchListTiletrimProductNameForSingleLine widget.
  bool? switchListTiletrimProductNameForSingleLineValue;
  // State field(s) for SwitchListTilehsnNumber widget.
  bool? switchListTilehsnNumberValue;
  // State field(s) for SwitchListTileproductSerialNumber widget.
  bool? switchListTileproductSerialNumberValue;
  // State field(s) for SwitchListTileregionalBillPrintl widget.
  bool? switchListTileregionalBillPrintlValue;
  // State field(s) for SwitchListTileestBillSettlement widget.
  bool? switchListTileestBillSettlementValue;
  // State field(s) for SwitchListTileEnableDisToDirectlyAddBill widget.
  bool? switchListTileEnableDisToDirectlyAddBillValue;
  // State field(s) for SwitchListTileincluOrReverseTax widget.
  bool? switchListTileincluOrReverseTaxValue;
  // State field(s) for SwitchListTileSaleWithOouTax widget.
  bool? switchListTileSaleWithOouTaxValue;
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
  // State field(s) for DropDownpayMode widget.
  String? dropDownpayModeValue;
  FormFieldController<String>? dropDownpayModeValueController;
  // State field(s) for SwitchListTileprintPayMode widget.
  bool? switchListTileprintPayModeValue;
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

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
