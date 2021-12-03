import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/social_icons.dart';
import '../helpers/animatable.dart';
import '../helpers/divide_animation.dart';
import '../model/social_icon.dart';
import 'social_icon_button.dart';

class AnimatedSocialsRow extends StatefulWidget {
  const AnimatedSocialsRow({Key? key}) : super(key: key);

  @override
  _AnimatedSocialsRowState createState() => _AnimatedSocialsRowState();
}

class _AnimatedSocialsRowState extends State<AnimatedSocialsRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _baseAnimation;
  late Animation<double> _socialsAnimation;

  @override
  void initState() {
    super.initState();
    _baseAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    _socialsAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.5, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _SocialsRow(animation: _socialsAnimation);
  }

  @override
  void dispose() {
    _baseAnimation.dispose();
    super.dispose();
  }
}

class SocialsRowWithoutEmail extends StatelessWidget {
  const SocialsRowWithoutEmail({Key? key}) : super(key: key);

  // SocialIcons without the E-Mail icon.
  static final icons = socialIcons.toList()
    ..removeWhere((SocialIconData socialIcon) =>
        socialIcon.icon == FontAwesomeIcons.envelope);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: icons
          .map((socialIconData) => SocialIconButton(socialIconData))
          .toList(),
    );
  }
}

class _SocialsRow extends AnimatableStatefulWidget {
  const _SocialsRow({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, animation: animation);

  @override
  _SocialsRowState createState() => _SocialsRowState();
}

class _SocialsRowState extends AnimatableState<_SocialsRow> {
  final _socialIconsAnimations = <Animation<double>>[];

  @override
  void initState() {
    super.initState();
    _socialIconsAnimations.addAll(
      divideAnimationAlongItems(
        socialIcons,
        parent: baseAnimation,
        overlapStart: 1.0,
        // overlapEnd: 1.0,
      ),
    );
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
            child: SocialIconButton(socialIcons.elementAt(i)),
          )
      ],
    );
  }
}
