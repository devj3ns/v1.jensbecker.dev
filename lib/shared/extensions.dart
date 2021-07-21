import 'package:flutter/material.dart';
import 'package:fleasy/fleasy.dart';

import 'shared_widgets.dart';

extension ContextExtensions on BuildContext {
  //todo: move this to fleasy?!
  /// Returns the correct object (which us defined as a parameter)
  /// depending on the [formFactor].
  T responsive<T>({
    required T onMobile,
    required T onTablet,
    required T onDesktop,
  }) {
    return formFactor == FormFactor.handset
        ? onMobile
        : formFactor == FormFactor.tablet
            ? onTablet
            : onDesktop;
  }
}

extension WidgetExtensions on Widget {
  Widget floatOnHover() => TranslateOnHover(child: this);
}
