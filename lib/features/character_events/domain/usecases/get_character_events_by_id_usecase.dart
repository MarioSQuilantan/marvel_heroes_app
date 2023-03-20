import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/interfaces/use_case.dart';
import '../entities/character_events_entity.dart';
import '../repositories/character_events_repository.dart';

class GetCharacterEventsByIdUseCase extends UseCase<CharacterEvents, IdParams> {
  final CharacterEventsRepository characterRepository;

  GetCharacterEventsByIdUseCase(this.characterRepository);

  @override
  Future<Either<Failure, CharacterEvents>> call(IdParams params) => characterRepository.getCharacterEventsById(params.id);
}
