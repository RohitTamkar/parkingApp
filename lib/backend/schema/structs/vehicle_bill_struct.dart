// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleBillStruct extends FFFirebaseStruct {
  VehicleBillStruct({
    String? vehicleNo,
    String? vehicleType,
    double? billAmt,
    double? finalBillAmt,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vehicleNo = vehicleNo,
        _vehicleType = vehicleType,
        _billAmt = billAmt,
        _finalBillAmt = finalBillAmt,
        _count = count,
        super(firestoreUtilData);

  // "vehicleNo" field.
  String? _vehicleNo;
  String get vehicleNo => _vehicleNo ?? '';
  set vehicleNo(String? val) => _vehicleNo = val;

  bool hasVehicleNo() => _vehicleNo != null;

  // "vehicleType" field.
  String? _vehicleType;
  String get vehicleType => _vehicleType ?? '';
  set vehicleType(String? val) => _vehicleType = val;

  bool hasVehicleType() => _vehicleType != null;

  // "billAmt" field.
  double? _billAmt;
  double get billAmt => _billAmt ?? 0.0;
  set billAmt(double? val) => _billAmt = val;

  void incrementBillAmt(double amount) => billAmt = billAmt + amount;

  bool hasBillAmt() => _billAmt != null;

  // "finalBillAmt" field.
  double? _finalBillAmt;
  double get finalBillAmt => _finalBillAmt ?? 0.0;
  set finalBillAmt(double? val) => _finalBillAmt = val;

  void incrementFinalBillAmt(double amount) =>
      finalBillAmt = finalBillAmt + amount;

  bool hasFinalBillAmt() => _finalBillAmt != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static VehicleBillStruct fromMap(Map<String, dynamic> data) =>
      VehicleBillStruct(
        vehicleNo: data['vehicleNo'] as String?,
        vehicleType: data['vehicleType'] as String?,
        billAmt: castToType<double>(data['billAmt']),
        finalBillAmt: castToType<double>(data['finalBillAmt']),
        count: castToType<int>(data['count']),
      );

  static VehicleBillStruct? maybeFromMap(dynamic data) => data is Map
      ? VehicleBillStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vehicleNo': _vehicleNo,
        'vehicleType': _vehicleType,
        'billAmt': _billAmt,
        'finalBillAmt': _finalBillAmt,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vehicleNo': serializeParam(
          _vehicleNo,
          ParamType.String,
        ),
        'vehicleType': serializeParam(
          _vehicleType,
          ParamType.String,
        ),
        'billAmt': serializeParam(
          _billAmt,
          ParamType.double,
        ),
        'finalBillAmt': serializeParam(
          _finalBillAmt,
          ParamType.double,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static VehicleBillStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleBillStruct(
        vehicleNo: deserializeParam(
          data['vehicleNo'],
          ParamType.String,
          false,
        ),
        vehicleType: deserializeParam(
          data['vehicleType'],
          ParamType.String,
          false,
        ),
        billAmt: deserializeParam(
          data['billAmt'],
          ParamType.double,
          false,
        ),
        finalBillAmt: deserializeParam(
          data['finalBillAmt'],
          ParamType.double,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VehicleBillStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VehicleBillStruct &&
        vehicleNo == other.vehicleNo &&
        vehicleType == other.vehicleType &&
        billAmt == other.billAmt &&
        finalBillAmt == other.finalBillAmt &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([vehicleNo, vehicleType, billAmt, finalBillAmt, count]);
}

VehicleBillStruct createVehicleBillStruct({
  String? vehicleNo,
  String? vehicleType,
  double? billAmt,
  double? finalBillAmt,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VehicleBillStruct(
      vehicleNo: vehicleNo,
      vehicleType: vehicleType,
      billAmt: billAmt,
      finalBillAmt: finalBillAmt,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VehicleBillStruct? updateVehicleBillStruct(
  VehicleBillStruct? vehicleBill, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vehicleBill
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVehicleBillStructData(
  Map<String, dynamic> firestoreData,
  VehicleBillStruct? vehicleBill,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vehicleBill == null) {
    return;
  }
  if (vehicleBill.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vehicleBill.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vehicleBillData =
      getVehicleBillFirestoreData(vehicleBill, forFieldValue);
  final nestedData =
      vehicleBillData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vehicleBill.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVehicleBillFirestoreData(
  VehicleBillStruct? vehicleBill, [
  bool forFieldValue = false,
]) {
  if (vehicleBill == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vehicleBill.toMap());

  // Add any Firestore field values
  vehicleBill.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVehicleBillListFirestoreData(
  List<VehicleBillStruct>? vehicleBills,
) =>
    vehicleBills?.map((e) => getVehicleBillFirestoreData(e, true)).toList() ??
    [];
