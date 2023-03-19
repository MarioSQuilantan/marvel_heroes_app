abstract class NetworkClient {
  Future get(
    String url, {
    Map<String, dynamic>? queryParameters,
  });
}
