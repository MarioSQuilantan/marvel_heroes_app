import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/character_comics_entity.dart';
import '../../domain/repositories/character_comics_repository.dart';
import '../datasources/character_api_remote_datasource.dart';

class CharacterComicsRepositoryImpl implements CharacterComicsRepository {
  final CharacterComicsApiRemoteDataSource dataSource;
  CharacterComicsRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CharacterComics>> getCharacterComicsById(int id) async {
    try {
      final response = await dataSource.getCharacterComicsById(id);
      return Right(response.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server error'));
    }
  }
}
