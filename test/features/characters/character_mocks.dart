import 'package:marvel_heroes_app/features/characters/data/datasources/characters_api_remote_datasource.dart';
import 'package:marvel_heroes_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:marvel_heroes_app/features/characters/domain/usecases/get_characters_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http_client;

class MockCharactersRepository extends Mock implements CharactersRepository {}

class MockApiRemoteDataSource extends Mock implements CharactersApiRemoteDataSource {}

class MockGetCharactersUseCase extends Mock implements GetCharactersUseCase {}

class MockHttp extends Mock implements http_client.Client {}
