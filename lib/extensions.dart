import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  bool get isInDarkMode =>
      Theme.of(this).brightness == Brightness.dark ? true : false;
}
