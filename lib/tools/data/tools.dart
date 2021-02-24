import '../models/tool.dart';

String _getLogoPath(String imageName) => 'assets/tools_icons/$imageName';

final tools = [
  Tool(
    iconUrl: _getLogoPath('flutter.jpg'),
    link: 'https://flutter.dev/',
  ),
  Tool(
    iconUrl: _getLogoPath('dart.jpg'),
    link: 'https://dart.dev/',
  ),
  Tool(
    iconUrl: _getLogoPath('android_studio.jpg'),
    link: 'https://developer.android.com/studio/',
  ),
  Tool(
    iconUrl: _getLogoPath('firebase.jpg'),
    link: 'https://firebase.google.com/',
  ),
  Tool(
    iconUrl: _getLogoPath('django.jpg'),
    link: 'https://www.djangoproject.com/',
  ),
  Tool(
    iconUrl: _getLogoPath('python.jpg'),
    link: 'https://www.python.org/',
  ),
  Tool(
    iconUrl: _getLogoPath('wordpress.jpg'),
    link: 'https://wordpress.org/',
  ),
  Tool(
    iconUrl: _getLogoPath('elementor.jpg'),
    link: 'https://elementor.com/',
  ),
];
