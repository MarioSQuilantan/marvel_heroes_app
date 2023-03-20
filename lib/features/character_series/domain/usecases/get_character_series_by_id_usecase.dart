import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/interfaces/use_case.dart';
import '../entities/character_series_entity.dart';
import '../repositories/character_series_repository.dart';

class GetCharacterSeriesByIdUseCase extends UseCase<CharacterSeries, IdParams> {
  final CharacterSeriesRepository repository;

  GetCharacterSeriesByIdUseCase(this.repository);

  @override
  Future<Either<Failure, CharacterSeries>> call(IdParams params) => repository.getCharacterSeriesById(params.id);
}
