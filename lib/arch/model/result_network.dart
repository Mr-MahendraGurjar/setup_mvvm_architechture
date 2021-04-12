import 'package:setup_mvvm_architechture/network/error_response.dart';
import 'package:meta/meta.dart';

@sealed
abstract class ResultNetwork<T> {
  R when<R>({
    @required R Function(Success<T>)? success,
    @required R Function(Error)? error,
    @required R Function(ExceptionError)? exception,
  }) {
    if (this is Success<T>) {
      return success!(this as Success<T>);
    } else if (this is Error) {
      return error!(this as Error);
    } else if (this is ExceptionError) {
      return exception!(this as ExceptionError);
    } else {
      throw new Exception('Unhendled part, could be anything');
    }
  }
}

class Success<T> extends ResultNetwork<T> {
  final T data;
  final int responseCode;

  Success(this.data, this.responseCode);
}

class Error<T> extends ResultNetwork<T> {
  final ErrorResponse data;

  Error(this.data);
}

class ExceptionError<T> extends ResultNetwork<T> {
  final Exception exception;

  ExceptionError(this.exception);
}
