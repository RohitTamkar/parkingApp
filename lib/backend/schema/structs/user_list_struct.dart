// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserListStruct extends FFFirebaseStruct {
  UserListStruct({
    bool? reports,
    bool? addVehicle,
    bool? passdetails,
    bool? master,
    bool? subscription,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _reports = reports,
        _addVehicle = addVehicle,
        _passdetails = passdetails,
        _master = master,
        _subscription = subscription,
        super(firestoreUtilData);

  // "Reports" field.
  bool? _reports;
  bool get reports => _reports ?? false;
  set reports(bool? val) => _reports = val;

  bool hasReports() => _reports != null;

  // "AddVehicle" field.
  bool? _addVehicle;
  bool get addVehicle => _addVehicle ?? false;
  set addVehicle(bool? val) => _addVehicle = val;

  bool hasAddVehicle() => _addVehicle != null;

  // "Passdetails" field.
  bool? _passdetails;
  bool get passdetails => _passdetails ?? false;
  set passdetails(bool? val) => _passdetails = val;

  bool hasPassdetails() => _passdetails != null;

  // "Master" field.
  bool? _master;
  bool get master => _master ?? false;
  set master(bool? val) => _master = val;

  bool hasMaster() => _master != null;

  // "Subscription" field.
  bool? _subscription;
  bool get subscription => _subscription ?? false;
  set subscription(bool? val) => _subscription = val;

  bool hasSubscription() => _subscription != null;

  static UserListStruct fromMap(Map<String, dynamic> data) => UserListStruct(
        reports: data['Reports'] as bool?,
        addVehicle: data['AddVehicle'] as bool?,
        passdetails: data['Passdetails'] as bool?,
        master: data['Master'] as bool?,
        subscription: data['Subscription'] as bool?,
      );

  static UserListStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Reports': _reports,
        'AddVehicle': _addVehicle,
        'Passdetails': _passdetails,
        'Master': _master,
        'Subscription': _subscription,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Reports': serializeParam(
          _reports,
          ParamType.bool,
        ),
        'AddVehicle': serializeParam(
          _addVehicle,
          ParamType.bool,
        ),
        'Passdetails': serializeParam(
          _passdetails,
          ParamType.bool,
        ),
        'Master': serializeParam(
          _master,
          ParamType.bool,
        ),
        'Subscription': serializeParam(
          _subscription,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserListStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserListStruct(
        reports: deserializeParam(
          data['Reports'],
          ParamType.bool,
          false,
        ),
        addVehicle: deserializeParam(
          data['AddVehicle'],
          ParamType.bool,
          false,
        ),
        passdetails: deserializeParam(
          data['Passdetails'],
          ParamType.bool,
          false,
        ),
        master: deserializeParam(
          data['Master'],
          ParamType.bool,
          false,
        ),
        subscription: deserializeParam(
          data['Subscription'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserListStruct &&
        reports == other.reports &&
        addVehicle == other.addVehicle &&
        passdetails == other.passdetails &&
        master == other.master &&
        subscription == other.subscription;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([reports, addVehicle, passdetails, master, subscription]);
}

UserListStruct createUserListStruct({
  bool? reports,
  bool? addVehicle,
  bool? passdetails,
  bool? master,
  bool? subscription,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserListStruct(
      reports: reports,
      addVehicle: addVehicle,
      passdetails: passdetails,
      master: master,
      subscription: subscription,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserListStruct? updateUserListStruct(
  UserListStruct? userList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserListStructData(
  Map<String, dynamic> firestoreData,
  UserListStruct? userList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userList == null) {
    return;
  }
  if (userList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userListData = getUserListFirestoreData(userList, forFieldValue);
  final nestedData = userListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserListFirestoreData(
  UserListStruct? userList, [
  bool forFieldValue = false,
]) {
  if (userList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userList.toMap());

  // Add any Firestore field values
  userList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListListFirestoreData(
  List<UserListStruct>? userLists,
) =>
    userLists?.map((e) => getUserListFirestoreData(e, true)).toList() ?? [];
