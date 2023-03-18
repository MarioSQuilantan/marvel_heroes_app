import 'dart:convert';
import 'package:crypto/crypto.dart';

String encryptor(String publicKey, String privateKey, String timeStamp) {
  String dataToHash = '$timeStamp$privateKey$publicKey';

  List<int> bytesToHash = utf8.encode(dataToHash);
  Digest digest = md5.convert(bytesToHash);

  String hash = digest.toString();

  return hash;
}
