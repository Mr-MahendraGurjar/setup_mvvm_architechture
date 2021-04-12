import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  static const String kAuthHeader = 'token';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = userAccountService().token;
    options.headers[kAuthHeader] = token;
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }
}
