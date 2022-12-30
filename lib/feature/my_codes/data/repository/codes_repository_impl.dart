import 'package:flucodes/feature/my_codes/data/mapper/code_mapper.dart';
import 'package:flucodes/feature/my_codes/data/source/remote/codes_remote_ds.dart';

import '../../domain/model/code_infos.dart';
import '../../domain/repository/codes_repository.dart';

class CodesRepositoryImpl implements CodesRepository {
  final CodesRemoteDataSource _remoteDataSource;

  const CodesRepositoryImpl({
    required CodesRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<CodeInfos>> fetchAll() async {
    final result = await _remoteDataSource.fetchAll();

    return result.map((codeInfosDto) => codeInfosDto.toCodeInfos()).toList();
  }
}
