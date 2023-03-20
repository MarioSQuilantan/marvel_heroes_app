import 'package:marvel_heroes_app/core/utils/encryptor.dart';

class Routes {
  static const String home = '/';
  static const String character = '/character';
}

class ApiConstants {
  static const String _baseUrl = 'https://gateway.marvel.com/v1/public';
  static const String publicKey = 'fea4ddbf370376865724c2b03db5ffef';
  static const String privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
  static String get timeStamp => DateTime.now().millisecondsSinceEpoch.toString();
  static String get hash => encryptor(publicKey, privateKey, timeStamp);

  static String get getCharacters => '$_baseUrl/characters?apikey=$publicKey&hash=$hash&ts=$timeStamp';
  static String getCharacterComicsById(int id) => '$_baseUrl/characters/$id/comics?apikey=$publicKey&hash=$hash&ts=$timeStamp';
  static String getCharacterEventsById(int id) => '$_baseUrl/characters/$id/events?apikey=$publicKey&hash=$hash&ts=$timeStamp';
  static String getCharacterSeriesById(int id) => '$_baseUrl/characters/$id/series?apikey=$publicKey&hash=$hash&ts=$timeStamp';
  static String getCharacterStoriesById(int id) =>
      '$_baseUrl/characters/$id/stories?apikey=$publicKey&hash=$hash&ts=$timeStamp';
}
