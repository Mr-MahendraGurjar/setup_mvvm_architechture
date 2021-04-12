import 'package:setup_mvvm_architechture/network/api_client.dart';
import 'package:setup_mvvm_architechture/network/error_response.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'model/result_network.dart';

class BaseApiService {
  /*ResultNetwork<dynamic> apiCall<T>(Response<dynamic> response) {
    if (response.statusCode == ApiClient.kCodeSuccess200) {
      return Success(response.data);
    } else {
      var errorData = ErrorResponse.fromJson(response.data);
      return Error(errorData);
    }
  }*/

//Future<Response<dynamic>>
  @protected
  ResultNetwork<T> apiCall<T>(Response<dynamic> response) {
    if (response.statusCode == ApiClient.kCodeSuccess200) {
      return Success<T>(response.data, response.statusCode!);
    } else {
      var errorData = ErrorResponse.fromJson(response.data);
      return Error<T>(errorData);
    }
  }

/*@protected
  Future<ResultNetwork> apiCall<T>(Future<Response<dynamic>> call) async {
    var response = await call;
    if (response.statusCode == ApiClient.kCodeSuccess200) {
      return Success(response.data, response.statusCode);
    } else {
      var errorData = ErrorResponse.fromJson(response.data);
      return Error(errorData);
    }
  }*/
}
