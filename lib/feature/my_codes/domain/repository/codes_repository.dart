import '../model/code_infos.dart';

abstract class CodesRepository {
  Future<List<CodeInfos>> fetchAll();
}
