import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';

/// HINT: Build this page with the CanvasKit renderer.
/// Otherwise the performance is bad and the navigation won't work.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  setPathUrlStrategy();

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: [
        const Locale('de'),
        const Locale('en'),
      ],
      fallbackLocale: const Locale('en'),
      path: kDebugMode ? 'translations' : 'assets/translations',
      child: MyApp(),
    ),
  );
}
