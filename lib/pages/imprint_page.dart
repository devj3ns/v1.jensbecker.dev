import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/extensions.dart';

class ImprintPage extends StatelessWidget {
  const ImprintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: context.responsive<EdgeInsets>(
          onMobile: const EdgeInsets.symmetric(horizontal: 10),
          onTablet: const EdgeInsets.symmetric(horizontal: 50),
          onDesktop: const EdgeInsets.symmetric(horizontal: 200),
        ),
        children: [
          const SizedBox(height: 50),
          Html(
            data: tr('imprint_html'),
            onLinkTap: (link, context, attributes, elements) => launch(link!),
          ),
        ],
      ),
    );
  }
}
