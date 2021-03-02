import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/extensions.dart';
import '../../shared/mailer.dart';
import '../../shared/shared_widgets.dart';
import '../section.dart';
import '../socials_row/socials_row.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final horizontalMargin = context.screenWidth > 1500 ? 80.0 : 0.0;

    return Section(
      title: 'Kontakt',
      subtitle: 'Ich freue mich von Ihnen zu hören!',
      doubleBottomMargin: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
        child: RoundedBox(
          withShadow: true,
          child: context.isMobile
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _Column1(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: _Column2(),
                    ),
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _Column1(),
                        ),
                      ),
                      Expanded(
                        flex: context.screenWidth < 1000 ? 1 : 2,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: _Column2(),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class _Column1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SelectableText(
              'Kontaktinformationen',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            SelectableText(
              'Füllen Sie das Kontaktformular aus, und ich werde mich zeitnah bei Ihnen melden.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.85),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              icon: const FaIcon(
                FontAwesomeIcons.envelope,
                color: Colors.white,
                size: 19,
              ),
              label: const Text(
                'info@jensbecker.dev',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
              onPressed: () => launch('mailto:info@jensbecker.dev'),
            ).floatOnHover(),
            const SizedBox(height: 10),
            TextButton.icon(
              icon: const FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.white,
                size: 19,
              ),
              label: const Text(
                '0176 23867324',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
              onPressed: () => launch('https://wa.me/+4917623867324'),
            ).floatOnHover(),
            const SizedBox(height: 10),
            SocialsRowContactForm(),
          ],
        ),
      ),
    );
  }
}

class _Column2 extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final telController = useTextEditingController();
    final messageController = useTextEditingController();

    final isSubmitting = useState(false);
    final showSuccessInfo = useState(false);

    void onFormSubmitted() async {
      if (_formKey.currentState.validate()) {
        isSubmitting.value = true;

        await Mailer().sendEmail(
          customerEmail: emailController.text,
          customerName:
              '${firstNameController.text} ${lastNameController.text}',
          customerTel: telController.text,
          message: messageController.text,
        );

        isSubmitting.value = false;
        showSuccessInfo.value = true;
      }
    }

    return showSuccessInfo.value
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SelectableText(
                'Die Nachricht wurde erfolgreich versandt!',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const FaIcon(
                FontAwesomeIcons.check,
                size: 30,
              ),
            ],
          )
        : Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: firstNameController,
                          decoration:
                              const InputDecoration(labelText: 'Vorname'),
                          validator: (value) => value.isBlank
                              ? 'Bitte gib deinen Vornamen ein.'
                              : null,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: lastNameController,
                          decoration:
                              const InputDecoration(labelText: 'Nachname'),
                          validator: (value) => value.isBlank
                              ? 'Bitte gib deinen Nachnamen ein.'
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration:
                              const InputDecoration(labelText: 'E-Mail'),
                          validator: (value) => !value.isValidEmail
                              ? 'Bitte gib eine valide E-Mail Adresse ein.'
                              : null,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: telController,
                          decoration: const InputDecoration(
                              labelText: 'Telefon (optional)'),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: null,
                    controller: messageController,
                    decoration: const InputDecoration(
                      labelText: 'Nachricht',
                      alignLabelWithHint: true,
                    ),
                    validator: (value) =>
                        value.isBlank ? 'Bitte gib deine Nachricht ein.' : null,
                  ),
                ),
                const SizedBox(height: 15),
                isSubmitting.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Button(
                        text: 'Nachricht senden',
                        iconData: FontAwesomeIcons.paperPlane,
                        onPressed: onFormSubmitted,
                      ),
              ],
            ),
          );
  }
}
