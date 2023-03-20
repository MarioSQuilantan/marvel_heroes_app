import 'package:equatable/equatable.dart';
import 'package:marvel_heroes_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_heroes_app/core/interfaces/use_case.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/character_entity.dart';
import 'package:marvel_heroes_app/features/characters/domain/repositories/characters_repository.dart';

class GetCharactersUseCase extends UseCase<Character, Params> {
  final CharactersRepository charactersRepository;

  GetCharactersUseCase(this.charactersRepository);

  @override
  Future<Either<Failure, Character>> call(Params params) => charactersRepository.getCharacters(params.offset);
}

class Params extends Equatable {
  final int offset;

  const Params({
    required this.offset,
  });

  @override
  List<Object?> get props => [offset];
}
