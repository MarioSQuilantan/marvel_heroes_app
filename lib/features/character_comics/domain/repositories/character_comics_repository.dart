import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character_comics_entity.dart';

abstract class CharacterComicsRepository {
  Future<Either<Failure, CharacterComics>> getCharacterComicsById(int id);
}
