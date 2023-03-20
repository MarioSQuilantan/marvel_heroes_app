part of 'character_series_bloc.dart';

abstract class CharacterSeriesState extends Equatable {
  const CharacterSeriesState();

  @override
  List<Object> get props => [];
}

class CharacterSeriesInitial extends CharacterSeriesState {}

class CharacterSeriesIsLoading extends CharacterSeriesState {}

class CharacterSeriesHasData extends CharacterSeriesState {
  final CharacterSeries series;

  const CharacterSeriesHasData(this.series);

  @override
  List<Object> get props => [series];
}

class CharacterSeriesHasError extends CharacterSeriesState {
  final String message;

  const CharacterSeriesHasError(this.message);

  @override
  List<Object> get props => [message];
}
