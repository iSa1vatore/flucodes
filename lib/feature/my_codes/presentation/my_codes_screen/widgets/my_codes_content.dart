import 'package:flucodes/common/extensions/build_context.dart';
import 'package:flucodes/common/widgets/bubble_tab_bar.dart';
import 'package:flucodes/feature/my_codes/presentation/my_codes_screen/widgets/code_item.dart';
import 'package:flucodes/feature/tabs/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../bloc/my_codes_bloc.dart';

class MyCodesContent extends StatefulWidget {
  final MyCodesSuccessState state;

  const MyCodesContent(this.state, {Key? key}) : super(key: key);

  @override
  State<MyCodesContent> createState() => _MyCodesContentState();
}

class _MyCodesContentState extends State<MyCodesContent>
    with SingleTickerProviderStateMixin {
  late TabController tabsController;

  @override
  void initState() {
    super.initState();

    tabsController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: BubbleTabBar(
              controller: tabsController,
              tabs: [
                BubbleTabBarItem(title: context.l10n.allCodes),
                BubbleTabBarItem(title: context.l10n.favorites),
                BubbleTabBarItem(title: context.l10n.car),
                BubbleTabBarItem(title: context.l10n.add),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabsController,
              children: [
                ListView.separated(
                  padding: EdgeInsets.only(
                    top: 32,
                    left: 20,
                    right: 20,
                    bottom: bottomBarHeight +
                        14 +
                        context.mediaQuery.viewPadding.bottom,
                  ),
                  itemCount: widget.state.codes.length,
                  itemBuilder: (_, index) => CodeItem(
                    widget.state.codes[index],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                ),
                Center(child: Text(context.l10n.favorites)),
                Center(child: Text(context.l10n.car)),
                Center(child: Text(context.l10n.add)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
