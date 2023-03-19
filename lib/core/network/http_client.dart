import 'package:http/http.dart' as http_client;
import 'package:marvel_heroes_app/core/values/constants.dart';

import 'network_client.dart';

class HttpClient implements NetworkClient {
  final http_client.Client http;

  HttpClient(this.http);

  @override
  Future get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) {
    final baseQueryParameters = <String, dynamic>{
      'apikey': ApiConstants.publicKey,
      'hash': ApiConstants.hash,
      'ts': ApiConstants.timeStamp,
    };

    if (queryParameters != null) {
      baseQueryParameters.addAll(queryParameters);
    }

    final uri = Uri.parse(url).replace(
      queryParameters: baseQueryParameters.map(
        (key, value) => MapEntry(
          key,
          value.toString(),
        ),
      ),
    );
    return http.get(uri);
  }
}
