import 'dart:convert';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/values/constants.dart';
import '../models/character_model.dart';

abstract class ApiRemoteDataSource {
  Future<CharacterModel> getCharacters(int offset);
}

class ApiRemoteDataSourceImpl extends ApiRemoteDataSource {
  final NetworkClient networkClient;

  ApiRemoteDataSourceImpl(this.networkClient);

  @override
  Future<CharacterModel> getCharacters(int offset) async {
    final queryParameters = {
      'offset': offset,
      'limit': 30,
    };
    final response = await networkClient.get(ApiConstants.getCharacters, queryParameters: queryParameters);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return CharacterModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
