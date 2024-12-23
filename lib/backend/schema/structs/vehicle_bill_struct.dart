// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleBillStruct extends FFFirebaseStruct {
  VehicleBillStruct({
    double? baseRate,
    double? baseDuration,
    double? hourlyRate,
    int? freeMinutes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _baseRate = baseRate,
        _baseDuration = baseDuration,
        _hourlyRate = hourlyRate,
        _freeMinutes = freeMinutes,
        super(firestoreUtilData);

  // "baseRate" field.
  double? _baseRate;
  double get baseRate => _baseRate ?? 0.0;
  set baseRate(double? val) => _baseRate = val;

  void incrementBaseRate(double amount) => baseRate = baseRate + amount;

  bool hasBaseRate() => _baseRate != null;

  // "baseDuration" field.
  double? _baseDuration;
  double get baseDuration => _baseDuration ?? 0.0;
  set baseDuration(double? val) => _baseDuration = val;

  void incrementBaseDuration(double amount) =>
      baseDuration = baseDuration + amount;

  bool hasBaseDuration() => _baseDuration != null;

  // "hourlyRate" field.
  double? _hourlyRate;
  double get hourlyRate => _hourlyRate ?? 0.0;
  set hourlyRate(double? val) => _hourlyRate = val;

  void incrementHourlyRate(double amount) => hourlyRate = hourlyRate + amount;

  bool hasHourlyRate() => _hourlyRate != null;

  // "freeMinutes" field.
  int? _freeMinutes;
  int get freeMinutes => _freeMinutes ?? 0;
  set freeMinutes(int? val) => _freeMinutes = val;

  void incrementFreeMinutes(int amount) => freeMinutes = freeMinutes + amount;

  bool hasFreeMinutes() => _freeMinutes != null;

  static VehicleBillStruct fromMap(Map<String, dynamic> data) =>
      VehicleBillStruct(
        baseRate: castToType<double>(data['baseRate']),
        baseDuration: castToType<double>(data['baseDuration']),
        hourlyRate: castToType<double>(data['hourlyRate']),
        freeMinutes: castToType<int>(data['freeMinutes']),
      );

  static VehicleBillStruct? maybeFromMap(dynamic data) => data is Map
      ? VehicleBillStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'baseRate': _baseRate,
        'baseDuration': _baseDuration,
        'hourlyRate': _hourlyRate,
        'freeMinutes': _freeMinutes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'baseRate': serializeParam(
          _baseRate,
          ParamType.double,
        ),
        'baseDuration': serializeParam(
          _baseDuration,
          ParamType.double,
        ),
        'hourlyRate': serializeParam(
          _hourlyRate,
          ParamType.double,
        ),
        'freeMinutes': serializeParam(
          _freeMinutes,
          ParamType.int,
        ),
      }.withoutNulls;

  static VehicleBillStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleBillStruct(
        baseRate: deserializeParam(
          data['baseRate'],
          ParamType.double,
          false,
        ),
        baseDuration: deserializeParam(
          data['baseDuration'],
          ParamType.double,
          false,
        ),
        hourlyRate: deserializeParam(
          data['hourlyRate'],
          ParamType.double,
          false,
        ),
        freeMinutes: deserializeParam(
          data['freeMinutes'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VehicleBillStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VehicleBillStruct &&
        baseRate == other.baseRate &&
        baseDuration == other.baseDuration &&
        hourlyRate == other.hourlyRate &&
        freeMinutes == other.freeMinutes;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([baseRate, baseDuration, hourlyRate, freeMinutes]);
}

VehicleBillStruct createVehicleBillStruct({
  double? baseRate,
  double? baseDuration,
  double? hourlyRate,
  int? freeMinutes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VehicleBillStruct(
      baseRate: baseRate,
      baseDuration: baseDuration,
      hourlyRate: hourlyRate,
      freeMinutes: freeMinutes,
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
