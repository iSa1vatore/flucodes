import 'package:flucodes/assets/res/res.dart';
import 'package:flucodes/common/extensions/build_context.dart';
import 'package:flucodes/feature/my_codes/di/my_codes_scope.dart';
import 'package:flucodes/feature/my_codes/presentation/my_codes_screen/my_codes_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_nav_bar.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Provider<MyCodesScope>(
            create: (_) => MyCodesScopeImpl(),
            child: const MyCodesScreen(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomBar(
              [
                BottomBarItem(
                  title: context.l10n.settings,
                  icon: Assets.icons.cogs,
                ),
                BottomBarItem(
                  title: context.l10n.myCodes,
                  icon: Assets.icons.qr,
                ),
                BottomBarItem(
                  title: context.l10n.profile,
                  icon: Assets.icons.profile,
                ),
              ],
              currentTabIndex: 1,
              onTabChange: (index) {},
            ),
          ),
        ],
      ),
    );
  }
}
