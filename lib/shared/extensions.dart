import 'package:flutter/material.dart';

import 'shared_widgets.dart';

double _mobileBreakpoint = 0;
double _tabletBreakpoint = 750;
double _desktopBreakpoint = 1220;

extension ContextExtensions on BuildContext {
  // Theme
  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark ? true : false;

  bool get isLightMode => !isDarkMode;

  // Responsive
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  bool get isMobile =>
      screenWidth >= _mobileBreakpoint && screenWidth < _tabletBreakpoint;

  bool get isTablet =>
      screenWidth >= _tabletBreakpoint && screenWidth < _desktopBreakpoint;

  bool get isDesktop => screenWidth >= _desktopBreakpoint;

  double responsiveNumber({
    @required double onMobile,
    @required double onTablet,
    @required double onDesktop,
  }) {
    return isMobile
        ? onMobile
        : isTablet
            ? onTablet
            : onDesktop;
  }

  EdgeInsets responsiveEdgeInsets({
    @required EdgeInsets onMobile,
    @required EdgeInsets onTablet,
    @required EdgeInsets onDesktop,
  }) {
    return isMobile
        ? onMobile
        : isTablet
            ? onTablet
            : onDesktop;
  }

  Widget responsiveWidget({
    @required Widget onMobile,
    @required Widget onTablet,
    @required Widget onDesktop,
  }) {
    return isMobile
        ? onMobile
        : isTablet
            ? onTablet
            : onDesktop;
  }
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
