import '../models/tool.dart';

String _getLogoPath(String imageName) => 'assets/tools_icons/$imageName';

final tools = [
  Tool(
    iconUrl: _getLogoPath('flutter.png'),
    link: 'https://flutter.dev/',
  ),
  Tool(
    iconUrl: _getLogoPath('dart.png'),
    link: 'https://dart.dev/',
  ),
  Tool(
    iconUrl: _getLogoPath('android_studio.png'),
    link: 'https://developer.android.com/studio/',
  ),
  Tool(
    iconUrl: _getLogoPath('firebase.png'),
    link: 'https://firebase.google.com/',
  ),
  Tool(
    iconUrl: _getLogoPath('django.png'),
    link: 'https://www.djangoproject.com/',
  ),
  Tool(
    iconUrl: _getLogoPath('python.png'),
    link: 'https://www.python.org/',
  ),
  Tool(
    iconUrl: _getLogoPath('wordpress.png'),
    link: 'https://wordpress.org/',
  ),
  Tool(
    iconUrl: _getLogoPath('elementor.png'),
    link: 'https://elementor.com/',
  ),
];
