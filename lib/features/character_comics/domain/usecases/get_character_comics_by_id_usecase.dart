import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/interfaces/use_case.dart';
import '../entities/character_comics_entity.dart';
import '../repositories/character_comics_repository.dart';

class GetCharacterComicsByIdUseCase extends UseCase<CharacterComics, IdParams> {
  final CharacterComicsRepository repository;

  GetCharacterComicsByIdUseCase(this.repository);

  @override
  Future<Either<Failure, CharacterComics>> call(IdParams params) => repository.getCharacterComicsById(params.id);
}
