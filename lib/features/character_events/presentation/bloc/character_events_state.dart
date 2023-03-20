part of 'character_events_bloc.dart';

abstract class CharacterEventsState extends Equatable {
  const CharacterEventsState();

  @override
  List<Object> get props => [];
}

class CharacterEventsInitial extends CharacterEventsState {}

class CharacterEventsIsLoading extends CharacterEventsState {}

class CharacterEventsHasData extends CharacterEventsState {
  final CharacterEvents events;

  const CharacterEventsHasData(this.events);

  @override
  List<Object> get props => [events];
}

class CharacterEventsHasError extends CharacterEventsState {
  final String message;

  const CharacterEventsHasError(this.message);

  @override
  List<Object> get props => [message];
}
