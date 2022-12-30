import 'package:flucodes/common/enums/code_colors.dart';
import 'package:flucodes/feature/my_codes/data/source/remote/dto/code_infos_dto.dart';
import 'package:flucodes/feature/my_codes/domain/modal/code_infos.dart';

extension CodeInfosDtoToModel on CodeInfosDto {
  CodeInfos toCodeInfos() => CodeInfos(
        name: name,
        color: CodeColors.fromString(color),
      );
}
