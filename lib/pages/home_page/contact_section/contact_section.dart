import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/constants.dart';
import '../../../shared/mailer.dart';
import '../../../shared/socials_row/socials_row.dart';
import '../../../shared/widgets/widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: tr('contact_section_title'),
      subtitle: tr('contact_section_subtitle'),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1250),
        child: Box(
          shadow: true,
          backgroundColor: Colors.white,
          child: context.formFactor().isMobile
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
                        flex: context.screenWidth < 1100 ? 1 : 2,
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
    final titleFontSize =
        context.byFormFactor<double>(onMobile: 20, onTablet: 22, onDesktop: 22);

    return Box(
      backgroundColor: Theme.of(context).primaryColor,
      borderRadius: 10.0,
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText(
            tr('contact_section_first-column_title'),
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Gap.h8(),
          SelectableText(
            tr('contact_section_first-column_subtitle'),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap.h8(),
          MyTextButton(
            iconBefore: FontAwesomeIcons.envelope,
            text: kEmail,
            link: Uri.parse(kEmailLink),
          ),
          const Gap.h8(),
          MyTextButton(
            iconBefore: FontAwesomeIcons.whatsapp,
            text: kPhoneNumber,
            link: Uri.parse(kWhatsAppLink),
          ),
          const Gap.h8(),
          const SocialsRowWithoutEmail(),
        ],
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
      if (_formKey.currentState!.validate()) {
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
              SelectableText(
                tr('contact_section_form_successfully-sent'),
                style: const TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              const Gap.h8(),
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
                          decoration: InputDecoration(
                              labelText: tr(
                                  'contact_section_form_first-name_placeholder')),
                          validator: (value) => value.isBlank
                              ? tr('contact_section_form_first-name_validator')
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
                          decoration: InputDecoration(
                              labelText: tr(
                                  'contact_section_form_last-name_placeholder')),
                          validator: (value) => value.isBlank
                              ? tr('contact_section_form_last-name_validator')
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
                          decoration: InputDecoration(
                              labelText:
                                  tr('contact_section_form_email_placeholder')),
                          validator: (value) => !value.isEmail
                              ? tr('contact_section_form_email_validator')
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
                          decoration: InputDecoration(
                              labelText:
                                  tr('contact_section_form_phone_placeholder')),
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
                    decoration: InputDecoration(
                      labelText: tr('contact_section_form_message_placeholder'),
                      alignLabelWithHint: true,
                    ),
                    validator: (value) => value.isBlank
                        ? tr('contact_section_form_message_validator')
                        : null,
                  ),
                ),
                const Gap.h16(),
                isSubmitting.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : MyButton(
                        label: tr('contact_section_form_send-button'),
                        iconAfter: FontAwesomeIcons.paperPlane,
                        onPressed: onFormSubmitted,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
              ],
            ),
          );
  }
}
