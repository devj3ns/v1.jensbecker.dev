import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mailer {
  final _emailsCollection = FirebaseFirestore.instance.collection('emails');

  Future<void> sendEmail({
    required String customerName,
    required String customerEmail,
    required String customerTel,
    required String message,
  }) async {
    final emailDoc = {
      'to': ['info@jensbecker.dev'],
      'replyTo': customerEmail,
      'template': {
        'name': 'contactForm',
        'data': {
          'customerName': customerName,
          'customerEmail': customerEmail,
          'customerTel': customerTel,
          'message': message,
        },
      },
    };

    debugPrint('Sending E-Mail....');
    await _emailsCollection.add(emailDoc);
    debugPrint('Done!');

    // with a small delay it feels more natural
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }
}
