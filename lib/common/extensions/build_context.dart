import 'package:flucodes/assets/localization/localization.dart';
import 'package:flutter/material.dart';

extension BuildContextThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}

extension BuildContextMediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension BuildContextLocalizationExtension on BuildContext {
  Localization get l10n => Localization.of(this);
}
