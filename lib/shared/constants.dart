// Currently when using many link widgets this error is thrown:
//
// Flutter was unable to create enough overlay surfaces.
// This is usually caused by too many platform views being displayed at once.
// You may experience incorrect rendering.
//
// See: https://github.com/flutter/flutter/issues/88449
//      https://github.com/flutter/flutter/issues/91151
//
// So for now this unfortunately needs to be false in production:
const kUseLinkWidget = false;

const kEmail = 'info@jensbecker.dev';
const kPhoneNumber = '+4917623867324';

// ### Social Links ###
const kTwitterLink = 'https://twitter.com/devj3ns';
const kGitHubLink = 'https://github.com/devj3ns';
const kInstagramLink = 'https://instagram.com/dev.j3ns';
const kWhatsAppLink = 'https://wa.me/$kPhoneNumber';
const kEmailLink = 'mailto:$kEmail';

// ### Tool Links ###
const kFlutterLink = 'https://flutter.dev/';
const kDartLink = 'https://dart.dev/';
const kAndroidStudioLink = 'https://developer.android.com/studio/';
const kFirebaseLink = 'https://firebase.google.com/';
const kDjangoLink = 'https://www.djangoproject.com/';
const kPythonLink = 'https://www.python.org/';
const kWordpressLink = 'https://wordpress.org/';
const kElementorLink = 'https://elementor.com/';
