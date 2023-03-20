import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_app/core/error/exception.dart';
import 'package:marvel_heroes_app/core/network/http_client.dart';
import 'package:marvel_heroes_app/core/utils/json_reader.dart';
import 'package:marvel_heroes_app/features/characters/data/datasources/characters_api_remote_datasource.dart';
import 'package:marvel_heroes_app/features/characters/data/models/character_model.dart';
import 'package:mocktail/mocktail.dart';

import 'package:http/http.dart' as http_client;

import '../../character_mocks.dart';

class FakeUri extends Fake implements Uri {}

void main() {
  late MockHttp http;
  late HttpClient httpClient;
  late CharactersApiRemoteDataSourceImpl dataSource;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    http = MockHttp();
    httpClient = HttpClient(http);
    dataSource = CharactersApiRemoteDataSourceImpl(httpClient);
  });

  final tJsonData = jsonReader('characters');
  final tNumberTriviaModel = CharacterModel.fromJson(jsonDecode(tJsonData));
  const tOffSet = 10;

  group('getCharacters should', () {
    test('return a valid Characters Model when the status code is 200', () async {
      when(
        () => http.get(any()),
      ).thenAnswer(
        (_) async => http_client.Response(tJsonData, 200),
      );

      final response = await dataSource.getCharacters(tOffSet);

      expect(response, tNumberTriviaModel);
    });

    test('return a ServerException when the status code is not 200', () async {
      when(() => http.get(any())).thenAnswer((_) async => http_client.Response('Not found', 404));

      final call = dataSource.getCharacters(tOffSet);

      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
