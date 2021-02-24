import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extensions.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 6, vertical: 75),
      child: Column(
        children: [
          const SelectableText(
            'Kontakt',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            child: const Text('E-Mail schreiben'),
            onPressed: () => launch('mailto:info@jensbecker.dev'),
          ).moveUpOnHover
        ],
      ),
    );
  }
}
