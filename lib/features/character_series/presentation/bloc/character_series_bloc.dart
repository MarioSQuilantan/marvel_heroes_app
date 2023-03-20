import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/interfaces/use_case.dart';
import '../../domain/entities/character_series_entity.dart';
import '../../domain/usecases/get_character_series_by_id_usecase.dart';

part 'character_series_event.dart';
part 'character_series_state.dart';

class CharacterSeriesBloc extends Bloc<CharacterSeriesEvent, CharacterSeriesState> {
  final GetCharacterSeriesByIdUseCase getCharacterSeriesByIdUseCase;
  CharacterSeriesBloc({
    required this.getCharacterSeriesByIdUseCase,
  }) : super(CharacterSeriesInitial()) {
    on<GetCharacterSeriesByIdEvent>(_getCharacterSeries);
  }
  void _getCharacterSeries(GetCharacterSeriesByIdEvent event, Emitter<CharacterSeriesState> emit) async {
    emit(CharacterSeriesIsLoading());
    final response = await getCharacterSeriesByIdUseCase(IdParams(id: event.id));
    response.fold(
      (failure) => emit(CharacterSeriesHasError(failure.message)),
      (data) => emit(CharacterSeriesHasData(data)),
    );
  }
}
