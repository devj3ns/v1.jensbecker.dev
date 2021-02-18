import 'package:flutter/material.dart';

abstract class AnimatableWidget extends StatelessWidget {
  const AnimatableWidget({
    Key key,
    @required this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  Animation<double> get baseAnimation =>
      animation ?? AlwaysStoppedAnimation(1.0);
}

abstract class AnimatableStatefulWidget extends StatefulWidget {
  const AnimatableStatefulWidget({
    Key key,
    @required this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  AnimatableState<AnimatableStatefulWidget> createState();
}

abstract class AnimatableState<T extends AnimatableStatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  Animation<double> get baseAnimation =>
      widget.animation ?? AlwaysStoppedAnimation(0.0);
}
