import 'package:flutter/widgets.dart';

class Config {
  Config._();

  /// SelfSignedCert:
  static const selfSignedCert = false;

  /// API Config
  static const Duration timeout = Duration(seconds: 10);
  static const logNetworkRequest = true;
  static const logNetworkRequestHeader = true;
  static const logNetworkRequestBody = true;
  static const logNetworkResponseHeader = false;
  static const logNetworkResponseBody = true;
  static const logNetworkError = true;

  /// AWS Config
  static const String BUCKET_NAME = "BUCKET_NAME";
  static const String IDENTITY_POOL_ID = "PLACE_YOUR_IDENTITY_POOL_ID";

  /// Localization Config
  static const supportedLocales = <Locale>[
    Locale('en', ''),
    Locale('es', ''),
    Locale('ar', '')
  ];

  /// Common Const
  static const actionLocale = 'locale';
  static const int SIGNUP = 0;
  static const int SIGNIN = 1;
  static const String CURRENCY_SYMBOL = "€";
  static String FCM_TOKEN = "";
}
