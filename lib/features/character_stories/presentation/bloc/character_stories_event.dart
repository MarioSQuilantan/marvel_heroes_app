part of 'character_stories_bloc.dart';

abstract class CharacterStoriesEvent extends Equatable {
  const CharacterStoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterStoriesByIdEvent extends CharacterStoriesEvent {
  final int id;

  const GetCharacterStoriesByIdEvent(this.id);
}
