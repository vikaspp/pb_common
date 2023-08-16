import 'package:flutter/material.dart';

extension ExtensionOnBuildContext on BuildContext {
  hideKeyboard() => FocusScope.of(this).unfocus();

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  ///Theme
  ///Text Form Field Label Style, Auth Label Text
  TextStyle? get textFormFieldStyle => Theme.of(this).textTheme.displaySmall;

  ///Heading Auth Screen
  TextStyle? get authHeadingStyle => Theme.of(this).textTheme.displayLarge;

  ///Button TextStyle
  TextStyle? get buttonTextStyle => Theme.of(this).textTheme.displayMedium;
}

extension ExtensionOnList on List {
  List get unique => toSet().toList();
}

extension ExtensionOnString on String {
  String toCapitalized() => length > 0
      ? '${firstLatter.toUpperCase()}${substring(1).toLowerCase()}'
      : '';

  String get toCamelCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String get firstLatter => this[0];
}

extension ExtensionOnInt on int {
  bool isEvenNumber() => this % 2 == 0;
  bool isOddNumber() => this % 2 != 0;
}

EdgeInsetsGeometry padding(
    {double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right}) {
  if (all != null) {
    return EdgeInsets.all(all);
  } else if (horizontal != null || vertical != null) {
    return EdgeInsets.symmetric(
        vertical: vertical ?? 0, horizontal: horizontal ?? 0);
  } else {
    return EdgeInsets.only(
        left: left ?? 0, right: right ?? 0, top: top ?? 0, bottom: bottom ?? 0);
  }
}
