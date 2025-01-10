// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:invoice/common/config.dart';
import 'package:invoice/common/util/extension_util.dart';
// import 'package:http/http.dart' as http;
import 'package:invoice/data/model/invoice_number_raw.dart';
import 'package:invoice/domain/network/invoice_api.dart';

class InvoiceApiImpl implements InvoiceApi {
  // final http.Client _client;
  final Dio _dio;

  const InvoiceApiImpl({
    // required http.Client client,
    required Dio dio,
  }) :
        // _client = client,
        _dio = dio;

  @override
  Future<InvoiceNumberRaw> getInvoiceNumber() {
    // return _client
    //     .get(Uri.https(Config.baseUrl, "/index.html"))
    //     .then((value) => value.bodyBytes)
    //     .then((value) => utf8.decode(value))
    //     .then((value) => parse(value))
    //     .then((value) => (value.querySelector(".etw-web"), value.querySelector(".container-fluid")))
    //     .then((value) => (value.$1?.querySelector(".etw-on"), value.$2?.querySelectorAll(".etw-tbiggest")))
    //     .then((value) => InvoiceNumberRaw(
    //           year: int.tryParse("${value.$1?.text[0]}${value.$1?.text[1]}${value.$1?.text[2]}"),
    //           month: int.tryParse("${value.$1?.text[4]}${value.$1?.text[5]}"),
    //           specialPrize: value.$2?.tryGet(0)?.text,
    //           grandPrize: value.$2?.tryGet(1)?.text,
    //           firstPrizeList: [
    //             value.$2?.tryGet(3)?.text.trim(),
    //             value.$2?.tryGet(4)?.text.trim(),
    //             value.$2?.tryGet(5)?.text.trim(),
    //           ],
    //         ));

    return _dio
        .get("https://${Config.baseUrl}/index.html")
        .then((value) => value.data)
        .then((value) => parse(value))
        .then((value) => (value.querySelector(".etw-web"), value.querySelector(".container-fluid")))
        .then((value) => (value.$1?.querySelector(".etw-on"), value.$2?.querySelectorAll(".etw-tbiggest")))
        .then((value) => InvoiceNumberRaw(
              year: int.tryParse("${value.$1?.text[0]}${value.$1?.text[1]}${value.$1?.text[2]}"),
              month: int.tryParse("${value.$1?.text[4]}${value.$1?.text[5]}"),
              specialPrize: value.$2?.tryGet(0)?.text,
              grandPrize: value.$2?.tryGet(1)?.text,
              firstPrizeList: [
                value.$2?.tryGet(3)?.text.trim(),
                value.$2?.tryGet(4)?.text.trim(),
                value.$2?.tryGet(5)?.text.trim(),
              ],
            ));
  }
}
