import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/character_entity.dart';
import 'package:marvel_heroes_app/features/characters/domain/usecases/get_characters_usecase.dart';

import '../../domain/entities/result_entity.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUseCase getCharactersUseCase;
  CharactersBloc({
    required this.getCharactersUseCase,
  }) : super(const CharactersInitial(offset: 0, results: [])) {
    on<GetCharactersEvent>(_getCharacters);
    on<GetMoreCharactersEvent>(_getMoreCharacters);
  }

  void _getCharacters(GetCharactersEvent event, Emitter<CharactersState> emit) async {
    emit(CharactersIsLoading(
      offset: state.offset,
      results: state.results,
    ));
    final response = await getCharactersUseCase(Params(offset: state.offset));
    response.fold(
      (failure) => emit(CharactersHasError(
        failure.message,
        offset: state.offset,
        results: state.results,
      )),
      (data) => emit(CharactersHasData(
        data,
        offset: state.offset,
        results: data.data.results,
      )),
    );
  }

  void _getMoreCharacters(GetMoreCharactersEvent event, Emitter<CharactersState> emit) async {
    final response = await getCharactersUseCase(Params(offset: state.results.length));
    response.fold((failure) {
      return emit(
        CharactersHasError(
          failure.message,
          offset: state.offset,
          results: state.results,
        ),
      );
    }, (data) {
      return emit(
        CharactersHasData(
          data,
          offset: state.offset,
          results: state.results + data.data.results,
        ),
      );
    });
  }
}
