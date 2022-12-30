import 'package:flucodes/assets/res/res.dart';
import 'package:flucodes/feature/my_codes/domain/modal/code_infos.dart';
import 'package:flutter/material.dart';

class CodeItem extends StatelessWidget {
  final CodeInfos code;

  const CodeItem(this.code, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: code.color.color.withOpacity(.2),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: code.color.color,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Assets.icons.qr.svg(
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                code.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
