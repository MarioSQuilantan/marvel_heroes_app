import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/character_entity.dart';
import 'package:marvel_heroes_app/features/characters/domain/usecases/get_characters_usecase.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUseCase getCharactersUseCase;
  CharactersBloc({
    required this.getCharactersUseCase,
  }) : super(const CharactersInitial(offset: 0)) {
    on<GetCharactersEvent>(_getCharacters);
  }

  void _getCharacters(GetCharactersEvent event, Emitter<CharactersState> emit) async {
    int currentOffset = (state as CharactersInitial).offset;
    emit(CharactersIsLoading());
    final response = await getCharactersUseCase(Params(offset: currentOffset));
    response.fold(
      (failure) => emit(CharactersHasError(failure.message)),
      (data) => emit(CharactersHasData(data)),
    );
  }
}
