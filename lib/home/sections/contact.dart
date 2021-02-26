import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extensions.dart';
import '../section.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Kontakt',
      subtitle: 'Ich freue mich von Ihnen zu hören!',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            icon: const FaIcon(FontAwesomeIcons.whatsapp),
            label: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('WhatsApp schreiben'),
            ),
            onPressed: () => launch('https://wa.me/+4917623867324'),
          ).moveUpOnHover,
          const SizedBox(width: 20),
          ElevatedButton.icon(
            icon: const FaIcon(FontAwesomeIcons.envelope),
            label: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('E-Mail schreiben'),
            ),
            onPressed: () => launch('mailto:info@jensbecker.dev'),
          ).moveUpOnHover,
        ],
      ),
    );
  }
}
