import 'package:marvel_heroes_app/features/characters/data/datasources/api_remote_datasource.dart';
import 'package:marvel_heroes_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http_client;

class MockCharactersRepository extends Mock implements CharactersRepository {}

class MockApiRemoteDataSource extends Mock implements ApiRemoteDataSource {}

class MockHttp extends Mock implements http_client.Client {}
