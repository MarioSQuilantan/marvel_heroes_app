import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/character_events_entity.dart';

abstract class CharacterEventsRepository {
  Future<Either<Failure, CharacterEvents>> getCharacterEventsById(int id);
}
