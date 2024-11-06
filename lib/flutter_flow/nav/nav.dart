import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? WelcomeScreenParkingWidget()
          : StartScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? WelcomeScreenParkingWidget()
              : StartScreenWidget(),
          routes: [
            FFRoute(
              name: 'welcomeScreen',
              path: 'welcomeScreen',
              builder: (context, params) => WelcomeScreenWidget(),
            ),
            FFRoute(
              name: 'WiFiSetting',
              path: 'wiFiSetting',
              builder: (context, params) => WiFiSettingWidget(),
            ),
            FFRoute(
              name: 'SettingHomepage',
              path: 'settingHomepage',
              builder: (context, params) => SettingHomepageWidget(),
            ),
            FFRoute(
              name: 'ResetData',
              path: 'resetData',
              builder: (context, params) => ResetDataWidget(),
            ),
            FFRoute(
              name: 'CategoryReport',
              path: 'categoryReport',
              builder: (context, params) => CategoryReportWidget(),
            ),
            FFRoute(
              name: 'SubscriptionNew',
              path: 'subscriptionNew',
              builder: (context, params) => SubscriptionNewWidget(),
            ),
            FFRoute(
              name: 'ShiftEndNew',
              path: 'shiftEndNew',
              builder: (context, params) => ShiftEndNewWidget(),
            ),
            FFRoute(
              name: 'BillReportNew',
              path: 'billReportNew',
              builder: (context, params) => BillReportNewWidget(),
            ),
            FFRoute(
              name: 'AppSetting',
              path: 'appSetting',
              builder: (context, params) => AppSettingWidget(),
            ),
            FFRoute(
              name: 'ReportScreenNew',
              path: 'reportScreenNew',
              asyncParams: {
                'tax': getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ReportScreenNewWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetail: params.getParam(
                  'shiftDetail',
                  ParamType.JSON,
                ),
                tax: params.getParam<TaxMasterRecord>(
                  'tax',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'GSTReport',
              path: 'gSTReport',
              builder: (context, params) => GSTReportWidget(),
            ),
            FFRoute(
              name: 'PrintOptions',
              path: 'printOptions',
              builder: (context, params) => PrintOptionsWidget(),
            ),
            FFRoute(
              name: 'PaymentScreen',
              path: 'paymentScreen',
              builder: (context, params) => PaymentScreenWidget(),
            ),
            FFRoute(
              name: 'SystemUpdate',
              path: 'systemUpdate',
              builder: (context, params) => SystemUpdateWidget(),
            ),
            FFRoute(
              name: 'AddProduct',
              path: 'addProduct',
              builder: (context, params) => AddProductWidget(),
            ),
            FFRoute(
              name: 'AddCustomer',
              path: 'addCustomer',
              builder: (context, params) => AddCustomerWidget(),
            ),
            FFRoute(
              name: 'LoginPageSetting',
              path: 'loginPageSetting',
              builder: (context, params) => LoginPageSettingWidget(),
            ),
            FFRoute(
              name: 'TodaySummerReportNew',
              path: 'todaySummerReportNew',
              asyncParams: {
                'shift':
                    getDocList(['OUTLET', 'SHIFT'], ShiftRecord.fromSnapshot),
              },
              builder: (context, params) => TodaySummerReportNewWidget(
                shift: params.getParam<ShiftRecord>(
                  'shift',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'FSQR',
              path: 'fsqr',
              builder: (context, params) => FsqrWidget(
                json: params.getParam(
                  'json',
                  ParamType.JSON,
                ),
                orderId: params.getParam(
                  'orderId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ProductWiseReport',
              path: 'productWiseReport',
              builder: (context, params) => ProductWiseReportWidget(),
            ),
            FFRoute(
              name: 'Bill',
              path: 'bill',
              builder: (context, params) => BillWidget(
                docRef: params.getParam(
                  'docRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
              ),
            ),
            FFRoute(
              name: 'TableScreen',
              path: 'tableScreen',
              builder: (context, params) => TableScreenWidget(),
            ),
            FFRoute(
              name: 'DayWiseShiftReport',
              path: 'dayWiseShiftReport',
              builder: (context, params) => DayWiseShiftReportWidget(),
            ),
            FFRoute(
              name: 'FullScreenQR',
              path: 'fullScreenQR',
              builder: (context, params) => FullScreenQRWidget(),
            ),
            FFRoute(
              name: 'FullScreenBill',
              path: 'fullScreenBill',
              builder: (context, params) => FullScreenBillWidget(),
            ),
            FFRoute(
              name: 'PrinterSelectionScreen',
              path: 'printerSelectionScreen',
              builder: (context, params) => PrinterSelectionScreenWidget(
                docHeaderRef: params.getParam(
                  'docHeaderRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'HEADER'],
                ),
              ),
            ),
            FFRoute(
              name: 'FSBill',
              path: 'fSBill',
              builder: (context, params) => FSBillWidget(),
            ),
            FFRoute(
              name: 'BarcodePrinting',
              path: 'barcodePrinting',
              builder: (context, params) => BarcodePrintingWidget(),
            ),
            FFRoute(
              name: 'UpdateProduct',
              path: 'updateProduct',
              builder: (context, params) => UpdateProductWidget(
                productRef: params.getParam(
                  'productRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PRODUCT'],
                ),
              ),
            ),
            FFRoute(
              name: 'EditCustomer',
              path: 'editCustomer',
              builder: (context, params) => EditCustomerWidget(
                custRef: params.getParam(
                  'custRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
              ),
            ),
            FFRoute(
              name: 'AppSettingNew',
              path: 'appSettingNew',
              builder: (context, params) => AppSettingNewWidget(),
            ),
            FFRoute(
              name: 'LoadingScreen',
              path: 'loadingScreen',
              asyncParams: {
                'appSettingDoc': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => LoadingScreenWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSettingDoc: params.getParam(
                  'appSettingDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'DigitalOrder',
              path: 'digitalOrder',
              builder: (context, params) => DigitalOrderWidget(),
            ),
            FFRoute(
              name: 'RegularAppSetting',
              path: 'regularAppSetting',
              builder: (context, params) => RegularAppSettingWidget(),
            ),
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(
                deviceDocId: params.getParam(
                  'deviceDocId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'EditBill',
              path: 'editBill',
              builder: (context, params) => EditBillWidget(
                billRef: params.getParam(
                  'billRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
              ),
            ),
            FFRoute(
              name: 'imsInwardOutward',
              path: 'imsInwardOutward',
              builder: (context, params) => ImsInwardOutwardWidget(),
            ),
            FFRoute(
              name: 'imsProduction',
              path: 'imsProduction',
              builder: (context, params) => ImsProductionWidget(),
            ),
            FFRoute(
              name: 'ProductAndList',
              path: 'productAndList',
              builder: (context, params) => ProductAndListWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: 'imsService',
              path: 'imsService',
              builder: (context, params) => ImsServiceWidget(),
            ),
            FFRoute(
              name: 'GoodsReceived',
              path: 'goodsReceived',
              builder: (context, params) => GoodsReceivedWidget(),
            ),
            FFRoute(
              name: 'imsOpeningStock',
              path: 'imsOpeningStock',
              builder: (context, params) => ImsOpeningStockWidget(),
            ),
            FFRoute(
              name: 'StartScreen',
              path: 'startScreen',
              builder: (context, params) => StartScreenWidget(),
            ),
            FFRoute(
              name: 'productSaleTesting',
              path: 'productSaleTesting',
              builder: (context, params) => ProductSaleTestingWidget(),
            ),
            FFRoute(
              name: 'categorySaleReport',
              path: 'categorySaleReport',
              builder: (context, params) => CategorySaleReportWidget(),
            ),
            FFRoute(
              name: 'OnboardingScreen',
              path: 'onboardingScreen',
              builder: (context, params) => OnboardingScreenWidget(),
            ),
            FFRoute(
              name: 'ProductAndListWIN',
              path: 'productAndListWIN',
              builder: (context, params) => ProductAndListWINWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: 'welcomeScreenNew',
              path: 'welcomeScreenNew',
              builder: (context, params) => WelcomeScreenNewWidget(),
            ),
            FFRoute(
              name: 'LoginPageNew',
              path: 'loginPageNew',
              builder: (context, params) => LoginPageNewWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: 'loadingScreenNew',
              path: 'loadingScreenNew',
              asyncParams: {
                'appSettingDoc': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => LoadingScreenNewWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSettingDoc: params.getParam(
                  'appSettingDoc',
                  ParamType.Document,
                ),
                outletRef: params.getParam(
                  'outletRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'ProductAndListNew',
              path: 'productAndListNew',
              asyncParams: {
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ProductAndListNewWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'UpdateProductNew',
              path: 'updateProductNew',
              builder: (context, params) => UpdateProductNewWidget(
                hivekey: params.getParam(
                  'hivekey',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'AddProductNewPos',
              path: 'addProductNew',
              builder: (context, params) => AddProductNewPosWidget(),
            ),
            FFRoute(
              name: 'ShiftEndNew2',
              path: 'shiftEndNew2',
              builder: (context, params) => ShiftEndNew2Widget(),
            ),
            FFRoute(
              name: 'EditBillNew',
              path: 'editBillNew',
              builder: (context, params) => EditBillNewWidget(
                billRef: params.getParam(
                  'billRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
              ),
            ),
            FFRoute(
              name: 'printSettingkiosk',
              path: 'printSettingkiosk',
              builder: (context, params) => PrintSettingkioskWidget(),
            ),
            FFRoute(
              name: 'ProductAndListNewCopy',
              path: 'productAndListNewCopy',
              asyncParams: {
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ProductAndListNewCopyWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskPayment',
              path: 'kioskPayment',
              asyncParams: {
                'appsettings': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskPaymentWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                qrJson: params.getParam(
                  'qrJson',
                  ParamType.JSON,
                ),
                paytmOrderId: params.getParam(
                  'paytmOrderId',
                  ParamType.String,
                ),
                isPaytm: params.getParam(
                  'isPaytm',
                  ParamType.bool,
                ),
                appsettings: params.getParam(
                  'appsettings',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskCart',
              path: 'kioskCart',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskCartWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'BarcodePrintingCopy',
              path: 'barcodePrintingCopy',
              builder: (context, params) => BarcodePrintingCopyWidget(),
            ),
            FFRoute(
              name: 'AboutUs',
              path: 'aboutUs',
              builder: (context, params) => AboutUsWidget(),
            ),
            FFRoute(
              name: 'KioskBillScreen',
              path: 'kioskBillScreen',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskBillScreenWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                billdetails: params.getParam(
                  'billdetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'phoneAuthPage',
              path: 'phoneAuthPage',
              builder: (context, params) => PhoneAuthPageWidget(),
            ),
            FFRoute(
              name: 'OTPverificationNewP',
              path: 'oTPverificationNewP',
              asyncParams: {
                'userDoc':
                    getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
              },
              builder: (context, params) => OTPverificationNewPWidget(
                isMobileExists: params.getParam(
                  'isMobileExists',
                  ParamType.bool,
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.Document,
                ),
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'businessProfileAdminfinal',
              path: 'businessProfileAdminfinal',
              builder: (context, params) => BusinessProfileAdminfinalWidget(
                mobileNo: params.getParam(
                  'mobileNo',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'outletlistPage',
              path: 'outletlistPage',
              builder: (context, params) => OutletlistPageWidget(
                mobileNo: params.getParam(
                  'mobileNo',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'addOutletPage',
              path: 'addOutletPage',
              builder: (context, params) => AddOutletPageWidget(
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'CreateUserProfileNewP',
              path: 'createUserProfileNewP',
              builder: (context, params) => CreateUserProfileNewPWidget(
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'AddBusinessProfile',
              path: 'addBusinessProfile',
              builder: (context, params) => AddBusinessProfileWidget(
                premiseRef: params.getParam(
                  'premiseRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PREMISES'],
                ),
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'editBusinesProfile',
              path: 'editBusinesProfile',
              builder: (context, params) => EditBusinesProfileWidget(
                businessMRef: params.getParam(
                  'businessMRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['BUSINESSS_MASTER'],
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'account',
              path: 'account',
              builder: (context, params) => AccountWidget(
                isList: params.getParam(
                  'isList',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'editUserprofile',
              path: 'editUserprofile',
              asyncParams: {
                'docRef':
                    getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
              },
              builder: (context, params) => EditUserprofileWidget(
                docRef: params.getParam(
                  'docRef',
                  ParamType.Document,
                ),
                nextP: params.getParam(
                  'nextP',
                  ParamType.int,
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'mastersNew',
              path: 'mastersNew',
              builder: (context, params) => MastersNewWidget(
                isListSelected: params.getParam(
                  'isListSelected',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'categories',
              path: 'categories',
              builder: (context, params) => CategoriesWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'productListNewM',
              path: 'productListNewM',
              builder: (context, params) => ProductListNewMWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'editproductNewM',
              path: 'editproductNewM',
              asyncParams: {
                'productDocument':
                    getDoc(['OUTLET', 'PRODUCT'], ProductRecord.fromSnapshot),
              },
              builder: (context, params) => EditproductNewMWidget(
                codeLen: params.getParam(
                  'codeLen',
                  ParamType.int,
                ),
                proRef: params.getParam(
                  'proRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PRODUCT'],
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                productDocument: params.getParam(
                  'productDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'addproductAPP',
              path: 'addproductApp',
              builder: (context, params) => AddproductAPPWidget(
                catcodeLen: params.getParam(
                  'catcodeLen',
                  ParamType.int,
                ),
                proRef: params.getParam(
                  'proRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PRODUCT'],
                ),
              ),
            ),
            FFRoute(
              name: 'editCategoryM',
              path: 'editCategoryM',
              builder: (context, params) => EditCategoryMWidget(
                catRef: params.getParam(
                  'catRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'CATEGORY'],
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'addCategoryM',
              path: 'addCategoryM',
              builder: (context, params) => AddCategoryMWidget(
                codeLen: params.getParam(
                  'codeLen',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'ParkingCheckIN',
              path: 'parkingCheckIN',
              builder: (context, params) => ParkingCheckINWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
              ),
            ),
            FFRoute(
              name: 'ParkingCustomers',
              path: 'parkingCustomers',
              builder: (context, params) => ParkingCustomersWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
              ),
            ),
            FFRoute(
              name: 'ParkingProduct',
              path: 'parkingProduct',
              builder: (context, params) => ParkingProductWidget(
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
              ),
            ),
            FFRoute(
              name: 'dummytest',
              path: 'dummytest',
              builder: (context, params) => DummytestWidget(),
            ),
            FFRoute(
              name: 'editUserPermission',
              path: 'editUserPermission',
              builder: (context, params) => EditUserPermissionWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
              ),
            ),
            FFRoute(
              name: 'ParkingProductCopy',
              path: 'parkingProductCopy',
              builder: (context, params) => ParkingProductCopyWidget(),
            ),
            FFRoute(
              name: 'welcomeScreenParking',
              path: 'welcomeScreenParking',
              asyncParams: {
                'deviceDoc': getDoc(['DEVICE'], DeviceRecord.fromSnapshot),
                'appSettings': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => WelcomeScreenParkingWidget(
                deviceDoc: params.getParam(
                  'deviceDoc',
                  ParamType.Document,
                ),
                appSettings: params.getParam(
                  'appSettings',
                  ParamType.Document,
                ),
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'demo',
              path: 'demo',
              builder: (context, params) => DemoWidget(),
            ),
            FFRoute(
              name: 'PrintersettingCar',
              path: 'printersettingCar',
              builder: (context, params) => PrintersettingCarWidget(),
            ),
            FFRoute(
              name: 'imsDashboardCopy',
              path: 'imsDashboardCopy',
              builder: (context, params) => ImsDashboardCopyWidget(),
            ),
            FFRoute(
              name: 'subscriptionNew2',
              path: 'subscriptionNew2',
              builder: (context, params) => SubscriptionNew2Widget(),
            ),
            FFRoute(
              name: 'Deviceqr',
              path: 'deviceqr',
              builder: (context, params) => DeviceqrWidget(),
            ),
            FFRoute(
              name: 'parkingReport',
              path: 'parkingReport',
              builder: (context, params) => ParkingReportWidget(
                quickPin: params.getParam(
                  'quickPin',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'responsePage',
              path: 'responsePage',
              asyncParams: {
                'doc': getDoc(['OUTLET', 'QR_TRANSACTIONS'],
                    QrTransactionsRecord.fromSnapshot),
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcoollectipon':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ResponsePageWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.Document,
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcoollectipon: params.getParam<TaxMasterRecord>(
                  'taxcoollectipon',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskWelcome',
              path: 'kioskWelcome',
              builder: (context, params) => KioskWelcomeWidget(),
            ),
            FFRoute(
              name: 'KioskDineParcel',
              path: 'kioskDineParcel',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskDineParcelWidget(
                userdoc: params.getParam(
                  'userdoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskAdvertising',
              path: 'kioskAdvertising',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskAdvertisingWidget(
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskLogin',
              path: 'kioskLogin',
              builder: (context, params) => KioskLoginWidget(
                billDetails: params.getParam(
                  'billDetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftDetails: params.getParam(
                  'shiftDetails',
                  ParamType.JSON,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskSplashScreen',
              path: 'kioskSplashScreen',
              builder: (context, params) => KioskSplashScreenWidget(),
            ),
            FFRoute(
              name: 'loadingScreenkiosknew',
              path: 'loadingScreenkiosknew',
              asyncParams: {
                'appSettingDoc': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => LoadingScreenkiosknewWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSettingDoc: params.getParam(
                  'appSettingDoc',
                  ParamType.Document,
                ),
                outletRef: params.getParam(
                  'outletRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'labeltest',
              path: 'labeltest',
              builder: (context, params) => LabeltestWidget(),
            ),
            FFRoute(
              name: 'KotOrderScreen',
              path: 'kotOrderScreen',
              builder: (context, params) => KotOrderScreenWidget(),
            ),
            FFRoute(
              name: 'SplashScreenWindows',
              path: 'splashScreenWindows',
              builder: (context, params) => SplashScreenWindowsWidget(),
            ),
            FFRoute(
              name: 'WindowsLogin',
              path: 'windowsLogin',
              builder: (context, params) => WindowsLoginWidget(),
            ),
            FFRoute(
              name: 'TokenDisplay',
              path: 'tokenDisplay',
              builder: (context, params) => TokenDisplayWidget(),
            ),
            FFRoute(
              name: 'AppSettingNewPos',
              path: 'appSettingNewPos',
              builder: (context, params) => AppSettingNewPosWidget(),
            ),
            FFRoute(
              name: 'PurchaseGrocery',
              path: 'purchaseGrocery',
              requireAuth: true,
              builder: (context, params) => PurchaseGroceryWidget(),
            ),
            FFRoute(
              name: 'responsePageCopy',
              path: 'responsePageCopy',
              asyncParams: {
                'doc': getDoc(['OUTLET', 'QR_TRANSACTIONS'],
                    QrTransactionsRecord.fromSnapshot),
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcoollectipon':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ResponsePageCopyWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.Document,
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcoollectipon: params.getParam<TaxMasterRecord>(
                  'taxcoollectipon',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'phonePeQr',
              path: 'phonePeQr',
              builder: (context, params) => PhonePeQrWidget(
                data: params.getParam(
                  'data',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'BillingGroceryNew',
              path: 'billingGroceryNew',
              asyncParams: {
                'taxDetails':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => BillingGroceryNewWidget(
                shiftdetail: params.getParam(
                  'shiftdetail',
                  ParamType.JSON,
                ),
                taxDetails: params.getParam<TaxMasterRecord>(
                  'taxDetails',
                  ParamType.Document,
                  isList: true,
                ),
                userref: params.getParam(
                  'userref',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
              ),
            ),
            FFRoute(
              name: 'KioskPaymentCopy',
              path: 'kioskPaymentCopy',
              builder: (context, params) => KioskPaymentCopyWidget(
                data: params.getParam(
                  'data',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'NumberPlateScanner',
              path: 'numberPlateScanner',
              builder: (context, params) => NumberPlateScannerWidget(),
            ),
            FFRoute(
              name: 'billwisesalereport',
              path: 'billwisesalereport',
              builder: (context, params) => BillwisesalereportWidget(),
            ),
            FFRoute(
              name: 'categoryWiseSaleReport',
              path: 'categoryWiseSaleReport',
              builder: (context, params) => CategoryWiseSaleReportWidget(),
            ),
            FFRoute(
              name: 'productWiseSaleReport',
              path: 'productWiseSaleReport',
              builder: (context, params) => ProductWiseSaleReportWidget(
                docRef: params.getParam(
                  'docRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
              ),
            ),
            FFRoute(
              name: 'dayWiseSaleReport',
              path: 'dayWiseSaleReport',
              builder: (context, params) => DayWiseSaleReportWidget(),
            ),
            FFRoute(
              name: 'billDetails',
              path: 'billDetails',
              builder: (context, params) => BillDetailsWidget(
                docRef: params.getParam(
                  'docRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
              ),
            ),
            FFRoute(
              name: 'dashboard',
              path: 'dashboard',
              builder: (context, params) => DashboardWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
                shiftRef: params.getParam(
                  'shiftRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'SHIFT'],
                ),
                userId: params.getParam(
                  'userId',
                  ParamType.String,
                ),
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'productWiseSaleReportCopy',
              path: 'productWiseSaleReportCopy',
              builder: (context, params) => ProductWiseSaleReportCopyWidget(),
            ),
            FFRoute(
              name: 'addCustomer1',
              path: 'addCustomer1',
              builder: (context, params) => AddCustomer1Widget(),
            ),
            FFRoute(
              name: 'MonthlyPass',
              path: 'monthlyPass',
              builder: (context, params) => MonthlyPassWidget(),
            ),
            FFRoute(
              name: 'PassDetails',
              path: 'passDetails',
              builder: (context, params) => PassDetailsWidget(),
            ),
            FFRoute(
              name: 'vehicleWiseSaleReport',
              path: 'vehicleWiseSaleReport',
              builder: (context, params) => VehicleWiseSaleReportWidget(),
            ),
            FFRoute(
              name: 'VehicleEntry',
              path: 'vehicleEntry',
              builder: (context, params) => VehicleEntryWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
              ),
            ),
            FFRoute(
              name: 'BillEntry',
              path: 'billEntry',
              builder: (context, params) => BillEntryWidget(
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
              ),
            ),
            FFRoute(
              name: 'Unbilled',
              path: 'unbilled1',
              builder: (context, params) => UnbilledWidget(),
            ),
            FFRoute(
              name: 'Unbilled2',
              path: 'Unbilled',
              builder: (context, params) => Unbilled2Widget(),
            ),
            FFRoute(
              name: 'parkingReportNew',
              path: 'parkingReportNew',
              builder: (context, params) => ParkingReportNewWidget(
                quickPin: params.getParam(
                  'quickPin',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'vehicleWiseSale2',
              path: 'vehicleWiseSale2',
              builder: (context, params) => VehicleWiseSale2Widget(),
            ),
            FFRoute(
              name: 'Unbilled2Copy',
              path: 'Unbilled',
              builder: (context, params) => Unbilled2CopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/startScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitFadingCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
