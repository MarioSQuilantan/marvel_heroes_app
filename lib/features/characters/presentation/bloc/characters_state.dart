part of 'characters_bloc.dart';

abstract class CharactersState extends Equatable {
  final int offset;
  final List<Result> results;
  const CharactersState({
    required this.offset,
    required this.results,
  });

  @override
  List<Object> get props => [offset, results];
}

class CharactersInitial extends CharactersState {
  const CharactersInitial({
    required super.offset,
    required super.results,
  });

  @override
  List<Object> get props => [offset, results];
}

class CharactersIsLoading extends CharactersState {
  const CharactersIsLoading({
    required super.offset,
    required super.results,
  });

  @override
  List<Object> get props => [offset, results];
}

class CharactersHasData extends CharactersState {
  final Character character;

  const CharactersHasData(
    this.character, {
    required super.offset,
    required super.results,
  });

  @override
  List<Object> get props => [offset, results];
}

class CharactersHasError extends CharactersState {
  final String message;

  const CharactersHasError(
    this.message, {
    required super.offset,
    required super.results,
  });

  @override
  List<Object> get props => [offset, results];
}
