import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/arch/base_response.dart';
import 'package:setup_mvvm_architechture/mvvm/model/GetApiKeyResponse.dart';
import 'package:setup_mvvm_architechture/mvvm/model/LoginResponse.dart';
import 'package:setup_mvvm_architechture/mvvm/model/search_list_data.dart';
import 'package:dio/dio.dart';

import 'api_client.dart';

class ApiService {
  static final String kGetApiKey = "GetAPIKey";
  static final String kGetEndPoint = "GetAPIkeyEndPoint";

  static final String kLogin = "AuthenticateUser";
  static final String kUserEVVTracking = "Common/UserEVVTracking";
  static final String kAppointmentList = "Client/GetEVVClientList";
  static final String kAllFormsData = "Common/GetMobileForms";
  static final String kMenuList = "/Menu/GetMobileMenu";
  static final String kSendVisitDataList = "Client/SaveEVV";
  static final String kSaveGroupEVV = "Client/SaveGroupEVV";
  static final String kSendFormDataList = "Client/SaveForm";
  static final String kOfflineSaveForm = "Common/OfflineSaveForm";
  static final String kUpdateFormDataList = "Client/UpdateForm";
  static final String kGetFormDetails = "Common/GetRecordDetails";
  static final String kClientList = "Incident/GetAllClient";
  static final String kClientDetails = "Common/GetMobileFaceSheet";
  static final String kSearchList = "Client/GetClientSearch";
  static final String kAppointmentInfo = "Client/GetClientInfo";
  static final String kLoginHistory = "Client/AddUserLoginHistory";
  static final String kZipCode = "Common/GetZipDetails";
  static final String kGetList = "Common/GetList";
  static final String kManageGroup = "Client/ManageGroup";
  static final String kManageOfflineGroup = "Client/ManageOfflineGroup";

  static final String kGetToken = "getToken";
  static final String kLogout = "logout";

  static final String kHeaderApiKey = "APIKEY";
  static final String kHeaderCustomerCode = "CustomerCode";
  static final String kHeaderUserName = "UserName";
  static final String kHeaderPassword = "Password";

  static final String kEVVTrackingID = "EVVTrackingID";
  static final String kGPSCoordinates = "GPSCoordinates";
  static final String kAction = "Action";

  static final String kParamPage = "Page";
  static final String kParamUserID = "UserID";
  static final String kParamQuery = "query";
  static final String kParamAppointmentId = "AppointmentID";
  static final String kParamClientId = "ClientID";
  static final String kKeyFieldID = "KeyFieldID";
  static final String kFormID = "FormID";
  static final String kParamZipCode = "ZipCode";
  static final String kParamTimeStamp = "TimeStamp";
  static final String kParamNoOfClient = "NoofClient";
  static final String kParamPageNo = "PageNo";
  static final String kParamFormName = "FormName";
  static final String kParamCriteria = "Criteria";

  static final String kParamLoginDeviceId = "LoginDevice";
  static final String kParamApp = "App";
  static final String kParamAppLocked = "isAppLocked";
  static final String kParamInvalidPassword = "invalidPassword";
  static final String kParamGroupId = "GroupID";
  static final String kParamClients = "Clients";
  static final String kParamMode = "Mode";

  final ApiClient _apiClient;

  ApiService(this._apiClient);

  Future<BaseResponseHandler<GetApiKeyResponse>> getApiKey(String cc) async {
    try {
      var options = Options(
        headers: {kHeaderCustomerCode: cc, "requiresToken": true},
      );
      Response response = await _apiClient.retryOptions!.retry(
        () async =>
            await _apiClient.client!.get(kGetEndPoint, options: options),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return BaseResponseHandler<GetApiKeyResponse>.handle(
        response,
        GetApiKeyResponse.fromJson,
      );
    } catch (e) {
      return _apiClient.onErrorHandler<GetApiKeyResponse>(e);
    }
  }

  Future<BaseResponseHandler<LoginResponse>> login(
      String baseApiKey, String cc, String userName, String password) async {
    try {
      var options = Options(
        headers: {
          kHeaderApiKey: baseApiKey,
          kHeaderCustomerCode: cc,
          kHeaderUserName: userName,
          kHeaderPassword: password
        },
      );
      Response response = await _apiClient.retryOptions!.retry(
        () async => await _apiClient.client!.get(kLogin, options: options),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return BaseResponseHandler<LoginResponse>.handle(
        response,
        LoginResponse.fromJson,
      );
    } catch (e) {
      return _apiClient.onErrorHandler<LoginResponse>(e);
    }
  }

  Future<BaseResponseHandler<SearchListData>> loadClientList(
      String lastTimeStamp, noOfClient, pageNo) async {
    try {
      var token = await prefRepository().getAuthToken();
      var options = Options(
        headers: {
          kParamTimeStamp: lastTimeStamp,
          'token': token,
        },
      );
      Response response = await _apiClient.client!.get(
        kClientList,
        options: options,
        // queryParameters: {kParamNoOfClient: noOfClient, kParamPageNo: pageNo},
      );
      return BaseResponseHandler<SearchListData>.handleList(
        response,
        SearchListData.fromJson,
      );
    } catch (e) {
      return _apiClient.onErrorHandler<SearchListData>(e);
    }
  }
}
