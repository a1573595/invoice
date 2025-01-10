// import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:invoice/common/config.dart';
import 'package:invoice/data/network/invoice_api_impl.dart';
import 'package:invoice/data/network/logger_interceptor.dart';
import 'package:invoice/domain/network/invoice_api.dart';

final class ApiService {
  static final ApiService instance = ApiService._();

  late final InvoiceApi _invoiceApi;

  InvoiceApi get invoiceApi => _invoiceApi;

  ApiService._() {
    final options = BaseOptions(
      connectTimeout: Config.defaultTimeout,
      receiveTimeout: Config.defaultTimeout,
      sendTimeout: Config.defaultTimeout,
      headers: {
        HttpHeaders.contentTypeHeader: Headers.jsonContentType,
        HttpHeaders.acceptHeader: Headers.jsonContentType,
      },
    );

    // final client = http.Client();
    final dio = Dio(options)..interceptors.add(LoggerInterceptor());

    // _invoiceApi = InvoiceApiImpl(client: client);
    _invoiceApi = InvoiceApiImpl(dio: dio);
  }
}
