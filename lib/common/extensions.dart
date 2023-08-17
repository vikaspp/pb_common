import 'package:flutter/material.dart';

///**********************************************///
///---------------- Build Context ---------------///
///**********************************************///

extension ExtensionOnBuildContext on BuildContext {
  //If We want to close the keyboard
  hideKeyboard() => FocusScope.of(this).unfocus();

  //Device Width
  double get width => MediaQuery.of(this).size.width;

  //Device Height
  double get height => MediaQuery.of(this).size.height;
}

///**********************************************///
///-------------------- List --------------------///
///**********************************************///

extension ExtensionOnList on List {
  //To get unique data from List
  List get unique => toSet().toList();
}

///**********************************************///
///-------------------- String ------------------///
///**********************************************///

extension ExtensionOnString on String {
  String get toCapitalized =>
      length > 0 ? '${first.toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get toCamelCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');

  String get first => this[0];

  String get last => this[length - 1];
}

///**********************************************///
///---------------------- Int -------------------///
///**********************************************///

extension ExtensionOnInt on int {
  bool isEvenNumber() => this % 2 == 0;
  bool isOddNumber() => this % 2 != 0;
}

///**********************************************///
///-------------------- Dynamic -----------------///
///**********************************************///

extension ExtensionOnDynamic on dynamic {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else if (runtimeType == String) {
      if (this == "") {
        return true;
      }
    } else if (runtimeType == List) {
      if (this.isEmpty) {
        return true;
      }
    }
    return false;
  }
}
