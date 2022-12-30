import 'dto/code_infos_dto.dart';

class CodesRemoteDataSource {
  Future<List<CodeInfosDto>> fetchAll() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return const [
        CodeInfosDto(name: 'Моя машина', color: 'blue'),
        CodeInfosDto(name: 'Моя ребенок', color: 'purpure'),
        CodeInfosDto(name: 'Моя квартира', color: 'green'),
        CodeInfosDto(name: 'Мой кошелек', color: 'cyanBlue'),
        CodeInfosDto(name: 'Мой телефон', color: 'cyan'),
      ];
    });
  }
}
