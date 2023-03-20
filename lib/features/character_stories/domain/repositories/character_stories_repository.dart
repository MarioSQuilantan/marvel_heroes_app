import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character_stories_entity.dart';

abstract class CharacterStoriesRepository {
  Future<Either<Failure, CharacterStories>> getCharacterStoriesById(int id);
}
