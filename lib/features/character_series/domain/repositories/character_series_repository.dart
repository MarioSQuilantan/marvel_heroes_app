import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character_series_entity.dart';

abstract class CharacterSeriesRepository {
  Future<Either<Failure, CharacterSeries>> getCharacterSeriesById(int id);
}
