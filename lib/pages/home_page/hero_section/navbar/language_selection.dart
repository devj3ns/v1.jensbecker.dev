import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({
    required this.textColor,
    required this.dropdownColor,
    Key? key,
  }) : super(key: key);

  final Color textColor;
  final Color dropdownColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: context.locale,
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FaIcon(
          FontAwesomeIcons.language,
          color: textColor,
        ),
      ),
      dropdownColor: dropdownColor,
      style: TextStyle(color: textColor, fontSize: 17),
      onChanged: (newLocale) =>
          context.setLocale(newLocale ?? const Locale('en')),
      items: context.supportedLocales
          .map(
            (locale) => DropdownMenuItem(
              value: locale,
              child: Text(locale == const Locale('de') ? 'Deutsch' : 'English'),
            ),
          )
          .toList(),
    );
  }
}
