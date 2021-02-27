import 'package:flutter/material.dart';

import 'shared_widgets.dart';

extension ContextExtensions on BuildContext {
  // Theme
  bool get isDarkMode =>
      Theme.of(this).brightness == Brightness.dark ? true : false;

  bool get isLightMode => !isDarkMode;

  // Responsive
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isMobile => screenWidth < 768;

  bool get isTablet => screenWidth < 1024;

  bool get isDesktop => screenWidth >= 1024;
}

extension StringExtensions on String {
  bool get isBlank => this == null || trim().isEmpty;

  bool get isNotBlank => this != null && trim().isNotEmpty;

  bool get isValidEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}

extension WidgetExtensions on Widget {
  Widget floatOnHover({bool enable = true}) {
    return enable
        ? TranslateOnHover(
            child: this,
          )
        : this;
  }
}
