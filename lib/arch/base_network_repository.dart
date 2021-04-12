import 'package:setup_mvvm_architechture/arch/exceptions/login_exception.dart';
import 'package:setup_mvvm_architechture/arch/exceptions/user_exception.dart';

import 'base_response.dart';
import 'model/result.dart';

abstract class BaseNetworkRepository {
  void dispose();

  Result<T> defaultResponseHandler<T>(BaseResponseHandler<T> result) {
    switch (result.responseStatus) {
      case ResponseStatus.SUCCESS:
        return Success<T>(result.successData!);
      case ResponseStatus.CONNECTION_ERROR:
        return Error<T>(result.exception!);
      case ResponseStatus.ERROR_DATA:
        return Error<T>(Exception("${result.errorData!.message}"));
      case ResponseStatus.EXCEPTION:
        return Error<T>(result.exception!);
      case ResponseStatus.USER_ERROR:
        return Error<T>(UserException(cause: result.errorData!.message));
      case ResponseStatus.LOGIN_ERROR:
        return Error<T>(LoginException(cause: result.errorData!.message));
      default:
        return Error<T>(Exception());
    }
  }

  Result<S> defaultResponseHandlerConverter<T, S>(
      BaseResponseHandler<T> result, Function(T) converter) {
    switch (result.responseStatus) {
      case ResponseStatus.SUCCESS:
        return Success<S>(converter(result.successData!));
      case ResponseStatus.CONNECTION_ERROR:
        return Error<S>(result.exception!);
      case ResponseStatus.ERROR_DATA:
        return Error<S>(Exception("${result.errorData!.message}"));
      case ResponseStatus.EXCEPTION:
        return Error<S>(result.exception!);
      case ResponseStatus.USER_ERROR:
        return Error<S>(UserException(cause: result.errorData!.message));
      default:
        return Error<S>(Exception());
    }
  }
}
