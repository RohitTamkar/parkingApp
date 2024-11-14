import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/device_record.dart';
import 'schema/outlet_record.dart';
import 'schema/invoice_record.dart';
import 'schema/business_type_record.dart';
import 'schema/businesss_master_record.dart';
import 'schema/user_profile_record.dart';
import 'schema/unit_type_record.dart';
import 'schema/category_master_record.dart';
import 'schema/product_master_record.dart';
import 'schema/service_point_record.dart';
import 'schema/tax_master_record.dart';
import 'schema/sub_category_record.dart';
import 'schema/language_record.dart';
import 'schema/payment_mode_record.dart';
import 'schema/user_roll_type_record.dart';
import 'schema/subscription_record.dart';
import 'schema/app_settings_record.dart';
import 'schema/print_settings_record.dart';
import 'schema/payment_record.dart';
import 'schema/party_record.dart';
import 'schema/shift_record.dart';
import 'schema/category_record.dart';
import 'schema/product_record.dart';
import 'schema/recipe_record.dart';
import 'schema/premises_record.dart';
import 'schema/company_details_record.dart';
import 'schema/about_us_record.dart';
import 'schema/contact_us_record.dart';
import 'schema/terms_and_conditions_record.dart';
import 'schema/service_point_outlet_record.dart';
import 'schema/header_record.dart';
import 'schema/purchase_record.dart';
import 'schema/user_role_type_record.dart';
import 'schema/online_orders_record.dart';
import 'schema/shrikant_product_record.dart';
import 'schema/cancellation_refund_policy_record.dart';
import 'schema/shipping_delivery_policy_record.dart';
import 'schema/privacy_policy_record.dart';
import 'schema/advertisement_record.dart';
import 'schema/footer_record.dart';
import 'schema/qr_transactions_record.dart';
import 'schema/app_settings_master_record.dart';
import 'schema/monthly_pass_record.dart';
import 'schema/expense_transaction_record.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/device_record.dart';
export 'schema/outlet_record.dart';
export 'schema/invoice_record.dart';
export 'schema/business_type_record.dart';
export 'schema/businesss_master_record.dart';
export 'schema/user_profile_record.dart';
export 'schema/unit_type_record.dart';
export 'schema/category_master_record.dart';
export 'schema/product_master_record.dart';
export 'schema/service_point_record.dart';
export 'schema/tax_master_record.dart';
export 'schema/sub_category_record.dart';
export 'schema/language_record.dart';
export 'schema/payment_mode_record.dart';
export 'schema/user_roll_type_record.dart';
export 'schema/subscription_record.dart';
export 'schema/app_settings_record.dart';
export 'schema/print_settings_record.dart';
export 'schema/payment_record.dart';
export 'schema/party_record.dart';
export 'schema/shift_record.dart';
export 'schema/category_record.dart';
export 'schema/product_record.dart';
export 'schema/recipe_record.dart';
export 'schema/premises_record.dart';
export 'schema/company_details_record.dart';
export 'schema/about_us_record.dart';
export 'schema/contact_us_record.dart';
export 'schema/terms_and_conditions_record.dart';
export 'schema/service_point_outlet_record.dart';
export 'schema/header_record.dart';
export 'schema/purchase_record.dart';
export 'schema/user_role_type_record.dart';
export 'schema/online_orders_record.dart';
export 'schema/shrikant_product_record.dart';
export 'schema/cancellation_refund_policy_record.dart';
export 'schema/shipping_delivery_policy_record.dart';
export 'schema/privacy_policy_record.dart';
export 'schema/advertisement_record.dart';
export 'schema/footer_record.dart';
export 'schema/qr_transactions_record.dart';
export 'schema/app_settings_master_record.dart';
export 'schema/monthly_pass_record.dart';
export 'schema/expense_transaction_record.dart';

/// Functions to query DeviceRecords (as a Stream and as a Future).
Future<int> queryDeviceRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      DeviceRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<DeviceRecord>> queryDeviceRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DeviceRecord.collection,
      DeviceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DeviceRecord>> queryDeviceRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DeviceRecord.collection,
      DeviceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query OutletRecords (as a Stream and as a Future).
Future<int> queryOutletRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      OutletRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<OutletRecord>> queryOutletRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      OutletRecord.collection,
      OutletRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<OutletRecord>> queryOutletRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      OutletRecord.collection,
      OutletRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query InvoiceRecords (as a Stream and as a Future).
Future<int> queryInvoiceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      InvoiceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<InvoiceRecord>> queryInvoiceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      InvoiceRecord.collection(parent),
      InvoiceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<InvoiceRecord>> queryInvoiceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      InvoiceRecord.collection(parent),
      InvoiceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query BusinessTypeRecords (as a Stream and as a Future).
Future<int> queryBusinessTypeRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BusinessTypeRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BusinessTypeRecord>> queryBusinessTypeRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BusinessTypeRecord.collection,
      BusinessTypeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BusinessTypeRecord>> queryBusinessTypeRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BusinessTypeRecord.collection,
      BusinessTypeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query BusinesssMasterRecords (as a Stream and as a Future).
Future<int> queryBusinesssMasterRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BusinesssMasterRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BusinesssMasterRecord>> queryBusinesssMasterRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BusinesssMasterRecord.collection,
      BusinesssMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BusinesssMasterRecord>> queryBusinesssMasterRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BusinesssMasterRecord.collection,
      BusinesssMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UserProfileRecords (as a Stream and as a Future).
Future<int> queryUserProfileRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserProfileRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserProfileRecord>> queryUserProfileRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserProfileRecord.collection,
      UserProfileRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserProfileRecord>> queryUserProfileRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserProfileRecord.collection,
      UserProfileRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UnitTypeRecords (as a Stream and as a Future).
Future<int> queryUnitTypeRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UnitTypeRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UnitTypeRecord>> queryUnitTypeRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UnitTypeRecord.collection,
      UnitTypeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UnitTypeRecord>> queryUnitTypeRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UnitTypeRecord.collection,
      UnitTypeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CategoryMasterRecords (as a Stream and as a Future).
Future<int> queryCategoryMasterRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CategoryMasterRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CategoryMasterRecord>> queryCategoryMasterRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CategoryMasterRecord.collection,
      CategoryMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CategoryMasterRecord>> queryCategoryMasterRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CategoryMasterRecord.collection,
      CategoryMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ProductMasterRecords (as a Stream and as a Future).
Future<int> queryProductMasterRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ProductMasterRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ProductMasterRecord>> queryProductMasterRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ProductMasterRecord.collection,
      ProductMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ProductMasterRecord>> queryProductMasterRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ProductMasterRecord.collection,
      ProductMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ServicePointRecords (as a Stream and as a Future).
Future<int> queryServicePointRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ServicePointRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ServicePointRecord>> queryServicePointRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ServicePointRecord.collection,
      ServicePointRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ServicePointRecord>> queryServicePointRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ServicePointRecord.collection,
      ServicePointRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query TaxMasterRecords (as a Stream and as a Future).
Future<int> queryTaxMasterRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      TaxMasterRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<TaxMasterRecord>> queryTaxMasterRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TaxMasterRecord.collection,
      TaxMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TaxMasterRecord>> queryTaxMasterRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TaxMasterRecord.collection,
      TaxMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SubCategoryRecords (as a Stream and as a Future).
Future<int> querySubCategoryRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SubCategoryRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SubCategoryRecord>> querySubCategoryRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SubCategoryRecord.collection,
      SubCategoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SubCategoryRecord>> querySubCategoryRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SubCategoryRecord.collection,
      SubCategoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query LanguageRecords (as a Stream and as a Future).
Future<int> queryLanguageRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      LanguageRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<LanguageRecord>> queryLanguageRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      LanguageRecord.collection,
      LanguageRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<LanguageRecord>> queryLanguageRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      LanguageRecord.collection,
      LanguageRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PaymentModeRecords (as a Stream and as a Future).
Future<int> queryPaymentModeRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PaymentModeRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PaymentModeRecord>> queryPaymentModeRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PaymentModeRecord.collection,
      PaymentModeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PaymentModeRecord>> queryPaymentModeRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PaymentModeRecord.collection,
      PaymentModeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UserRollTypeRecords (as a Stream and as a Future).
Future<int> queryUserRollTypeRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserRollTypeRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserRollTypeRecord>> queryUserRollTypeRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserRollTypeRecord.collection,
      UserRollTypeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserRollTypeRecord>> queryUserRollTypeRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserRollTypeRecord.collection,
      UserRollTypeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SubscriptionRecords (as a Stream and as a Future).
Future<int> querySubscriptionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SubscriptionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SubscriptionRecord>> querySubscriptionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SubscriptionRecord.collection,
      SubscriptionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SubscriptionRecord>> querySubscriptionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SubscriptionRecord.collection,
      SubscriptionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AppSettingsRecords (as a Stream and as a Future).
Future<int> queryAppSettingsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AppSettingsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AppSettingsRecord>> queryAppSettingsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AppSettingsRecord.collection(parent),
      AppSettingsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AppSettingsRecord>> queryAppSettingsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AppSettingsRecord.collection(parent),
      AppSettingsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PrintSettingsRecords (as a Stream and as a Future).
Future<int> queryPrintSettingsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PrintSettingsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PrintSettingsRecord>> queryPrintSettingsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PrintSettingsRecord.collection(parent),
      PrintSettingsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PrintSettingsRecord>> queryPrintSettingsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PrintSettingsRecord.collection(parent),
      PrintSettingsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PaymentRecords (as a Stream and as a Future).
Future<int> queryPaymentRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PaymentRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PaymentRecord>> queryPaymentRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PaymentRecord.collection(parent),
      PaymentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PaymentRecord>> queryPaymentRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PaymentRecord.collection(parent),
      PaymentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PartyRecords (as a Stream and as a Future).
Future<int> queryPartyRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PartyRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PartyRecord>> queryPartyRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PartyRecord.collection(parent),
      PartyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PartyRecord>> queryPartyRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PartyRecord.collection(parent),
      PartyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ShiftRecords (as a Stream and as a Future).
Future<int> queryShiftRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ShiftRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ShiftRecord>> queryShiftRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ShiftRecord.collection(parent),
      ShiftRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ShiftRecord>> queryShiftRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ShiftRecord.collection(parent),
      ShiftRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CategoryRecords (as a Stream and as a Future).
Future<int> queryCategoryRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CategoryRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CategoryRecord>> queryCategoryRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CategoryRecord.collection(parent),
      CategoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CategoryRecord>> queryCategoryRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CategoryRecord.collection(parent),
      CategoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ProductRecords (as a Stream and as a Future).
Future<int> queryProductRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ProductRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ProductRecord>> queryProductRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ProductRecord.collection(parent),
      ProductRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ProductRecord>> queryProductRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ProductRecord.collection(parent),
      ProductRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query RecipeRecords (as a Stream and as a Future).
Future<int> queryRecipeRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RecipeRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RecipeRecord>> queryRecipeRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RecipeRecord.collection(parent),
      RecipeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RecipeRecord>> queryRecipeRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RecipeRecord.collection(parent),
      RecipeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PremisesRecords (as a Stream and as a Future).
Future<int> queryPremisesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PremisesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PremisesRecord>> queryPremisesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PremisesRecord.collection(parent),
      PremisesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PremisesRecord>> queryPremisesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PremisesRecord.collection(parent),
      PremisesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CompanyDetailsRecords (as a Stream and as a Future).
Future<int> queryCompanyDetailsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyDetailsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyDetailsRecord>> queryCompanyDetailsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyDetailsRecord.collection,
      CompanyDetailsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyDetailsRecord>> queryCompanyDetailsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyDetailsRecord.collection,
      CompanyDetailsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AboutUsRecords (as a Stream and as a Future).
Future<int> queryAboutUsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AboutUsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AboutUsRecord>> queryAboutUsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AboutUsRecord.collection(parent),
      AboutUsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AboutUsRecord>> queryAboutUsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AboutUsRecord.collection(parent),
      AboutUsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ContactUsRecords (as a Stream and as a Future).
Future<int> queryContactUsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ContactUsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ContactUsRecord>> queryContactUsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ContactUsRecord.collection(parent),
      ContactUsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ContactUsRecord>> queryContactUsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ContactUsRecord.collection(parent),
      ContactUsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query TermsAndConditionsRecords (as a Stream and as a Future).
Future<int> queryTermsAndConditionsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      TermsAndConditionsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<TermsAndConditionsRecord>> queryTermsAndConditionsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TermsAndConditionsRecord.collection(parent),
      TermsAndConditionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TermsAndConditionsRecord>> queryTermsAndConditionsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TermsAndConditionsRecord.collection(parent),
      TermsAndConditionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ServicePointOutletRecords (as a Stream and as a Future).
Future<int> queryServicePointOutletRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ServicePointOutletRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ServicePointOutletRecord>> queryServicePointOutletRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ServicePointOutletRecord.collection(parent),
      ServicePointOutletRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ServicePointOutletRecord>> queryServicePointOutletRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ServicePointOutletRecord.collection(parent),
      ServicePointOutletRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query HeaderRecords (as a Stream and as a Future).
Future<int> queryHeaderRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      HeaderRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<HeaderRecord>> queryHeaderRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      HeaderRecord.collection(parent),
      HeaderRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<HeaderRecord>> queryHeaderRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      HeaderRecord.collection(parent),
      HeaderRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PurchaseRecords (as a Stream and as a Future).
Future<int> queryPurchaseRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PurchaseRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PurchaseRecord>> queryPurchaseRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PurchaseRecord.collection(parent),
      PurchaseRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PurchaseRecord>> queryPurchaseRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PurchaseRecord.collection(parent),
      PurchaseRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UserRoleTypeRecords (as a Stream and as a Future).
Future<int> queryUserRoleTypeRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserRoleTypeRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserRoleTypeRecord>> queryUserRoleTypeRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserRoleTypeRecord.collection,
      UserRoleTypeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserRoleTypeRecord>> queryUserRoleTypeRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserRoleTypeRecord.collection,
      UserRoleTypeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query OnlineOrdersRecords (as a Stream and as a Future).
Future<int> queryOnlineOrdersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      OnlineOrdersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<OnlineOrdersRecord>> queryOnlineOrdersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      OnlineOrdersRecord.collection,
      OnlineOrdersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<OnlineOrdersRecord>> queryOnlineOrdersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      OnlineOrdersRecord.collection,
      OnlineOrdersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ShrikantProductRecords (as a Stream and as a Future).
Future<int> queryShrikantProductRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ShrikantProductRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ShrikantProductRecord>> queryShrikantProductRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ShrikantProductRecord.collection,
      ShrikantProductRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ShrikantProductRecord>> queryShrikantProductRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ShrikantProductRecord.collection,
      ShrikantProductRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CancellationRefundPolicyRecords (as a Stream and as a Future).
Future<int> queryCancellationRefundPolicyRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CancellationRefundPolicyRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CancellationRefundPolicyRecord>>
    queryCancellationRefundPolicyRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          CancellationRefundPolicyRecord.collection(parent),
          CancellationRefundPolicyRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<CancellationRefundPolicyRecord>>
    queryCancellationRefundPolicyRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          CancellationRefundPolicyRecord.collection(parent),
          CancellationRefundPolicyRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query ShippingDeliveryPolicyRecords (as a Stream and as a Future).
Future<int> queryShippingDeliveryPolicyRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ShippingDeliveryPolicyRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ShippingDeliveryPolicyRecord>> queryShippingDeliveryPolicyRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ShippingDeliveryPolicyRecord.collection(parent),
      ShippingDeliveryPolicyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ShippingDeliveryPolicyRecord>>
    queryShippingDeliveryPolicyRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          ShippingDeliveryPolicyRecord.collection(parent),
          ShippingDeliveryPolicyRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query PrivacyPolicyRecords (as a Stream and as a Future).
Future<int> queryPrivacyPolicyRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PrivacyPolicyRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PrivacyPolicyRecord>> queryPrivacyPolicyRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PrivacyPolicyRecord.collection(parent),
      PrivacyPolicyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PrivacyPolicyRecord>> queryPrivacyPolicyRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PrivacyPolicyRecord.collection(parent),
      PrivacyPolicyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AdvertisementRecords (as a Stream and as a Future).
Future<int> queryAdvertisementRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AdvertisementRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AdvertisementRecord>> queryAdvertisementRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AdvertisementRecord.collection(parent),
      AdvertisementRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AdvertisementRecord>> queryAdvertisementRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AdvertisementRecord.collection(parent),
      AdvertisementRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query FooterRecords (as a Stream and as a Future).
Future<int> queryFooterRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FooterRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FooterRecord>> queryFooterRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FooterRecord.collection(parent),
      FooterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FooterRecord>> queryFooterRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FooterRecord.collection(parent),
      FooterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query QrTransactionsRecords (as a Stream and as a Future).
Future<int> queryQrTransactionsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      QrTransactionsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<QrTransactionsRecord>> queryQrTransactionsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      QrTransactionsRecord.collection(parent),
      QrTransactionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<QrTransactionsRecord>> queryQrTransactionsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      QrTransactionsRecord.collection(parent),
      QrTransactionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AppSettingsMasterRecords (as a Stream and as a Future).
Future<int> queryAppSettingsMasterRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AppSettingsMasterRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AppSettingsMasterRecord>> queryAppSettingsMasterRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AppSettingsMasterRecord.collection,
      AppSettingsMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AppSettingsMasterRecord>> queryAppSettingsMasterRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AppSettingsMasterRecord.collection,
      AppSettingsMasterRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query MonthlyPassRecords (as a Stream and as a Future).
Future<int> queryMonthlyPassRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MonthlyPassRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MonthlyPassRecord>> queryMonthlyPassRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MonthlyPassRecord.collection(parent),
      MonthlyPassRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MonthlyPassRecord>> queryMonthlyPassRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MonthlyPassRecord.collection(parent),
      MonthlyPassRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ExpenseTransactionRecords (as a Stream and as a Future).
Future<int> queryExpenseTransactionRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ExpenseTransactionRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ExpenseTransactionRecord>> queryExpenseTransactionRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ExpenseTransactionRecord.collection(parent),
      ExpenseTransactionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ExpenseTransactionRecord>> queryExpenseTransactionRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ExpenseTransactionRecord.collection(parent),
      ExpenseTransactionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UserProfileRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UserProfileRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUserProfileRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument =
      UserProfileRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUserProfileRecordData(email: email));
}
