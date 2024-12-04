import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:path/path.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(printer: PrettyPrinter(methodCount: 1));
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath');
    logger.d('Error tyPe: ${err.error}\n '
        'Error message: ${err.message}');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl} ${options.path}';
    logger.i('${options.method} request ==> $requestPath');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final options = response.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} response <== $requestPath');
    logger.d('Response status code: ${response.statusCode}');
    logger.d('Response data: ${response.data}');
    handler.next(response);
  }
}
