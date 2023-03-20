part of 'character_comics_bloc.dart';

abstract class CharacterComicsEvent extends Equatable {
  const CharacterComicsEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterComicsByIdEvent extends CharacterComicsEvent {
  final int id;

  const GetCharacterComicsByIdEvent(this.id);
}
