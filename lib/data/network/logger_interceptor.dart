import 'package:dio/dio.dart';
import 'package:invoice/common/util/logger/api_log.dart';
import 'package:invoice/common/util/logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  const LoggerInterceptor({
    this.requestOptions = true,
    this.requestBody = true,
    this.responseOptions = true,
    this.responseBody = true,
    this.responseError = true,
  }) : super();

  final bool requestOptions;
  final bool requestBody;
  final bool responseOptions;
  final bool responseBody;
  final bool responseError;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);

    final buffer = StringBuffer();

    if (requestOptions) {
      buffer.writeln("Request ${options.method}");
      buffer.writeln("Header: ${options.headers}");
      buffer.write("Uri: ${options.uri}");
    }

    if (requestBody) {
      final dynamic data = options.data;
      if (data != null) {
        buffer.writeln();
        buffer.write("Body: ");
        if (data is FormData) {
          final formDataMap = <String, dynamic>{}
            ..addEntries(data.fields)
            ..addEntries(data.files);
          buffer.write(formDataMap.toString());
        } else {
          buffer.write(data.toString());
        }
      }
    }

    if (requestOptions || requestBody) {
      Logger.instance.log(ApiLog.debug(message: buffer.toString()));
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    final buffer = StringBuffer();

    if (responseOptions) {
      buffer.writeln("Respond ${response.requestOptions.method} ${response.statusCode} ${response.statusMessage}");
      buffer.writeln("Header: ${response.requestOptions.headers}");
      buffer.write("Uri: ${response.requestOptions.uri}");
    }

    if (requestBody && response.data != null) {
      buffer.writeln();
      buffer.write("Body: ${response.data.toString()}");
    }

    if (responseOptions || requestBody) {}
    Logger.instance.log(ApiLog.debug(message: buffer.toString()));
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    if (responseError) {
      final buffer = StringBuffer();
      if (err.type == DioExceptionType.badResponse) {
        buffer.writeln("HttpError: ${err.response?.statusCode} ${err.response?.statusMessage}");
        buffer.write("${err.requestOptions.uri}");
        if (err.response?.data != null) {
          buffer.writeln();
          buffer.write("${err.response?.data.toString()}");
        }
      } else if (err.type != DioExceptionType.unknown) {
        buffer.writeln("HttpError: ${err.type} ${err.message}");
        buffer.write("${err.requestOptions.uri}");
      } else {
        buffer.writeln("HttpError: ${err.error}");
        buffer.write("${err.requestOptions.uri}");
      }

      Logger.instance.log(ApiLog.warning(
        message: buffer.toString(),
        exception: err,
        stackTrace: err.stackTrace,
      ));
    }
  }
}
