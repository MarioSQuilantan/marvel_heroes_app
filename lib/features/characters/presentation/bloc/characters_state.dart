part of 'characters_bloc.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersInitial extends CharactersState {
  final int offset;

  const CharactersInitial({
    required this.offset,
  });
}

class CharactersIsLoading extends CharactersState {}

class CharactersHasData extends CharactersState {
  final Character character;

  const CharactersHasData(this.character);
}

class CharactersHasError extends CharactersState {
  final String message;

  const CharactersHasError(this.message);
}
