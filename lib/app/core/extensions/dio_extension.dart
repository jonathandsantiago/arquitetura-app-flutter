import 'package:dio/dio.dart';

extension DioExtension on Dio {
  Future<T> _request<T>(
    String method,
    String url,
    Options? options,
    Object? data,
    T Function(dynamic, int?)? parser,
  ) async {
    options = options ??
        Options(
          followRedirects: false,
          sendTimeout: const Duration(seconds: 25),
          receiveTimeout: const Duration(seconds: 25),
        );

    options.method = method;
    var response = await request(url, data: data, options: options);

    switch (response.statusCode) {
      case 200:
        return parser != null
            ? parser(response.data, response.statusCode)
            : response.data;
      case 401:
        throw 'Acesso negado. Verifique suas credenciais.';
      case 403:
        throw 'Acesso proibido. Contate o suporte, se necessário.';
      case 400:
        throw response.statusMessage ??
            'Desculpe, algo deu errado. Estamos trabalhando nisso.';
      default:
        throw 'Desculpe, algo deu errado. Estamos trabalhando nisso.';
    }
  }

  Future<T> getAsync<T>(String url, T Function(dynamic, int?)? parser,
      {Options? options}) async {
    return await _request<T>('get', url, options, null, parser);
  }

  Future<T> postAsync<T, TBody>(
      String url, TBody data, T Function(dynamic, int?)? parser,
      {Options? options}) async {
    return await _request<T>('post', url, options, data, parser);
  }

  Future<T> putAsync<T, TBody>(
      String url, data, T Function(dynamic, int?)? parser,
      {Options? options}) async {
    return await _request<T>('put', url, options, data, parser);
  }

  Future<T> deleteAsync<T>(String url, T Function(dynamic, int?)? parser,
      {Options? options}) async {
    return await _request<T>('delete', url, options, null, parser);
  }
}
