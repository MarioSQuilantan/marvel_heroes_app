part of 'character_stories_bloc.dart';

abstract class CharacterStoriesState extends Equatable {
  const CharacterStoriesState();

  @override
  List<Object> get props => [];
}

class CharacterStoriesInitial extends CharacterStoriesState {}

class CharacterStoriesIsLoading extends CharacterStoriesState {}

class CharacterStoriesHasData extends CharacterStoriesState {
  final CharacterStories stories;

  const CharacterStoriesHasData(this.stories);

  @override
  List<Object> get props => [stories];
}

class CharacterStoriesHasError extends CharacterStoriesState {
  final String message;

  const CharacterStoriesHasError(this.message);

  @override
  List<Object> get props => [message];
}
