import 'package:setup_mvvm_architechture/network/api_client.dart';
import 'package:setup_mvvm_architechture/network/error_response.dart';
import 'package:dio/dio.dart';
import 'exceptions/connection_exception.dart';
import 'exceptions/unknown_network_exception.dart';

class BaseResponseHandler<S extends Object?> {
  S? successData;
  ErrorResponse? errorData;
  Exception? exception;
  ResponseStatus? responseStatus;

  BaseResponseHandler._();

  BaseResponseHandler.exception(e) {
    this.exception = e;
    this.responseStatus = ResponseStatus.EXCEPTION;
  }

  BaseResponseHandler.handle(
      Response? response, Function(Map<String, dynamic>)? parser) {
    switch (response!.statusCode) {
      case ApiClient.kCodeErrorConnection:
        _connectionError();
        break;
      case ApiClient.kCodeSuccess200:
        _success(response.data, parser!);
        break;
      case ApiClient.kLoginError203:
        _loginErrorData(ErrorResponse.fromJson(response.data));
        break;
      case ApiClient.kAuthFailed404:
        _errorData(ErrorResponse.fromJson(response.data));
        break;
      case ApiClient.kError500:
        _errorData(ErrorResponse.fromJson(response.data));
        break;
      case ApiClient.kUserError412:
        _userErrorData(ErrorResponse.fromJson(response.data));
        break;
      default:
        _unknownException();
        break;
    }
  }

  BaseResponseHandler.handleList(
      Response response, Function(List<dynamic>) parser) {
    switch (response.statusCode) {
      case ApiClient.kCodeErrorConnection:
        _connectionError();
        break;
      case ApiClient.kCodeSuccess200:
        _successList(response.data, parser);
        break;
      case ApiClient.kAuthFailed404:
        _errorData(ErrorResponse.fromJson(response.data));
        break;
      case ApiClient.kError500:
        _errorData(ErrorResponse.fromJson(response.data));
        break;
      default:
        _unknownException();
        break;
    }
  }

  _successList(List<dynamic> data, Function parser) {
    this.successData = parser(data);
    this.responseStatus = ResponseStatus.SUCCESS;
  }

  _success(Map<String, dynamic> data, Function parser) {
    this.successData = parser(data);
    this.responseStatus = ResponseStatus.SUCCESS;
  }

  _connectionError() {
    this.exception = ConnectionException();
    this.responseStatus = ResponseStatus.CONNECTION_ERROR;
  }

  _errorData(ErrorResponse data) {
    this.errorData = data;
    this.responseStatus = ResponseStatus.ERROR_DATA;
  }

  _userErrorData(ErrorResponse data) {
    this.errorData = data;
    this.responseStatus = ResponseStatus.USER_ERROR;
  }

  _loginErrorData(ErrorResponse data) {
    this.errorData = data;
    this.responseStatus = ResponseStatus.LOGIN_ERROR;
  }

  _unknownException() {
    this.exception = UnknownNetworkException();
    this.responseStatus = ResponseStatus.EXCEPTION;
  }
}

enum ResponseStatus {
  SUCCESS,
  CONNECTION_ERROR,
  ERROR_DATA,
  LOGIN_ERROR,
  USER_ERROR,
  EXCEPTION,
}
