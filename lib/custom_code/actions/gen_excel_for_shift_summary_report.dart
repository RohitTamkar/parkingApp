// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import '/flutter_flow/custom_functions.dart'
    as functions; // Imports custom functions

// DO NOT REMOVE OR MODIFY THE CODE A!

import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<String> genExcelForShiftSummaryReport(
  String? startdate,
  String? shopName,
  List<InvoiceRecord> docList,
  String? enddate,
  String? branch,
  List<InvoiceRecord> uniqeList,
  String shiftIdDate,
) async {
  // Add your function code here!

  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  CellStyle boldStyle = CellStyle(bold: true);

  String vechicleType = "";
  double qty = 0;
  double totalAmount = 0;
  double totalcheckin = 0;
  double totalcheckout = 0;

  dynamic obj;
  if (docList.isNotEmpty) {
    obj = docList[0];

    for (var product in docList!) {
      vechicleType += product.vechicleType;
      qty += product.invoiceDate;
      totalAmount += product.finalBillAmt;
    }

    double totalAmt = 0;
    double totalAmt2 = 0;

    // Add headers to the sheet
    sheet.appendRow([
      TextCellValue('Vehicle Parking Report'),
    ]);
    sheet.appendRow([
      TextCellValue('Shop Name'),
      TextCellValue(shopName ?? ''),
    ]);

    sheet.appendRow([
      TextCellValue('Branch Name'),
      TextCellValue(branch ?? ''),
    ]);

    sheet.appendRow([
      TextCellValue('Start Date'),
      TextCellValue(startdate ?? ''),
    ]);

    sheet.appendRow([
      TextCellValue('End Date'),
      TextCellValue(enddate ?? ''),
    ]);

    // sheet.appendRow([
    //   TextCellValue('Total Checkin'),
    //   TextCellValue(totalcheckin.toString()),
    // ]);
    //
    // sheet.appendRow([
    //   TextCellValue('Total Checkout'),
    //   TextCellValue(totalcheckout.toString()),
    // ]);
    sheet.appendRow([
      TextCellValue('Shift Id'),
      TextCellValue(shiftIdDate ?? ''),
    ]);

    sheet.appendRow([
      TextCellValue('Total Amount'),
      TextCellValue(totalAmount.toString()),
    ]);

    sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

    // Add product details to the sheet
    sheet.appendRow([
      TextCellValue('Vechicle Type'),
      TextCellValue('Total Checkin'),
      TextCellValue('Total Checkout'),
      TextCellValue('Net Amount'),
    ]);

    List<int> boldColumns = [0, 1, 2];
    List<int> boldRows = [1, 2, 3, 4, 5];

    for (int columnIndex in boldColumns) {
      var cell = sheet.cell(
          CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: columnIndex));
      cell.cellStyle = boldStyle;
    }

    for (int rowIndex in boldRows) {
      var cell = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: rowIndex, rowIndex: 2));
      cell.cellStyle = boldStyle;
    }

    for (var product in uniqeList!) {
      String Vechicltype = '';
      totalAmt2 += functions.returntoatlamt(docList
          .where((e) => e.vechicleType == product.vechicleType)
          .toList()
          .map((e) => e.finalBillAmt)
          .toList());
      totalAmt = functions.returntoatlamt(docList
          .where((e) => e.vechicleType == product.vechicleType)
          .toList()
          .map((e) => e.finalBillAmt)
          .toList());
      Vechicltype = product.vechicleType;
      totalcheckin += docList
          .where((e) =>
              (e.vechicleType == product.vechicleType) &&
              ((e.checkInTime >=
                      FFAppState().startDate!.millisecondsSinceEpoch) &&
                  (e.checkInTime <=
                      FFAppState().endDate!.millisecondsSinceEpoch)))
          .toList()
          .length;
      totalcheckout += docList
          .where((e) =>
              (e.vechicleType == product.vechicleType) &&
              ((e.checkOutTime >=
                      FFAppState().startDate!.millisecondsSinceEpoch) &&
                  (e.checkOutTime <=
                      FFAppState().endDate!.millisecondsSinceEpoch)))
          .toList()
          .length;

      totalAmount += totalAmt2;

      sheet.appendRow([
        TextCellValue(Vechicltype),
        TextCellValue(docList
            .where((e) =>
                (e.vechicleType == product.vechicleType) &&
                ((e.checkInTime >=
                        FFAppState().startDate!.millisecondsSinceEpoch) &&
                    (e.checkInTime <=
                        FFAppState().endDate!.millisecondsSinceEpoch)))
            .toList()
            .length
            .toString()),
        TextCellValue(docList
            .where((e) =>
                (e.vechicleType == product.vechicleType) &&
                ((e.checkOutTime >=
                        FFAppState().startDate!.millisecondsSinceEpoch) &&
                    (e.checkOutTime <=
                        FFAppState().endDate!.millisecondsSinceEpoch)))
            .toList()
            .length
            .toString()),
        TextCellValue(totalAmt.toString()),
      ]);
    }
  }
  sheet.appendRow([TextCellValue('')]);
  sheet.appendRow([TextCellValue('')]);

  // sheet.appendRow([
  //   TextCellValue('Total'),
  //   TextCellValue(totalqty.toString()),
  //   TextCellValue(''),
  //   TextCellValue(totalAmt.toString()),
  // ]);
  // Add total tax amount to the sheet
  // Encode the Excel file
  var fileBytes = excel.encode();

  // Convert bytes to base64
  var base64String = base64Encode(fileBytes!);

  // Prepare data URI
  var dataUri =
      'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';
  print(dataUri);
  return dataUri;
}
