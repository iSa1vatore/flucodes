import 'package:flucodes/assets/res/res.dart';
import 'package:flucodes/common/extensions/build_context.dart';
import 'package:flucodes/feature/my_codes/di/my_codes_scope.dart';
import 'package:flucodes/feature/my_codes/presentation/my_codes_screen/bloc/my_codes_bloc.dart';
import 'package:flucodes/feature/my_codes/presentation/my_codes_screen/widgets/my_codes_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/my_codes_loading.dart';
import 'widgets/notification_badge.dart';

class MyCodesScreen extends StatefulWidget {
  const MyCodesScreen({Key? key}) : super(key: key);

  @override
  State<MyCodesScreen> createState() => _MyCodesScreenState();
}

class _MyCodesScreenState extends State<MyCodesScreen> {
  late final MyCodesBloc _bloc;
  @override
  void initState() {
    super.initState();

    _bloc = context.myCodesScope.myCodesBloc;
    _bloc.add(const MyCodesEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.myCodes),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: Stack(
                children: [
                  Assets.icons.notifications.svg(),
                  const Positioned(
                    top: 2,
                    right: 0,
                    child: NotificationsBadge(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MyCodesBloc, MyCodesState>(
        bloc: _bloc,
        builder: (context, state) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: state.map(
            loading: (_) => const MyCodesLoading(),
            success: MyCodesContent.new,
            error: (_) => Center(child: Text(context.l10n.loadingError)),
          ),
        ),
      ),
    );
  }
}
