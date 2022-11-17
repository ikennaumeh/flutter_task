import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_task/core/app/app.logger.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';


class HttpService {
  final Logger logger = getLogger('HttpService');
  Duration timeOutLimit = const Duration(seconds: 15);

  void throwOnFailureCodeException(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      logger.i('==============NETWORK ERROR===============');
      logger.i(response.body);
      logger.i('==============NETWORK ERROR===============');
    }
  }

  void logResponse(http.Response response) {
    logger.i('Server Response to '
        '${response.request?.method.toUpperCase()} '
        '${response.request?.url.path} : '
        'StatusCode: ${response.statusCode}');
  }

  Future<http.Response> get(
      Uri url, {
        Map<String, String>? headers,
        Map<String, String>? params,
      }) async {
    try {
      if (params != null) {
        url = url.replace(queryParameters: params);
      }

      var response =
      await http.get(url, headers: headers).timeout(timeOutLimit);

      throwOnFailureCodeException(response);
      logResponse(response);

      return response;
    } on http.ClientException catch (e) {
      throw SocketException("ClientException has occurred: $e");
    } on IOException catch (e) {
      throw SocketException("IOException has occurred: $e");
    } on TimeoutException catch (e) {
      throw SocketException("Network TimeoutException has occurred: $e");
    }
  }

}