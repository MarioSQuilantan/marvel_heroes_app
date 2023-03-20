import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/character_events_entity.dart';
import '../../domain/repositories/character_events_repository.dart';
import '../datasources/character_events_api_remote_datasource.dart';

class CharacterEventsRepositoryImpl implements CharacterEventsRepository {
  final CharacterEventsApiRemoteDataSource dataSource;
  CharacterEventsRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CharacterEvents>> getCharacterEventsById(int id) async {
    try {
      final response = await dataSource.getCharacterEventsById(id);
      return Right(response.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server error'));
    }
  }
}
