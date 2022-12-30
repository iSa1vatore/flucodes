import 'package:flucodes/assets/res/res.dart';
import 'package:flucodes/assets/theme/colors.dart';
import 'package:flucodes/common/extensions/build_context.dart';
import 'package:flutter/material.dart';

const bottomBarHeight = 80.0;

class BottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int currentTabIndex;

  final Function(int) onTabChange;

  const BottomBar(
    this.items, {
    required this.currentTabIndex,
    required this.onTabChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.bottomNavigationBarTheme.backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: context.mediaQuery.viewPadding.bottom,
        ),
        child: SizedBox(
          height: bottomBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              items.length,
              (i) => Flexible(
                flex: currentTabIndex == i ? 3 : 2,
                child: _BottomBarItem(
                  items[i],
                  isSelected: currentTabIndex == i,
                  onPressed: () => onTabChange(i),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final BottomBarItem item;
  final bool isSelected;
  final void Function() onPressed;

  const _BottomBarItem(
    this.item, {
    required this.isSelected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isSelected
          ? DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.accent2,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: SizedBox(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      item.icon.svg(
                        width: 20,
                        height: 20,
                        color: AppColors.text,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : item.icon.svg(
              width: 20,
              height: 20,
              color: Colors.white,
            ),
    );
  }
}

class BottomBarItem {
  final String title;
  final SvgGenImage icon;

  const BottomBarItem({
    required this.title,
    required this.icon,
  });
}
