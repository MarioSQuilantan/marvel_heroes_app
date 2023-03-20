import 'dart:convert';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/values/constants.dart';
import '../models/character_comics_model.dart';

abstract class CharacterComicsApiRemoteDataSource {
  Future<CharacterComicsModel> getCharacterComicsById(int id);
}

class CharacterComicsApiRemoteDataSourceImpl extends CharacterComicsApiRemoteDataSource {
  final NetworkClient networkClient;

  CharacterComicsApiRemoteDataSourceImpl(this.networkClient);

  @override
  Future<CharacterComicsModel> getCharacterComicsById(int id) async {
    final response = await networkClient.get(ApiConstants.getCharacterComicsById(id));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return CharacterComicsModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
