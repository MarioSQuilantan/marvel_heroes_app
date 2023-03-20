import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/character_stories_entity.dart';
import '../../domain/repositories/character_stories_repository.dart';
import '../datasources/character_stories_api_remote_datasource.dart';

class CharacterStoriesRepositoryImpl implements CharacterStoriesRepository {
  final CharacterStoriesApiRemoteDataSource dataSource;
  CharacterStoriesRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CharacterStories>> getCharacterStoriesById(int id) async {
    try {
      final response = await dataSource.getCharacterStoriesById(id);
      return Right(response.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server error'));
    }
  }
}
