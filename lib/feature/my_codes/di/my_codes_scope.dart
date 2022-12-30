import 'package:flucodes/feature/my_codes/presentation/my_codes_screen/bloc/my_codes_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../data/repository/codes_repository_impl.dart';
import '../data/source/remote/codes_remote_ds.dart';
import '../domain/repository/codes_repository.dart';

class MyCodesScopeImpl implements MyCodesScope {
  late final CodesRepository _codesRepository;
  late final CodesRemoteDataSource _codesRemoteDataSource;
  late final MyCodesBloc _myCodesBloc;

  @override
  MyCodesBloc get myCodesBloc => _myCodesBloc;

  MyCodesScopeImpl() {
    _codesRemoteDataSource = CodesRemoteDataSource();
    _codesRepository = CodesRepositoryImpl(
      remoteDataSource: _codesRemoteDataSource,
    );
    _myCodesBloc = MyCodesBloc(codesRepository: _codesRepository);
  }
}

abstract class MyCodesScope {
  MyCodesBloc get myCodesBloc;
}

extension MyCodesScopeExt on BuildContext {
  MyCodesScope get myCodesScope => read();
}
