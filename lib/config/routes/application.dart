import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Application {
  static FluroRouter? router;

  static void navigateTo(BuildContext context, String route,
      [TransitionType? transition]) {
    router!.navigateTo(context, route,
        transition: transition ?? TransitionType.fadeIn);
  }
}
