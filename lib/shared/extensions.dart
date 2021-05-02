import 'package:flutter/material.dart';
import 'package:flutter_extensions/flutter_extensions.dart';

import 'shared_widgets.dart';

double _mobileBreakpoint = 0;
double _tabletBreakpoint = 750;
double _desktopBreakpoint = 1220;

extension ContextExtensions on BuildContext {
  bool get isMobile =>
      screenWidth >= _mobileBreakpoint && screenWidth < _tabletBreakpoint;

  bool get isTablet =>
      screenWidth >= _tabletBreakpoint && screenWidth < _desktopBreakpoint;

  bool get isDesktop => screenWidth >= _desktopBreakpoint;

  /// Uses breakpoints to return different objects (which are
  /// defined as parameters) depending on the size of the screen.
  T responsive<T>({
    required T onMobile,
    required T onTablet,
    required T onDesktop,
  }) {
    return isMobile
        ? onMobile
        : isTablet
            ? onTablet
            : onDesktop;
  }
}

extension WidgetExtensions on Widget {
  Widget floatOnHover() => TranslateOnHover(child: this);
}
