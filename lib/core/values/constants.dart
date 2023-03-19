import 'package:marvel_heroes_app/core/utils/encryptor.dart';

class Routes {
  static const String home = '/';
}

class ApiConstants {
  static const String _baseUrl = 'https://gateway.marvel.com/v1/public';
  static const String publicKey = 'fea4ddbf370376865724c2b03db5ffef';
  static const String privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
  static String get timeStamp => DateTime.now().millisecondsSinceEpoch.toString();
  static String get hash => encryptor(publicKey, privateKey, timeStamp);

  static String get getCharacters => '$_baseUrl/characters?apikey=$publicKey&hash=$hash&ts=$timeStamp';
}
