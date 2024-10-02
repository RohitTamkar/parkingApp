// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelItemListStruct extends FFFirebaseStruct {
  SelItemListStruct({
    String? name,
    double? price,
    double? quantity,
    double? total,
    String? id,
    String? catId,
    bool? isDeletedItem,
    double? taxPer,
    double? taxAmt,
    String? taxId,
    String? categoryP,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _price = price,
        _quantity = quantity,
        _total = total,
        _id = id,
        _catId = catId,
        _isDeletedItem = isDeletedItem,
        _taxPer = taxPer,
        _taxAmt = taxAmt,
        _taxId = taxId,
        _categoryP = categoryP,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "catId" field.
  String? _catId;
  String get catId => _catId ?? '';
  set catId(String? val) => _catId = val;

  bool hasCatId() => _catId != null;

  // "isDeletedItem" field.
  bool? _isDeletedItem;
  bool get isDeletedItem => _isDeletedItem ?? false;
  set isDeletedItem(bool? val) => _isDeletedItem = val;

  bool hasIsDeletedItem() => _isDeletedItem != null;

  // "taxPer" field.
  double? _taxPer;
  double get taxPer => _taxPer ?? 0.0;
  set taxPer(double? val) => _taxPer = val;

  void incrementTaxPer(double amount) => taxPer = taxPer + amount;

  bool hasTaxPer() => _taxPer != null;

  // "taxAmt" field.
  double? _taxAmt;
  double get taxAmt => _taxAmt ?? 0.0;
  set taxAmt(double? val) => _taxAmt = val;

  void incrementTaxAmt(double amount) => taxAmt = taxAmt + amount;

  bool hasTaxAmt() => _taxAmt != null;

  // "taxId" field.
  String? _taxId;
  String get taxId => _taxId ?? '';
  set taxId(String? val) => _taxId = val;

  bool hasTaxId() => _taxId != null;

  // "categoryP" field.
  String? _categoryP;
  String get categoryP => _categoryP ?? '';
  set categoryP(String? val) => _categoryP = val;

  bool hasCategoryP() => _categoryP != null;

  static SelItemListStruct fromMap(Map<String, dynamic> data) =>
      SelItemListStruct(
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        quantity: castToType<double>(data['quantity']),
        total: castToType<double>(data['total']),
        id: data['id'] as String?,
        catId: data['catId'] as String?,
        isDeletedItem: data['isDeletedItem'] as bool?,
        taxPer: castToType<double>(data['taxPer']),
        taxAmt: castToType<double>(data['taxAmt']),
        taxId: data['taxId'] as String?,
        categoryP: data['categoryP'] as String?,
      );

  static SelItemListStruct? maybeFromMap(dynamic data) => data is Map
      ? SelItemListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'quantity': _quantity,
        'total': _total,
        'id': _id,
        'catId': _catId,
        'isDeletedItem': _isDeletedItem,
        'taxPer': _taxPer,
        'taxAmt': _taxAmt,
        'taxId': _taxId,
        'categoryP': _categoryP,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'catId': serializeParam(
          _catId,
          ParamType.String,
        ),
        'isDeletedItem': serializeParam(
          _isDeletedItem,
          ParamType.bool,
        ),
        'taxPer': serializeParam(
          _taxPer,
          ParamType.double,
        ),
        'taxAmt': serializeParam(
          _taxAmt,
          ParamType.double,
        ),
        'taxId': serializeParam(
          _taxId,
          ParamType.String,
        ),
        'categoryP': serializeParam(
          _categoryP,
          ParamType.String,
        ),
      }.withoutNulls;

  static SelItemListStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelItemListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['catId'],
          ParamType.String,
          false,
        ),
        isDeletedItem: deserializeParam(
          data['isDeletedItem'],
          ParamType.bool,
          false,
        ),
        taxPer: deserializeParam(
          data['taxPer'],
          ParamType.double,
          false,
        ),
        taxAmt: deserializeParam(
          data['taxAmt'],
          ParamType.double,
          false,
        ),
        taxId: deserializeParam(
          data['taxId'],
          ParamType.String,
          false,
        ),
        categoryP: deserializeParam(
          data['categoryP'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SelItemListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelItemListStruct &&
        name == other.name &&
        price == other.price &&
        quantity == other.quantity &&
        total == other.total &&
        id == other.id &&
        catId == other.catId &&
        isDeletedItem == other.isDeletedItem &&
        taxPer == other.taxPer &&
        taxAmt == other.taxAmt &&
        taxId == other.taxId &&
        categoryP == other.categoryP;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        price,
        quantity,
        total,
        id,
        catId,
        isDeletedItem,
        taxPer,
        taxAmt,
        taxId,
        categoryP
      ]);
}

SelItemListStruct createSelItemListStruct({
  String? name,
  double? price,
  double? quantity,
  double? total,
  String? id,
  String? catId,
  bool? isDeletedItem,
  double? taxPer,
  double? taxAmt,
  String? taxId,
  String? categoryP,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelItemListStruct(
      name: name,
      price: price,
      quantity: quantity,
      total: total,
      id: id,
      catId: catId,
      isDeletedItem: isDeletedItem,
      taxPer: taxPer,
      taxAmt: taxAmt,
      taxId: taxId,
      categoryP: categoryP,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelItemListStruct? updateSelItemListStruct(
  SelItemListStruct? selItemList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selItemList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelItemListStructData(
  Map<String, dynamic> firestoreData,
  SelItemListStruct? selItemList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selItemList == null) {
    return;
  }
  if (selItemList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selItemList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selItemListData =
      getSelItemListFirestoreData(selItemList, forFieldValue);
  final nestedData =
      selItemListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = selItemList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelItemListFirestoreData(
  SelItemListStruct? selItemList, [
  bool forFieldValue = false,
]) {
  if (selItemList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selItemList.toMap());

  // Add any Firestore field values
  selItemList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelItemListListFirestoreData(
  List<SelItemListStruct>? selItemLists,
) =>
    selItemLists?.map((e) => getSelItemListFirestoreData(e, true)).toList() ??
    [];
