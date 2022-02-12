import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/extensions.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: context.contentMargin,
        child: Html(
          data: tr('privacy_html'),
          onLinkTap: (link, context, attributes, elements) => launch(link!),
        ),
      ),
    );
  }
}
