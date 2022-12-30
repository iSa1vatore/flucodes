import 'package:flucodes/assets/theme/colors.dart';
import 'package:flucodes/common/extensions/build_context.dart';
import 'package:flucodes/feature/tabs/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyCodesLoading extends StatelessWidget {
  const MyCodesLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              height: 25,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, __) => Shimmer.fromColors(
                  baseColor: AppColors.tabInactiveBorder,
                  highlightColor: AppColors.tabInactiveBackground,
                  child: const SizedBox(
                    width: 100,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 12),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                top: 32,
                left: 20,
                right: 20,
                bottom: bottomBarHeight +
                    14 +
                    context.mediaQuery.viewPadding.bottom,
              ),
              itemCount: 10,
              itemBuilder: (_, index) => Shimmer.fromColors(
                baseColor: AppColors.tabInactiveBorder,
                highlightColor: AppColors.tabInactiveBackground,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.6),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 15,
                    ),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 36,
                          height: 36,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(width: 24),
                        SizedBox(
                          width: 100,
                          height: 18,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 14),
            ),
          ),
        ],
      ),
    );
  }
}
