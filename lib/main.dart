import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';

/// HINT: Build this web app with the CanvasKit renderer.
/// Otherwise the performance is bad and the navigation won't work.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  Beamer.setPathUrlStrategy();

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [
        Locale('de'),
        Locale('en'),
      ],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: MyApp(),
    ),
  );
}
