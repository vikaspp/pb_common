import 'package:flutter/material.dart';

import '../widgets/pb_material_app.dart';

push({required Widget screenName}) {
  navigatorKey.currentState!.push(
    MaterialPageRoute(
      builder: (BuildContext context) => screenName,
    ),
  );
}

pop() {
  navigatorKey.currentState!.pop();
}

pushReplacement({required Widget screenName}) {
  navigatorKey.currentState!.pushReplacement(
    MaterialPageRoute(
      builder: (BuildContext context) => screenName,
    ),
  );
}
