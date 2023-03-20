import 'dart:convert';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/values/constants.dart';
import '../models/character_stories_model.dart';

abstract class CharacterStoriesApiRemoteDataSource {
  Future<CharacterStoriesModel> getCharacterStoriesById(int id);
}

class CharacterStoriesApiRemoteDataSourceImpl extends CharacterStoriesApiRemoteDataSource {
  final NetworkClient networkClient;

  CharacterStoriesApiRemoteDataSourceImpl(this.networkClient);

  @override
  Future<CharacterStoriesModel> getCharacterStoriesById(int id) async {
    final response = await networkClient.get(ApiConstants.getCharacterStoriesById(id));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return CharacterStoriesModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
