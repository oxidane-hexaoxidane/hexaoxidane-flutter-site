import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.trackpad};
}
