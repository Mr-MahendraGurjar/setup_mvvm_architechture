import 'package:setup_mvvm_architechture/arch/base_network_repository.dart';
import 'package:setup_mvvm_architechture/arch/model/result.dart';
import 'package:setup_mvvm_architechture/mvvm/model/LoginResponse.dart';
import 'package:setup_mvvm_architechture/mvvm/model/search_list_data.dart';
import 'package:setup_mvvm_architechture/network/api_service.dart';
import 'package:flutter/cupertino.dart';

class NetworkRepository extends BaseNetworkRepository {
  final ApiService _apiService;

  NetworkRepository(this._apiService);

  Future<Result<dynamic>> getApiKey(String cc) async {
    var result = await _apiService.getApiKey(cc);
    return defaultResponseHandler<dynamic>(result);
  }

  Future<Result<LoginResponse>> login(
      String baseApiKey, String cc, String userName, String password) async {
    NetworkRepository(this._apiService);
    var result = await _apiService.login(baseApiKey, cc, userName, password);
    return defaultResponseHandler<LoginResponse>(result);
  }

  Future<Result<SearchListData>> loadClientList(
      String lastTimeStamp, noOfClient, pageNo) async {
    var result =
        await _apiService.loadClientList(lastTimeStamp, noOfClient, pageNo);
    return defaultResponseHandler<SearchListData>(result);
  }

  @override
  void dispose() {}
}
