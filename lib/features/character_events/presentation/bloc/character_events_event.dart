part of 'character_events_bloc.dart';

abstract class CharacterEventsEvent extends Equatable {
  const CharacterEventsEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterEventsByIdEvent extends CharacterEventsEvent {
  final int id;

  const GetCharacterEventsByIdEvent(this.id);
}
