import 'dart:convert';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/values/constants.dart';
import '../models/character_series_model.dart';

abstract class CharacterSeriesApiRemoteDataSource {
  Future<CharacterSeriesModel> getCharacterSeriesById(int id);
}

class CharacterSeriesApiRemoteDataSourceImpl extends CharacterSeriesApiRemoteDataSource {
  final NetworkClient networkClient;

  CharacterSeriesApiRemoteDataSourceImpl(this.networkClient);

  @override
  Future<CharacterSeriesModel> getCharacterSeriesById(int id) async {
    final response = await networkClient.get(ApiConstants.getCharacterSeriesById(id));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return CharacterSeriesModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
