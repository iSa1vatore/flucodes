import 'package:flucodes/assets/theme/colors.dart';
import 'package:flutter/material.dart';

const bubbleTabBarHeight = 25.0;

class BubbleTabBarItem {
  final String title;

  const BubbleTabBarItem({
    required this.title,
  });
}

class BubbleTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<BubbleTabBarItem> tabs;
  final TabController? controller;

  const BubbleTabBar({
    required this.tabs,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<BubbleTabBar> createState() => _BubbleTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(bubbleTabBarHeight);
}

class _BubbleTabBarState extends State<BubbleTabBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _animationController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomLeft: Radius.circular(50),
      ),
      child: SizedBox(
        width: double.infinity,
        height: bubbleTabBarHeight,
        child: TabBar(
          controller: widget.controller,
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          indicator: const BoxDecoration(),
          indicatorWeight: 0.0,
          isScrollable: true,
          tabs: List.generate(
            widget.tabs.length,
            (index) => _BubbleTabBarItem(
              item: widget.tabs[index],
              index: index,
              controller: widget.controller ?? DefaultTabController.of(context),
            ),
          ),
        ),
      ),
    );
  }
}

class _BubbleTabBarItem extends StatelessWidget {
  final BubbleTabBarItem item;
  final int index;
  final TabController controller;

  const _BubbleTabBarItem({
    required this.item,
    required this.index,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const unselectedColor = AppColors.tabInactiveBackground;
    const selectedColor = AppColors.tabActiveBackground;

    const unselectedTextColor = AppColors.text;
    const selectedTextColor = AppColors.textInverse;

    const unselectedBorderColor = AppColors.tabInactiveBorder;
    const selectedBorderColor = AppColors.tabActiveBorder;

    return SizedBox(
      height: 25,
      child: AnimatedBuilder(
        animation: controller.animation!,
        builder: (context, child) {
          Color? color = unselectedColor;
          Color? textColor = unselectedTextColor;
          Color? borderColor = unselectedBorderColor;

          final offset = controller.offset;

          final currentIndex = controller.index;
          final isCurrentChild = index == currentIndex;

          final dragToRight = offset > 0;

          if (dragToRight) {
            final inScope = index <= currentIndex + 1 && index >= currentIndex;

            if (inScope) {
              if (isCurrentChild) {
                color = Color.lerp(
                  selectedColor,
                  unselectedColor,
                  offset,
                );
                textColor = Color.lerp(
                  selectedTextColor,
                  unselectedTextColor,
                  offset,
                );
                borderColor = Color.lerp(
                  selectedBorderColor,
                  unselectedBorderColor,
                  offset,
                );
              } else {
                color = Color.lerp(
                  unselectedColor,
                  selectedColor,
                  offset,
                );
                textColor = Color.lerp(
                  unselectedTextColor,
                  selectedTextColor,
                  offset,
                );
                borderColor = Color.lerp(
                  unselectedBorderColor,
                  selectedBorderColor,
                  offset,
                );
              }
            }
          } else {
            final inScope = index <= currentIndex && index >= currentIndex - 1;

            if (inScope) {
              if (isCurrentChild) {
                color = Color.lerp(
                  selectedColor,
                  unselectedColor,
                  -offset,
                );
                textColor = Color.lerp(
                  selectedTextColor,
                  unselectedTextColor,
                  -offset,
                );
                borderColor = Color.lerp(
                  selectedBorderColor,
                  unselectedBorderColor,
                  -offset,
                );
              } else {
                color = Color.lerp(
                  unselectedColor,
                  selectedColor,
                  -offset,
                );
                textColor = Color.lerp(
                  unselectedTextColor,
                  selectedTextColor,
                  -offset,
                );
                borderColor = Color.lerp(
                  unselectedBorderColor,
                  selectedBorderColor,
                  -offset,
                );
              }
            }
          }

          final tab = DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor!, width: 2),
            ),
            child: Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

          return tab;
        },
      ),
    );
  }
}
