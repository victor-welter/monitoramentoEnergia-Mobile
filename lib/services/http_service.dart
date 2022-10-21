import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constants/routes/web_routes.dart';
import '../models/erros/error_model.dart';
import '../utils/response_validate.dart';
import 'internet_service.dart';

class HttpService {
  ///Responsável por fazer requisições do tipo `GET`
  static Future<dynamic> get({
    required String rota,

    ///Utilize a propriedade [urlCompleta] quando desejar usar um link completo, sem interferências da base url selecionada na tela de login
    String? urlCompleta,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (await InternetService.hasInternet()) {
      try {
        String urlRequest;
        if (urlCompleta == null) {
          urlRequest = WebRoutes.URL_SERVIDOR + rota;
        } else {
          urlRequest = urlCompleta;
        }

        final dio = Dio();

        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            debugPrint('Certificate Failed');
            return true;
          };

          client.idleTimeout = const Duration(seconds: 60);

          client.connectionTimeout = const Duration(minutes: 2);

          return null;
        };

        if (headers != null) {
          headers.addAll({
            HttpHeaders.acceptHeader: 'application/json',
          });
        }

        Response response = await dio.get(
          urlRequest,
          queryParameters: params,
          options: Options(
            headers: headers,
            followRedirects: false,
            contentType: 'application/json',
            maxRedirects: 0,
            method: 'GET',
            validateStatus: (status) {
              return (status ?? 404) < 400;
            },
          ),
        );

        ResponseValidate.validate(resp: response, rota: rota);

        return response.data;
      } on DioError catch (err) {
        ResponseValidate.validateDioError(error: err, rota: rota);
      } catch (_) {
        rethrow;
      }
    } else {
      throw ErrorModel.internet();
    }
  }

  ///Responsável por fazer requisições do tipo `POST`
  static Future<dynamic> post({
    required String rota,

    ///Utilize a propriedade [urlCompleta] quando desejar usar um link completo, sem interferências da base url selecionada na tela de login
    String? urlCompleta,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (await InternetService.hasInternet()) {
      try {
        String urlRequest;
        if (urlCompleta == null) {
          urlRequest = WebRoutes.URL_SERVIDOR + rota;
        } else {
          urlRequest = urlCompleta;
        }

        final dio = Dio();

        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            debugPrint('Certificate Failed');
            return true;
          };

          client.idleTimeout = const Duration(seconds: 60);

          client.connectionTimeout = const Duration(minutes: 2);

          return null;
        };

        if (headers != null) {
          headers.addAll({
            HttpHeaders.acceptHeader: 'application/json',
          });
        }

        Response response = await dio.post(
          urlRequest,
          data: body,
          queryParameters: params,
          options: Options(
            headers: headers,
            followRedirects: false,
            contentType: 'application/json',
            maxRedirects: 0,
            method: 'POST',
            validateStatus: (status) {
              return (status ?? 404) < 400;
            },
          ),
        );

        ResponseValidate.validate(resp: response, rota: urlRequest);

        return response.data;
      } on DioError catch (err) {
        ResponseValidate.validateDioError(error: err, rota: rota);
      } catch (_) {
        rethrow;
      }
    } else {
      throw ErrorModel.internet();
    }
  }
}
