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

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? ParkingLoginWidget()
          : StartScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? ParkingLoginWidget()
              : StartScreenWidget(),
          routes: [
            FFRoute(
              name: 'StartScreen',
              path: 'startScreen',
              builder: (context, params) => StartScreenWidget(),
            ),
            FFRoute(
              name: 'phoneAuthPage',
              path: 'phoneAuthPage',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => PhoneAuthPageWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'OTPverificationNewP',
              path: 'oTPverificationNewP',
              asyncParams: {
                'userDoc':
                    getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'businessProfileAdminfinal',
              path: 'businessProfileAdminfinal',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => BusinessProfileAdminfinalWidget(
                mobileNo: params.getParam(
                  'mobileNo',
                  ParamType.String,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'outletlistPage',
              path: 'outletlistPage',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => OutletlistPageWidget(
                mobileNo: params.getParam(
                  'mobileNo',
                  ParamType.String,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'addOutletPage',
              path: 'addOutletPage',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => AddOutletPageWidget(
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'CreateUserProfileNewP',
              path: 'createUserProfileNewP',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => CreateUserProfileNewPWidget(
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'AddBusinessProfile',
              path: 'addBusinessProfile',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'editBusinesProfile',
              path: 'editBusinesProfile',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'account',
              path: 'account',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => AccountWidget(
                isList: params.getParam(
                  'isList',
                  ParamType.bool,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'editUserprofile',
              path: 'editUserprofile',
              asyncParams: {
                'docRef':
                    getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'mastersNew',
              path: 'mastersNew',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => MastersNewWidget(
                isListSelected: params.getParam(
                  'isListSelected',
                  ParamType.bool,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'categories',
              path: 'categories',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => CategoriesWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'productListNewM',
              path: 'productListNewM',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => ProductListNewMWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'editproductNewM',
              path: 'editproductNewM',
              asyncParams: {
                'productDocument':
                    getDoc(['OUTLET', 'PRODUCT'], ProductRecord.fromSnapshot),
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'addproductAPP',
              path: 'addproductApp',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'editCategoryM',
              path: 'editCategoryM',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'addCategoryM',
              path: 'addCategoryM',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => AddCategoryMWidget(
                codeLen: params.getParam(
                  'codeLen',
                  ParamType.int,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'ParkingCheckIN',
              path: 'parkingCheckIN',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
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
              name: 'ParkingIconCheckin',
              path: 'parkingIconCheckin',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => ParkingIconCheckinWidget(
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'editUserPermission',
              path: 'editUserPermission',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => EditUserPermissionWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
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
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => WelcomeScreenParkingWidget(
                deviceDoc: params.getParam(
                  'deviceDoc',
                  ParamType.Document,
                ),
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
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
                outletRef: params.getParam(
                  'outletRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'PrintersettingCar',
              path: 'printersettingCar',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => PrintersettingCarWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'subscriptionNew2',
              path: 'subscriptionNew2',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => SubscriptionNew2Widget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Deviceqr',
              path: 'deviceqr',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => DeviceqrWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'NumberPlateScanner',
              path: 'numberPlateScanner',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => NumberPlateScannerWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'billwisesalereport',
              path: 'billwisesalereport',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => BillwisesalereportWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
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
              name: 'dashboard',
              path: 'dashboard',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'addCustomer1',
              path: 'addCustomer1',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => AddCustomer1Widget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'PassDetails',
              path: 'passDetails',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => PassDetailsWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'vehicleWiseSaleReport',
              path: 'vehicleWiseSaleReport',
              builder: (context, params) => VehicleWiseSaleReportWidget(),
            ),
            FFRoute(
              name: 'VehicleEntry',
              path: 'vehicleEntry',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'BillEntry',
              path: 'billEntry',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
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
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'parkingReportNew',
              path: 'parkingReportNew',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => ParkingReportNewWidget(
                quickPin: params.getParam(
                  'quickPin',
                  ParamType.String,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'vehicleWiseSale2',
              path: 'vehicleWiseSale2',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => VehicleWiseSale2Widget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Unbilled2',
              path: 'Unbilled5',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => Unbilled2Widget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'InOutReport',
              path: 'inOut',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => InOutReportWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'TodaysSummaryReport',
              path: 'todaysSummaryReport',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => TodaysSummaryReportWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'DaillyCollectionReport',
              path: 'daillyCollectionReport',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => DaillyCollectionReportWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'MonthlyPass2',
              path: 'monthlyPass2',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => MonthlyPass2Widget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'WebDashboard',
              path: 'webDashboard',
              builder: (context, params) => WebDashboardWidget(
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
              name: 'WebOutletListPage',
              path: 'webOutletListPage',
              builder: (context, params) => WebOutletListPageWidget(
                mobileNo: params.getParam(
                  'mobileNo',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'WebCategoryList',
              path: 'webCategoryList',
              builder: (context, params) => WebCategoryListWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'WebAddCategory',
              path: 'webAddCategory',
              builder: (context, params) => WebAddCategoryWidget(
                codeLen: params.getParam(
                  'codeLen',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'WebEditCategory',
              path: 'webEditCategory',
              builder: (context, params) => WebEditCategoryWidget(
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
              name: 'WebVehicleWiseSaleReport',
              path: 'webVehicleWiseSaleReport',
              builder: (context, params) => WebVehicleWiseSaleReportWidget(),
            ),
            FFRoute(
              name: 'WebInOutReport',
              path: 'WebInOut',
              builder: (context, params) => WebInOutReportWidget(),
            ),
            FFRoute(
              name: 'WebTodaysSummaryReport',
              path: 'webTodaysSummaryReport',
              builder: (context, params) => WebTodaysSummaryReportWidget(),
            ),
            FFRoute(
              name: 'WebBillwisesaleReport',
              path: 'webBillwisesaleReport',
              builder: (context, params) => WebBillwisesaleReportWidget(),
            ),
            FFRoute(
              name: 'WebDailyCollectionReport',
              path: 'webDailyCollectionReport',
              builder: (context, params) => WebDailyCollectionReportWidget(),
            ),
            FFRoute(
              name: 'WebUnbilledReceipts',
              path: 'webUnbilledReceipts',
              builder: (context, params) => WebUnbilledReceiptsWidget(),
            ),
            FFRoute(
              name: 'WebPassDetails',
              path: 'webPassDetails',
              builder: (context, params) => WebPassDetailsWidget(),
            ),
            FFRoute(
              name: 'WebUserwiseReport',
              path: 'webUserwiseReport',
              asyncParams: {
                'docRef': getDoc(['OUTLET', 'SHIFT'], ShiftRecord.fromSnapshot),
              },
              builder: (context, params) => WebUserwiseReportWidget(
                docRef: params.getParam(
                  'docRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'WebProductListNewM',
              path: 'webProductListNewM',
              builder: (context, params) => WebProductListNewMWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'WebAddproductAPP',
              path: 'webaddVehicleApp',
              builder: (context, params) => WebAddproductAPPWidget(
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
              name: 'WebEditproductNewM',
              path: 'webEditproductNewM',
              asyncParams: {
                'productDocument':
                    getDoc(['OUTLET', 'PRODUCT'], ProductRecord.fromSnapshot),
              },
              builder: (context, params) => WebEditproductNewMWidget(
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
              name: 'webLogin',
              path: 'webLogin',
              builder: (context, params) => WebLoginWidget(),
            ),
            FFRoute(
              name: 'UserAccount',
              path: 'userAccount',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => UserAccountWidget(
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'AddUser',
              path: 'addUser',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => AddUserWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'ParkingLogin',
              path: 'parkingLogin',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'userRef':
                    getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
              },
              builder: (context, params) => ParkingLoginWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.JSON,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'EditOutletPage',
              path: 'editOutletPage',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => EditOutletPageWidget(
                outletRef: params.getParam(
                  'outletRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                docRef: params.getParam(
                  'docRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'EditBillList',
              path: 'editBillList',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => EditBillListWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'editBillDetails',
              path: 'editBillDetails',
              asyncParams: {
                'invdoc':
                    getDoc(['OUTLET', 'INVOICE'], InvoiceRecord.fromSnapshot),
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => EditBillDetailsWidget(
                docRef: params.getParam(
                  'docRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                invdoc: params.getParam(
                  'invdoc',
                  ParamType.Document,
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'WebVehicleWiseSale2',
              path: 'webVehicleWiseSale2',
              builder: (context, params) => WebVehicleWiseSale2Widget(),
            ),
            FFRoute(
              name: 'AppSettings',
              path: 'appSettings',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => AppSettingsWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'ShiftEnd',
              path: 'shiftEnd',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'userRef':
                    getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
              },
              builder: (context, params) => ShiftEndWidget(
                setting: params.getParam(
                  'setting',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: AppSettingsStruct.fromSerializableMap,
                ),
                shiftDetail: params.getParam(
                  'shiftDetail',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                userRef: params.getParam(
                  'userRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'shiftSummaryReport',
              path: 'shiftSummaryReport',
              asyncParams: {
                'docRef': getDoc(['OUTLET', 'SHIFT'], ShiftRecord.fromSnapshot),
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => ShiftSummaryReportWidget(
                docRef: params.getParam(
                  'docRef',
                  ParamType.Document,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'ShiftDetails',
              path: 'shiftDetails',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'shiftDoc':
                    getDoc(['OUTLET', 'SHIFT'], ShiftRecord.fromSnapshot),
              },
              builder: (context, params) => ShiftDetailsWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                shiftDoc: params.getParam(
                  'shiftDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'shiftWiseVehicleReport',
              path: 'shiftWiseVehicleReport',
              asyncParams: {
                'docRef2':
                    getDoc(['OUTLET', 'SHIFT'], ShiftRecord.fromSnapshot),
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => ShiftWiseVehicleReportWidget(
                vehicleType: params.getParam(
                  'vehicleType',
                  ParamType.String,
                ),
                docRef2: params.getParam(
                  'docRef2',
                  ParamType.Document,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'SplashParking',
              path: 'splashParking',
              builder: (context, params) => SplashParkingWidget(),
            ),
            FFRoute(
              name: 'WebEditUserprofile',
              path: 'webEditUserprofile',
              asyncParams: {
                'docRef':
                    getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => WebEditUserprofileWidget(
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
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'WebUserAccount',
              path: 'webUserAccount',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => WebUserAccountWidget(
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'WebEditUserPermission',
              path: 'webEditUserPermission',
              builder: (context, params) => WebEditUserPermissionWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
              ),
            ),
            FFRoute(
              name: 'WebAddUser',
              path: 'webAddUser',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => WebAddUserWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'WebTerminalWiseReport',
              path: 'webTerminalWiseReport',
              builder: (context, params) => WebTerminalWiseReportWidget(),
            ),
            FFRoute(
              name: 'WebUserDetailsReport',
              path: 'webUserDetailsReport',
              builder: (context, params) => WebUserDetailsReportWidget(),
            ),
            FFRoute(
              name: 'SetHeaderFooter',
              path: 'setHeaderFooter',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
              },
              builder: (context, params) => SetHeaderFooterWidget(
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
              ),
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
