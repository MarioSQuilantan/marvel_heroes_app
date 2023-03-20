import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/interfaces/use_case.dart';
import '../../domain/entities/character_stories_entity.dart';
import '../../domain/usecases/get_character_stories_by_id_usecase.dart';

part 'character_stories_event.dart';
part 'character_stories_state.dart';

class CharacterStoriesBloc extends Bloc<CharacterStoriesEvent, CharacterStoriesState> {
  final GetCharacterStoriesByIdUseCase getCharacterStoriesByIdUseCase;
  CharacterStoriesBloc({
    required this.getCharacterStoriesByIdUseCase,
  }) : super(CharacterStoriesInitial()) {
    on<GetCharacterStoriesByIdEvent>(_getCharacterStories);
  }

  void _getCharacterStories(GetCharacterStoriesByIdEvent event, Emitter<CharacterStoriesState> emit) async {
    emit(CharacterStoriesIsLoading());
    final response = await getCharacterStoriesByIdUseCase(IdParams(id: event.id));
    response.fold(
      (failure) => emit(CharacterStoriesHasError(failure.message)),
      (data) => emit(CharacterStoriesHasData(data)),
    );
  }
}
