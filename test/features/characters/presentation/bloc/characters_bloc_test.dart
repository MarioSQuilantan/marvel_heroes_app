import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_app/core/error/failure.dart';
import 'package:marvel_heroes_app/core/utils/json_reader.dart';
import 'package:marvel_heroes_app/features/characters/data/models/character_model.dart';
import 'package:marvel_heroes_app/features/characters/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_heroes_app/features/characters/presentation/bloc/characters_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../character_mocks.dart';

void main() {
  late MockGetCharactersUseCase getCharactersUseCase;
  late CharactersBloc charactersBloc;

  setUp(() {
    getCharactersUseCase = MockGetCharactersUseCase();
    charactersBloc = CharactersBloc(getCharactersUseCase: getCharactersUseCase);
  });

  final tCharacterModel = CharacterModel.fromJson(jsonDecode(jsonReader('characters')));
  final tCharacter = tCharacterModel.toEntity();
  const tOffset = 0;
  final tResults = tCharacter.data.results;

  test('initial state should be empty', () {
    expect(
      charactersBloc.state,
      const CharactersInitial(
        offset: tOffset,
        results: [],
      ),
    );
  });

  blocTest<CharactersBloc, CharactersState>(
    'should emit [loading, hasData] when data is gotten successfully',
    build: () {
      when(() => getCharactersUseCase(const Params(offset: tOffset))).thenAnswer((_) async => Right(tCharacter));
      return charactersBloc;
    },
    act: (bloc) => bloc.add(GetCharactersEvent()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const CharactersIsLoading(
        offset: tOffset,
        results: [],
      ),
      CharactersHasData(
        tCharacter,
        offset: tOffset,
        results: tResults,
      ),
    ],
    verify: (bloc) {
      verify(() => getCharactersUseCase(const Params(offset: tOffset)));
    },
  );

  blocTest<CharactersBloc, CharactersState>(
    'should emit [loading, error] when the data is unsuccessfully',
    build: () {
      when(() => getCharactersUseCase(const Params(offset: tOffset)))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return charactersBloc;
    },
    act: (bloc) => bloc.add(GetCharactersEvent()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const CharactersIsLoading(
        offset: tOffset,
        results: [],
      ),
      const CharactersHasError(
        'Server Failure',
        offset: tOffset,
        results: [],
      ),
    ],
    verify: (bloc) {
      verify(() => getCharactersUseCase(const Params(offset: tOffset)));
    },
  );
}
