import 'package:setup_mvvm_architechture/arch/base_response.dart';
import 'package:setup_mvvm_architechture/arch/exceptions/unknown_network_exception.dart';
import 'package:setup_mvvm_architechture/arch/logger.dart';
import 'package:setup_mvvm_architechture/network/dynamic_server_url_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retry/retry.dart';

import 'auth_interceptor.dart';
import 'error_response.dart';

class ApiClient {
  static final String? kBaseUrl = 'https://staging-api.cx360.net/api/';
  // static final String kBaseApiKey = '891E37F1-B9C9-4FBF-8DDD-8D1F1CA2E58B'; // TELEHEALTH
  static final String? kBaseApiKey =
      '6C194C7A-A3D0-4090-9B62-9EBAAA3848C5'; // BASE&$_1011
  static final String kBaseAppIdentifier = 'Cx360 EVV';

  static const int? kCodeUnknown = -1;
  static const int? kCodeErrorConnection = -2;
  static const int? kCodeSuccess200 = 200;
  static const int? kLoginError203 = 203;
  static const int? kAuthFailed404 = 404;
  static const int? kUserError412 = 412;
  static const int? kError500 = 500;

  static const int? kConnectTimeout = 60000;

  final RetryOptions? retryOptions = RetryOptions(maxAttempts: 2);
  Dio? client;

  ApiClient() {
    BaseOptions options = new BaseOptions(
      baseUrl: kBaseUrl!,
      connectTimeout: kConnectTimeout,
    );

    client = Dio(options);
    // client!.transformer = FlutterTransformer();
    // client!.interceptors.add(AuthInterceptor());
    // client!.interceptors.add(DynamicServerUrlInterceptor());

    if (kDebugMode) {
      client!.interceptors.add(
        LogInterceptor(
          responseBody: true,
          request: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          error: true,
        ),
      );
    }
  }

  Future<BaseResponseHandler<S>> onErrorHandler<S>(e) async {
    Logger.log('API client onErrorHandlerR: ${e.toString()}');
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.response:
          try {
            var response = e.response;
            return BaseResponseHandler.handle(response, ErrorResponse.fromJson);
          } catch (e) {
            return BaseResponseHandler.exception(e);
          }
          break;
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.cancel:
        case DioErrorType.other:
        default:
          // var errResponse = Response(statusCode: kCodeErrorConnection);
          return BaseResponseHandler.handle(null, null);
      }
    } else {
      return BaseResponseHandler.exception(UnknownNetworkException());
    }
  }
}
