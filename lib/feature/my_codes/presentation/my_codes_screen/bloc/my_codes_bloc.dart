import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/code_infos.dart';
import '../../../domain/repository/codes_repository.dart';

part 'my_codes_bloc.freezed.dart';

class MyCodesBloc extends Bloc<MyCodesEvent, MyCodesState> {
  final CodesRepository _codesRepository;

  MyCodesBloc({
    required CodesRepository codesRepository,
  })  : _codesRepository = codesRepository,
        super(const MyCodesState.loading()) {
    on<MyCodesInitEvent>(_init);
  }

  Future<void> _init(
    MyCodesInitEvent event,
    Emitter<MyCodesState> emit,
  ) async {
    try {
      final codes = await _codesRepository.fetchAll();

      emit(MyCodesState.success(codes: codes));
    } on Exception {
      emit(const MyCodesState.error());
    }
  }
}

@freezed
class MyCodesEvent with _$MyCodesEvent {
  const factory MyCodesEvent.init() = MyCodesInitEvent;
}

@freezed
class MyCodesState with _$MyCodesState {
  const MyCodesState._();

  const factory MyCodesState.loading() = _MyCodesLoadingState;

  const factory MyCodesState.success({
    required List<CodeInfos> codes,
  }) = MyCodesSuccessState;

  const factory MyCodesState.error() = _MyCodesIErrorState;
}
