import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'home.dart';

void main() {
  setPathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Jens Becker - Digital Creator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Home(title: title),
    );
  }
}
