import 'dart:ui';

class ColorHelper {
  static Color hexToColor(String hex) {
    return Color(int.parse('0xff${hex.replaceAll('#', '')}'));
  }
}
