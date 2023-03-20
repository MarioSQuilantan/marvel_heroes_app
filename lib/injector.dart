import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_heroes_app/features/character_events/presentation/bloc/character_events_bloc.dart';

import 'core/network/http_client.dart';
import 'features/character_comics/data/datasources/character_api_remote_datasource.dart';
import 'features/character_comics/data/repositories/character_comics_repository_impl.dart';
import 'features/character_comics/domain/repositories/character_comics_repository.dart';
import 'features/character_comics/domain/usecases/get_character_comics_by_id_usecase.dart';
import 'features/character_comics/presentation/bloc/character_comics_bloc.dart';
import 'features/character_events/data/datasources/character_events_api_remote_datasource.dart';
import 'features/character_events/data/repositories/character_events_repository_impl.dart';
import 'features/character_events/domain/repositories/character_events_repository.dart';
import 'features/character_events/domain/usecases/get_character_events_by_id_usecase.dart';
import 'features/character_series/data/datasources/character_series_api_remote_datasource.dart';
import 'features/character_series/data/repositories/character_series_repository_impl.dart';
import 'features/character_series/domain/repositories/character_series_repository.dart';
import 'features/character_series/domain/usecases/get_character_series_by_id_usecase.dart';
import 'features/character_series/presentation/bloc/character_series_bloc.dart';
import 'features/character_stories/data/datasources/character_stories_api_remote_datasource.dart';
import 'features/character_stories/data/repositories/character_stories_repository_impl.dart';
import 'features/character_stories/domain/repositories/character_stories_repository.dart';
import 'features/character_stories/domain/usecases/get_character_stories_by_id_usecase.dart';
import 'features/character_stories/presentation/bloc/character_stories_bloc.dart';
import 'features/characters/data/datasources/characters_api_remote_datasource.dart';
import 'features/characters/data/repositories/characters_repository_impl.dart';
import 'features/characters/domain/repositories/characters_repository.dart';
import 'features/characters/domain/usecases/get_characters_usecase.dart';
import 'features/characters/presentation/bloc/characters_bloc.dart';

final locator = GetIt.instance;

void init() {
  // blocs
  locator.registerFactory(() => CharactersBloc(getCharactersUseCase: locator<GetCharactersUseCase>()));
  locator.registerFactory(() => CharacterComicsBloc(getCharacterComicsByIdUseCase: locator<GetCharacterComicsByIdUseCase>()));
  locator.registerFactory(() => CharacterEventsBloc(getCharacterEventsByIdUseCase: locator<GetCharacterEventsByIdUseCase>()));
  locator.registerFactory(() => CharacterSeriesBloc(getCharacterSeriesByIdUseCase: locator<GetCharacterSeriesByIdUseCase>()));
  locator
      .registerFactory(() => CharacterStoriesBloc(getCharacterStoriesByIdUseCase: locator<GetCharacterStoriesByIdUseCase>()));

  //use cases
  locator.registerLazySingleton(() => GetCharactersUseCase(locator<CharactersRepository>()));
  locator.registerLazySingleton(() => GetCharacterComicsByIdUseCase(locator<CharacterComicsRepository>()));
  locator.registerLazySingleton(() => GetCharacterEventsByIdUseCase(locator<CharacterEventsRepository>()));
  locator.registerLazySingleton(() => GetCharacterSeriesByIdUseCase(locator<CharacterSeriesRepository>()));
  locator.registerLazySingleton(() => GetCharacterStoriesByIdUseCase(locator<CharacterStoriesRepository>()));

  // repositories
  locator.registerLazySingleton<CharactersRepository>(() => CharactersRepositoryImpl(locator<CharactersApiRemoteDataSource>()));
  locator.registerLazySingleton<CharacterComicsRepository>(
      () => CharacterComicsRepositoryImpl(locator<CharacterComicsApiRemoteDataSource>()));
  locator.registerLazySingleton<CharacterEventsRepository>(
      () => CharacterEventsRepositoryImpl(locator<CharacterEventsApiRemoteDataSource>()));
  locator.registerLazySingleton<CharacterSeriesRepository>(
      () => CharacterSeriesRepositoryImpl(locator<CharacterSeriesApiRemoteDataSource>()));
  locator.registerLazySingleton<CharacterStoriesRepository>(
      () => CharacterStoriesRepositoryImpl(locator<CharacterStoriesApiRemoteDataSource>()));

  // data sources
  locator.registerLazySingleton<CharactersApiRemoteDataSource>(() => CharactersApiRemoteDataSourceImpl(locator<HttpClient>()));
  locator.registerLazySingleton<CharacterComicsApiRemoteDataSource>(
      () => CharacterComicsApiRemoteDataSourceImpl(locator<HttpClient>()));
  locator.registerLazySingleton<CharacterEventsApiRemoteDataSource>(
      () => CharacterEventsApiRemoteDataSourceImpl(locator<HttpClient>()));
  locator.registerLazySingleton<CharacterSeriesApiRemoteDataSource>(
      () => CharacterSeriesApiRemoteDataSourceImpl(locator<HttpClient>()));
  locator.registerLazySingleton<CharacterStoriesApiRemoteDataSource>(
      () => CharacterStoriesApiRemoteDataSourceImpl(locator<HttpClient>()));

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => HttpClient(locator<http.Client>()));
}
