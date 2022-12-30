import 'package:flucodes/common/enums/code_colors.dart';

import '../../domain/model/code_infos.dart';
import '../source/remote/dto/code_infos_dto.dart';

extension CodeInfosDtoToModel on CodeInfosDto {
  CodeInfos toCodeInfos() => CodeInfos(
        name: name,
        color: CodeColors.fromString(color),
      );
}
