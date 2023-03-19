import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/http_client.dart';
import 'features/characters/data/datasources/api_remote_datasource.dart';
import 'features/characters/data/repositories/characters_repository_impl.dart';
import 'features/characters/domain/repositories/characters_repository.dart';
import 'features/characters/domain/usecases/get_characters_usecase.dart';
import 'features/characters/presentation/bloc/characters_bloc.dart';

final locator = GetIt.instance;

void init() {
  // blocs
  locator.registerFactory(() => CharactersBloc(getCharactersUseCase: locator<GetCharactersUseCase>()));

  //use cases
  locator.registerLazySingleton(() => GetCharactersUseCase(locator<CharactersRepository>()));

  // repositories
  locator.registerLazySingleton<CharactersRepository>(() => CharactersRepositoryImpl(locator<ApiRemoteDataSource>()));

  // data sources
  locator.registerLazySingleton<ApiRemoteDataSource>(() => ApiRemoteDataSourceImpl(locator<HttpClient>()));

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => HttpClient(locator<http.Client>()));
}
