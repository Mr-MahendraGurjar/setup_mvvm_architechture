import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:dio/dio.dart';

class DynamicServerUrlInterceptor extends InterceptorsWrapper {
  static const String kAuthHeader = 'token';

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.headers.containsKey("requiresToken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");
      var serverUrl = await prefRepository().getApiEndPoint();
      print(
          "serverUrlserverUrlserverUrlserverUrlserverUrlserverUrlserverUrlserverUrlserverUrl");
      print(serverUrl);
      options.baseUrl = serverUrl + "api/";
      return options;
    }
    if (options.headers.containsKey("requiresToken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response,
    ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }
}
