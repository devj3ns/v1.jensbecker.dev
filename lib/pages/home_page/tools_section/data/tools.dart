import '../../../../shared/constants.dart';
import '../models/tool.dart';

String _getLogoPath(String imageName) => 'assets/images/tools_icons/$imageName';

final tools = [
  Tool(
    iconUrl: _getLogoPath('flutter.png'),
    link: Uri.parse(kFlutterLink),
  ),
  Tool(
    iconUrl: _getLogoPath('dart.png'),
    link: Uri.parse(kDartLink),
  ),
  Tool(
    iconUrl: _getLogoPath('android_studio.png'),
    link: Uri.parse(kAndroidStudioLink),
  ),
  Tool(
    iconUrl: _getLogoPath('firebase.png'),
    link: Uri.parse(kFirebaseLink),
  ),
  Tool(
    iconUrl: _getLogoPath('django.png'),
    link: Uri.parse(kDjangoLink),
  ),
  Tool(
    iconUrl: _getLogoPath('python.png'),
    link: Uri.parse(kPythonLink),
  ),
  Tool(
    iconUrl: _getLogoPath('wordpress.png'),
    link: Uri.parse(kWordpressLink),
  ),
  Tool(
    iconUrl: _getLogoPath('elementor.png'),
    link: Uri.parse(kElementorLink),
  ),
];
