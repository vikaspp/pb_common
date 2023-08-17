import 'package:flutter/material.dart';

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

EdgeInsetsGeometry margin(
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

String toDayDate({String separator = "/"}) {
  DateTime now = DateTime.now();

  String time = "${now.day}$separator${now.month}$separator${now.year}";

  return time;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
