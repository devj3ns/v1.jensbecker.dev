import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import 'widgets/animated_widgets.dart';

extension ScaffoldPadding on BuildContext {
  /// The websites default margin around content.
  EdgeInsets get contentMargin {
    return byFormFactor<EdgeInsets>(
      onMobile: const EdgeInsets.all(10),
      onTablet: const EdgeInsets.all(25),
      onDesktop:
          EdgeInsets.symmetric(horizontal: screenWidth / 8, vertical: 25),
    );
  }
}

extension WidgetExtensions on Widget {
  /// Makes the widget float when the mouse hovers over it.
  Widget floatOnHover({bool enable = true}) =>
      enable ? TranslateOnHover(child: this) : this;
}
