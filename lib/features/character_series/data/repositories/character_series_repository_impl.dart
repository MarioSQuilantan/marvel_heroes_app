import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/character_series_entity.dart';
import '../../domain/repositories/character_series_repository.dart';
import '../datasources/character_series_api_remote_datasource.dart';

class CharacterSeriesRepositoryImpl implements CharacterSeriesRepository {
  final CharacterSeriesApiRemoteDataSource dataSource;
  CharacterSeriesRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CharacterSeries>> getCharacterSeriesById(int id) async {
    try {
      final response = await dataSource.getCharacterSeriesById(id);
      return Right(response.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server error'));
    }
  }
}
