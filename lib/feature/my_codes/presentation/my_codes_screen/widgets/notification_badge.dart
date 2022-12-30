import 'package:flucodes/assets/theme/colors.dart';
import 'package:flutter/material.dart';

class NotificationsBadge extends StatelessWidget {
  const NotificationsBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 8,
      height: 8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.danger,
        ),
      ),
    );
  }
}
