import 'package:flucodes/assets/localization/localization.dart';
import 'package:flucodes/assets/theme/themes.dart';
import 'package:flucodes/feature/tabs/presentation/tabs_screen/tabs_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Localization
      localizationsDelegates: const [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Localization.delegate.supportedLocales,
      // Debug
      debugShowCheckedModeBanner: false,
      // Theme
      home: const TabsScreen(),
      // Theme
      theme: AppThemes.light,
    );
  }
}
