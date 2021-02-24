import 'package:flutter/material.dart';
import 'package:portfolio/socials_row/data/social_icons.dart';

import '../helpers/animatable.dart';
import '../helpers/divide_animation.dart';
import 'social_icon_button.dart';

class SocialsRowWidget extends StatefulWidget {
  @override
  _SocialsRowWidgetState createState() => _SocialsRowWidgetState();
}

class _SocialsRowWidgetState extends State<SocialsRowWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _baseAnimation;
  Animation<double> _socialsAnimation;

  @override
  void initState() {
    super.initState();
    _baseAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    _socialsAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.50, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SocialsRow(animation: _socialsAnimation);
  }
}

class SocialsRow extends AnimatableStatefulWidget {
  const SocialsRow({
    Key key,
    @required Animation<double> animation,
  }) : super(
          key: key,
          animation: animation,
        );

  @override
  _SocialsRowState createState() => _SocialsRowState();
}

class _SocialsRowState extends AnimatableState<SocialsRow> {
  final _socialIconsAnimations = <Animation<double>>[];

  @override
  void initState() {
    super.initState();
    _socialIconsAnimations.addAll(divideAnimationAlongItems(
      socialIcons,
      parent: baseAnimation,
      overlapStart: 1.0,
      // overlapEnd: 1.0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < socialIcons.length; i++)
          AnimatedBuilder(
            animation: _socialIconsAnimations.elementAt(i),
            builder: (context, child) {
              final animation = _socialIconsAnimations.elementAt(i);
              return Transform.translate(
                offset: Offset(0.0, 150 - (animation.value * 150)),
                child: Opacity(
                  opacity: animation.value,
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SocialIconButton(
                size: 32.0,
                model: socialIcons.elementAt(i),
              ),
            ),
          )
      ],
    );
  }
}
