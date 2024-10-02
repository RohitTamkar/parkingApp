import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpenseTransactionRecord extends FirestoreRecord {
  ExpenseTransactionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "expenseAmount" field.
  double? _expenseAmount;
  double get expenseAmount => _expenseAmount ?? 0.0;
  bool hasExpenseAmount() => _expenseAmount != null;

  // "paidAmount" field.
  double? _paidAmount;
  double get paidAmount => _paidAmount ?? 0.0;
  bool hasPaidAmount() => _paidAmount != null;

  // "payDate" field.
  int? _payDate;
  int get payDate => _payDate ?? 0;
  bool hasPayDate() => _payDate != null;

  // "dayld" field.
  String? _dayld;
  String get dayld => _dayld ?? '';
  bool hasDayld() => _dayld != null;

  // "monthid" field.
  String? _monthid;
  String get monthid => _monthid ?? '';
  bool hasMonthid() => _monthid != null;

  // "payldBy" field.
  String? _payldBy;
  String get payldBy => _payldBy ?? '';
  bool hasPayldBy() => _payldBy != null;

  // "yearld" field.
  String? _yearld;
  String get yearld => _yearld ?? '';
  bool hasYearld() => _yearld != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _expenseAmount = castToType<double>(snapshotData['expenseAmount']);
    _paidAmount = castToType<double>(snapshotData['paidAmount']);
    _payDate = castToType<int>(snapshotData['payDate']);
    _dayld = snapshotData['dayld'] as String?;
    _monthid = snapshotData['monthid'] as String?;
    _payldBy = snapshotData['payldBy'] as String?;
    _yearld = snapshotData['yearld'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ExpenseTransaction')
          : FirebaseFirestore.instance.collectionGroup('ExpenseTransaction');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ExpenseTransaction').doc(id);

  static Stream<ExpenseTransactionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpenseTransactionRecord.fromSnapshot(s));

  static Future<ExpenseTransactionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExpenseTransactionRecord.fromSnapshot(s));

  static ExpenseTransactionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpenseTransactionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpenseTransactionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpenseTransactionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpenseTransactionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpenseTransactionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpenseTransactionRecordData({
  double? expenseAmount,
  double? paidAmount,
  int? payDate,
  String? dayld,
  String? monthid,
  String? payldBy,
  String? yearld,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'expenseAmount': expenseAmount,
      'paidAmount': paidAmount,
      'payDate': payDate,
      'dayld': dayld,
      'monthid': monthid,
      'payldBy': payldBy,
      'yearld': yearld,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpenseTransactionRecordDocumentEquality
    implements Equality<ExpenseTransactionRecord> {
  const ExpenseTransactionRecordDocumentEquality();

  @override
  bool equals(ExpenseTransactionRecord? e1, ExpenseTransactionRecord? e2) {
    return e1?.expenseAmount == e2?.expenseAmount &&
        e1?.paidAmount == e2?.paidAmount &&
        e1?.payDate == e2?.payDate &&
        e1?.dayld == e2?.dayld &&
        e1?.monthid == e2?.monthid &&
        e1?.payldBy == e2?.payldBy &&
        e1?.yearld == e2?.yearld;
  }

  @override
  int hash(ExpenseTransactionRecord? e) => const ListEquality().hash([
        e?.expenseAmount,
        e?.paidAmount,
        e?.payDate,
        e?.dayld,
        e?.monthid,
        e?.payldBy,
        e?.yearld
      ]);

  @override
  bool isValidKey(Object? o) => o is ExpenseTransactionRecord;
}
