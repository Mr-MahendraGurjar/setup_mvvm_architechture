import 'dart:async';

import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/arch/base_view_model.dart';
import 'package:setup_mvvm_architechture/arch/exceptions/connection_exception.dart';
import 'package:setup_mvvm_architechture/arch/exceptions/login_exception.dart';
import 'package:setup_mvvm_architechture/arch/exceptions/user_exception.dart';
import 'package:setup_mvvm_architechture/mvvm/model/GetApiKeyResponse.dart';
import 'package:setup_mvvm_architechture/mvvm/model/LoginResponse.dart';
import 'package:setup_mvvm_architechture/utils/validators/company_code_validator.dart';
import 'package:setup_mvvm_architechture/utils/validators/password_validator.dart';
import 'package:setup_mvvm_architechture/utils/validators/user_name_validator.dart';
import 'package:setup_mvvm_architechture/arch/base_value_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

String TOKEN_VALUE = "";

class LoginViewModel extends BaseViewModel {
  StreamController<LoginStatus>? _loginStreamController;
  final BaseValueValidator? codeValidator = CompanyCodeValidator();
  final BaseValueValidator? passwordValidator = PasswordValidator();
  final BaseValueValidator? userNameValidator = UserNameValidator();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  bool firstBioAuth = false;
  String baseApiKey = "";
  String companyCode = "";
  String userName = "";
  String password = "";

  String userError = "";

  int _loginAttempts = 0;

  LoginViewModel() {
    _loginStreamController = StreamController<LoginStatus>();
    codeController.text = 'BASE72_1011';
    userNameController.text = 'bbala@coresolutionsinc.com';
    passwordController.text = 'test@123456';
  }

  Stream<LoginStatus> get loginStream => _loginStreamController!.stream;

  @override
  void dispose() {
    super.dispose();
    _loginStreamController?.close();
  }

  Future<void> getApiKey(BuildContext context) async {
    var result = await networkRepository().getApiKey(
      companyCode,
    );
    result.when(
      success: (success) async {
        await _onGetApiKeySuccess(success.data, context);
      },
      error: (error) {
        _onLoginError(error.exception, context);
      },
    );
  }

  Future<void> login(BuildContext context) async {
    var result = await networkRepository().login(
      baseApiKey,
      companyCode,
      userName,
      password,
    );
    result.when(
      success: (success) async {
        await _onLoginSuccess(success.data, context);
      },
      error: (error) {
        _onLoginError(error.exception, context);
      },
    );
  }

  Future<void> _onGetApiKeySuccess(
      GetApiKeyResponse data, BuildContext context) async {
    var apiKey = data.aPIkey;
    print("**apikey" + apiKey!);
    if (data.aPIkey != null) {
      this.baseApiKey = data.aPIkey!;
      prefRepository().setApiEndPoint(data.endPoint!);
      login(context);
    } else {
      dialogService().hideProgressDialog();
    }
  }

  Future<void> _onLoginSuccess(LoginResponse data, BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var lastUserName = localSettings().lastUserName;
    var lastCompanyCode = localSettings().lastCompanyCode;

    if (data.token != null) {
      _loginStreamController?.sink.add(LoginStatus.FIRST_LOGIN);
      TOKEN_VALUE = data.token!;
      prefRepository().setAuthToken(data.token!);
      prefRepository().setUserName(data.userName!);
      prefRepository().setInactivityTimeOut(data.inactivityTimeOut!);
      await userAccountService().initSession(TOKEN_VALUE, data.userID!);
    } else {
      onError(Exception(str(context).loginFailed));
    }
  }

  void _onLoginError(Exception exception, BuildContext context) {
    switch (exception.runtimeType) {
      case ConnectionException:
        // tryLoginOffline(context);
        break;
      case UserException:
        userError = exception.toString();
        if (!_loginStreamController!.isClosed) {
          _loginStreamController!.sink.add(LoginStatus.ERROR_LOGIN);
        }
        break;
      case LoginException:
        onError(exception);
        break;
      default:
        onError(exception);
        break;
    }
  }
}

enum LoginStatus {
  FIRST_LOGIN,
  DEFAULT_LOGIN,
  ERROR_OFFLINE_LOGIN,
  ERROR_LOGIN,
}

enum BioLoginStatus {
  SUCCESS,
  MANY_ATTEMPTS,
  ERROR,
}
