part of 'characters_bloc.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class GetCharactersEvent extends CharactersEvent {}

class GetMoreCharactersEvent extends CharactersEvent {}
