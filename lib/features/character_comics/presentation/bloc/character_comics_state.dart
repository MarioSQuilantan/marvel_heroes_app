part of 'character_comics_bloc.dart';

abstract class CharacterComicsState extends Equatable {
  const CharacterComicsState();

  @override
  List<Object> get props => [];
}

class CharacterComicsInitial extends CharacterComicsState {}

class CharacterComicsIsLoading extends CharacterComicsState {}

class CharacterComicsHasData extends CharacterComicsState {
  final CharacterComics comics;

  const CharacterComicsHasData(this.comics);

  @override
  List<Object> get props => [comics];
}

class CharacterComicsHasError extends CharacterComicsState {
  final String message;

  const CharacterComicsHasError(this.message);

  @override
  List<Object> get props => [message];
}
