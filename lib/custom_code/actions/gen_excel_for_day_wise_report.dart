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

Future<String> genExcelForDayWiseReport(
  String? startdate,
  String? shopName,
  List<InvoiceRecord> docList,
  String? enddate,
  String? branch,
) async {
  // Add your function code here!
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  CellStyle boldStyle = CellStyle(bold: true);

  double count = 0;
  String vechicleNo = "";
  int outDate = 0;
  double totalAmount = 0;

  for (var product in docList!) {
    count += product.count;
    vechicleNo += product.vechicleNo;
    outDate += product.checkOutTime;
    totalAmount += product.finalBillAmt;
  }

  // Add headers to the sheet
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

  sheet.appendRow([
    TextCellValue('Total Amount'),
    TextCellValue(totalAmount.toString()),
  ]);

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Add product details to the sheet
  sheet.appendRow([
    TextCellValue('Count'),
    TextCellValue('Date'),
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

  for (var product in docList!) {
    final timestamp = product.invoiceDate; // Assuming this is in milliseconds.
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final formattedDate = DateFormat('dd-MM-yyyy hh:mm').format(date);
    sheet.appendRow([
      TextCellValue(product.count.toString()),
      TextCellValue(formattedDate),
      TextCellValue(product.finalBillAmt.toString()),
    ]);
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
