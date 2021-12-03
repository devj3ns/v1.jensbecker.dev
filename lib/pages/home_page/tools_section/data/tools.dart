import '../../../../shared/constants.dart';
import '../models/tool_data.dart';

String _getLogoPath(String imageName) => 'assets/images/tools_icons/$imageName';

final tools = [
  ToolData(
    iconUrl: _getLogoPath('flutter.png'),
    link: Uri.parse(kFlutterLink),
  ),
  ToolData(
    iconUrl: _getLogoPath('dart.png'),
    link: Uri.parse(kDartLink),
  ),
  ToolData(
    iconUrl: _getLogoPath('android_studio.png'),
    link: Uri.parse(kAndroidStudioLink),
  ),
  ToolData(
    iconUrl: _getLogoPath('firebase.png'),
    link: Uri.parse(kFirebaseLink),
  ),
  ToolData(
    iconUrl: _getLogoPath('django.png'),
    link: Uri.parse(kDjangoLink),
  ),
  ToolData(
    iconUrl: _getLogoPath('python.png'),
    link: Uri.parse(kPythonLink),
  ),
  ToolData(
    iconUrl: _getLogoPath('wordpress.png'),
    link: Uri.parse(kWordpressLink),
  ),
  ToolData(
    iconUrl: _getLogoPath('elementor.png'),
    link: Uri.parse(kElementorLink),
  ),
];
