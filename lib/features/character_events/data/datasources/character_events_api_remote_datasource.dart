import 'dart:convert';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/values/constants.dart';
import '../models/character_events_model.dart';

abstract class CharacterEventsApiRemoteDataSource {
  Future<CharacterEventsModel> getCharacterEventsById(int id);
}

class CharacterEventsApiRemoteDataSourceImpl extends CharacterEventsApiRemoteDataSource {
  final NetworkClient networkClient;

  CharacterEventsApiRemoteDataSourceImpl(this.networkClient);

  @override
  Future<CharacterEventsModel> getCharacterEventsById(int id) async {
    final response = await networkClient.get(ApiConstants.getCharacterEventsById(id));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return CharacterEventsModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
