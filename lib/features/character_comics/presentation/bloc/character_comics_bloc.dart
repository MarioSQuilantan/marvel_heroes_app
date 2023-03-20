import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/interfaces/use_case.dart';
import '../../domain/entities/character_comics_entity.dart';
import '../../domain/usecases/get_character_comics_by_id_usecase.dart';

part 'character_comics_event.dart';
part 'character_comics_state.dart';

class CharacterComicsBloc extends Bloc<CharacterComicsEvent, CharacterComicsState> {
  final GetCharacterComicsByIdUseCase getCharacterComicsByIdUseCase;
  CharacterComicsBloc({
    required this.getCharacterComicsByIdUseCase,
  }) : super(CharacterComicsInitial()) {
    on<GetCharacterComicsByIdEvent>(_getCharacterComics);
  }

  void _getCharacterComics(GetCharacterComicsByIdEvent event, Emitter<CharacterComicsState> emit) async {
    emit(CharacterComicsIsLoading());
    final response = await getCharacterComicsByIdUseCase(IdParams(id: event.id));
    response.fold(
      (failure) => emit(CharacterComicsHasError(failure.message)),
      (data) => emit(CharacterComicsHasData(data)),
    );
  }
}
