import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes_app/core/utils/json_reader.dart';
import 'package:marvel_heroes_app/features/characters/data/models/character_model.dart';
import 'package:marvel_heroes_app/features/characters/data/models/comics_item_model.dart';
import 'package:marvel_heroes_app/features/characters/data/models/comics_model.dart';
import 'package:marvel_heroes_app/features/characters/data/models/data_model.dart';
import 'package:marvel_heroes_app/features/characters/data/models/result_model.dart';
import 'package:marvel_heroes_app/features/characters/data/models/stories_item_model.dart';
import 'package:marvel_heroes_app/features/characters/data/models/stories_model.dart';
import 'package:marvel_heroes_app/features/characters/data/models/thumbnail_model.dart';
import 'package:marvel_heroes_app/features/characters/data/models/url_model.dart';
import 'package:marvel_heroes_app/features/characters/domain/entities/characters/character_entity.dart';

void main() {
  const CharacterModel tCharactersModel = CharacterModel(
    code: 1,
    status: "tStatus",
    copyright: "tCopyright",
    attributionText: "tAttributionText",
    etag: "tEtag",
    attributionHtml: "tAttributionHTML",
    data: DataModel(
      offset: 1,
      limit: 1,
      total: 1,
      count: 1,
      results: [
        ResultModel(
          id: 1,
          name: "tName",
          description: "tDescription",
          modified: "tModified",
          thumbnail: ThumbnailModel(
            path: "tPath",
            extension: "tExtension",
          ),
          resourceUri: "tResourceURI",
          comics: ComicsModel(
            available: 1,
            collectionUri: "tCollectionURI",
            items: [
              ComicsItemModel(
                resourceUri: "tResourceURI",
                name: "tName",
              ),
            ],
            returned: 1,
          ),
          series: ComicsModel(
            available: 1,
            collectionUri: "tCollectionURI",
            items: [
              ComicsItemModel(
                resourceUri: "tResourceURI",
                name: "tName",
              ),
            ],
            returned: 1,
          ),
          stories: StoriesModel(
            available: 1,
            collectionUri: "tCollectionURI",
            items: [
              StoriesItemModel(
                resourceUri: "tResourceURI",
                name: "tName",
                type: "tType",
              )
            ],
            returned: 1,
          ),
          events: ComicsModel(
            available: 1,
            collectionUri: "tCollectionURI",
            items: [],
            returned: 1,
          ),
          urls: [
            UrlModel(
              type: 'tType',
              url: 'tUrl',
            ),
          ],
        ),
      ],
    ),
  );

  final Map<String, dynamic> jsonMap = jsonDecode(jsonReader('characters'));

  test(
    'should be a subclass of Genre entity',
    () async {
      const Character tCharacters = Character(
        code: 1,
        status: "tStatus",
        copyright: "tCopyright",
        attributionText: "tAttributionText",
        etag: "tEtag",
        attributionHtml: "tAttributionHTML",
        data: DataModel(
          offset: 1,
          limit: 1,
          total: 1,
          count: 1,
          results: [
            ResultModel(
              id: 1,
              name: "tName",
              description: "tDescription",
              modified: "tModified",
              thumbnail: ThumbnailModel(
                path: "tPath",
                extension: "tExtension",
              ),
              resourceUri: "tResourceURI",
              comics: ComicsModel(
                available: 1,
                collectionUri: "tCollectionURI",
                items: [
                  ComicsItemModel(
                    resourceUri: "tResourceURI",
                    name: "tName",
                  ),
                ],
                returned: 1,
              ),
              series: ComicsModel(
                available: 1,
                collectionUri: "tCollectionURI",
                items: [
                  ComicsItemModel(
                    resourceUri: "tResourceURI",
                    name: "tName",
                  ),
                ],
                returned: 1,
              ),
              stories: StoriesModel(
                available: 1,
                collectionUri: "tCollectionURI",
                items: [
                  StoriesItemModel(
                    resourceUri: "tResourceURI",
                    name: "tName",
                    type: "tType",
                  )
                ],
                returned: 1,
              ),
              events: ComicsModel(
                available: 1,
                collectionUri: "tCollectionURI",
                items: [],
                returned: 1,
              ),
              urls: [
                UrlModel(
                  type: 'tType',
                  url: 'tUrl',
                ),
              ],
            ),
          ],
        ),
      );
      //assert(verify).
      expect(tCharacters, isA<Character>());
      expect(tCharacters, equals(tCharactersModel.toEntity()));
    },
  );

  group('toJson', () {
    test(
      'should return a json map with the proper data',
      () async {
        //act(run).
        final result = tCharactersModel.toJson();

        //assert(verify).
        expect(result, equals(jsonMap));
      },
    );
  });

  group('fromJson', () {
    test(
      'should return a valid Genre model',
      () async {
        //act(run).
        final result = CharacterModel.fromJson(jsonMap);

        //assert(verify).
        expect(result, equals(tCharactersModel));
      },
    );
  });
}
