import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_app/core/error/exception.dart';
import 'package:marvel_heroes_app/core/error/failure.dart';
import 'package:marvel_heroes_app/core/utils/json_reader.dart';
import 'package:marvel_heroes_app/features/characters/data/models/character_model.dart';
import 'package:marvel_heroes_app/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../character_mocks.dart';

void main() {
  late MockApiRemoteDataSource dataSource;
  late CharactersRepositoryImpl repository;

  setUp(() {
    dataSource = MockApiRemoteDataSource();
    repository = CharactersRepositoryImpl(dataSource);
  });

  final tCharactersModel = CharacterModel.fromJson(jsonDecode(jsonReader('characters')));
  final tCharacters = tCharactersModel.toEntity();
  const tOffset = 10;

  group('getCharacters should', () {
    test(
      'return current Character call to data source when is successful',
      () async {
        //arrange(setup).
        when(() => dataSource.getCharacters(any())).thenAnswer((_) async => tCharactersModel);
        //act(run).
        final result = await repository.getCharacters(tOffset);
        //assert(verify).
        expect(result, equals(Right(tCharacters)));
      },
    );

    test(
      'return server failure when a call data source is unsuccessful',
      () async {
        //arrange(setup).
        when(() => dataSource.getCharacters(any())).thenThrow(ServerException());
        //act(run).
        final result = await repository.getCharacters(tOffset);
        //assert(verify).
        expect(result, equals(const Left(ServerFailure('Server error'))));
      },
    );
  });
}
