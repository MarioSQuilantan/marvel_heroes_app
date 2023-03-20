part of 'character_series_bloc.dart';

abstract class CharacterSeriesEvent extends Equatable {
  const CharacterSeriesEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterSeriesByIdEvent extends CharacterSeriesEvent {
  final int id;

  const GetCharacterSeriesByIdEvent(this.id);
}
