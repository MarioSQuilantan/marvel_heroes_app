import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/character_entity.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/data_entity.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/result_entity.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/thumbnail_entity.dart';
import 'package:marvel_heroes_app/features/characters/domain/usecases/get_characters_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import '../../character_mocks.dart';

void main() {
  late MockCharactersRepository mockCharactersRepository;
  late GetCharactersUseCase getCharactersUseCase;

  setUp(() {
    mockCharactersRepository = MockCharactersRepository();
    getCharactersUseCase = GetCharactersUseCase(mockCharactersRepository);
  });

  const characters = Character(
      data: Data(
    offset: 1,
    limit: 1,
    results: [
      Result(
        id: 1,
        name: 'tName',
        thumbnail: Thumbnail(
          path: 'tPath',
          extension: 'tExtension',
        ),
      )
    ],
  ));

  const tOffset = 10;

  test(
    'should return a valid Characters entity',
    () async {
      //arrange(setup).
      when(() => mockCharactersRepository.getCharacters(any())).thenAnswer((_) async => const Right(characters));
      //act(run).
      final result = await getCharactersUseCase(const Params(offset: tOffset));
      //assert(verify).
      expect(result, equals(const Right(characters)));
    },
  );
}
