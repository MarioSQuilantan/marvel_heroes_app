import 'package:dartz/dartz.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/character_entity.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/characters_repository.dart';
import '../datasources/api_remote_datasource.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final ApiRemoteDataSource apiRemoteDataSource;

  CharactersRepositoryImpl(this.apiRemoteDataSource);

  @override
  Future<Either<Failure, Character>> getCharacters(int offset) async {
    try {
      final result = await apiRemoteDataSource.getCharacters(offset);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server error'));
    }
  }
}
