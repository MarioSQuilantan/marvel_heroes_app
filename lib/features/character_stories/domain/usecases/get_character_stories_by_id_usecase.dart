import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/interfaces/use_case.dart';
import '../entities/character_stories_entity.dart';
import '../repositories/character_stories_repository.dart';

class GetCharacterStoriesByIdUseCase extends UseCase<CharacterStories, IdParams> {
  final CharacterStoriesRepository repository;

  GetCharacterStoriesByIdUseCase(this.repository);

  @override
  Future<Either<Failure, CharacterStories>> call(IdParams params) => repository.getCharacterStoriesById(params.id);
}
