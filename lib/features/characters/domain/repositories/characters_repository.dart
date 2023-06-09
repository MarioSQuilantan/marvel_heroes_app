import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/characters/character_entity.dart';

abstract class CharactersRepository {
  Future<Either<Failure, Character>> getCharacters(int offset);
}
