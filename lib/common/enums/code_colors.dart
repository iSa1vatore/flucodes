import 'dart:ui';

import 'package:flucodes/assets/theme/colors.dart';

enum CodeColors {
  blue(AppColors.accent1),
  purpure(AppColors.accent2),
  green(AppColors.accent3),
  cyanBlue(AppColors.accent4),
  cyan(AppColors.accent5);

  final Color color;

  const CodeColors(this.color);

  static CodeColors fromString(String color) {
    switch (color) {
      case 'blue':
        return CodeColors.blue;
      case 'purpure':
        return CodeColors.purpure;
      case 'green':
        return CodeColors.green;
      case 'cyanBlue':
        return CodeColors.cyanBlue;
      case 'cyan':
        return CodeColors.cyan;
      default:
        return CodeColors.blue;
    }
  }
}
