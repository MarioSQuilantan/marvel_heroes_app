import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/interfaces/use_case.dart';
import '../../domain/entities/character_events_entity.dart';
import '../../domain/usecases/get_character_events_by_id_usecase.dart';

part 'character_events_event.dart';
part 'character_events_state.dart';

class CharacterEventsBloc extends Bloc<CharacterEventsEvent, CharacterEventsState> {
  final GetCharacterEventsByIdUseCase getCharacterEventsByIdUseCase;
  CharacterEventsBloc({
    required this.getCharacterEventsByIdUseCase,
  }) : super(CharacterEventsInitial()) {
    on<GetCharacterEventsByIdEvent>(_getCharacterEvents);
  }

  void _getCharacterEvents(GetCharacterEventsByIdEvent event, Emitter<CharacterEventsState> emit) async {
    emit(CharacterEventsIsLoading());
    final response = await getCharacterEventsByIdUseCase(IdParams(id: event.id));
    response.fold(
      (failure) => emit(CharacterEventsHasError(failure.message)),
      (data) => emit(CharacterEventsHasData(data)),
    );
  }
}
