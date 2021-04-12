import 'dart:async';

import 'package:flutter/foundation.dart';

import 'logger.dart';

abstract class BaseViewModel {
  StreamController<Exception>? _errorStreamController;
  StreamController<bool>? _loadingStreamController;

  Stream<Exception> get errorStream => _errorStreamController!.stream;

  Stream<bool> get isLoadingStream => _loadingStreamController!.stream;

  BaseViewModel() {
    _errorStreamController = StreamController<Exception>();
    _loadingStreamController = StreamController<bool>();
  }

  @mustCallSuper
  void dispose() {
    _errorStreamController!.close();
    _loadingStreamController!.close();
  }

  void onError(Exception e) {
    Logger.logTag(BaseViewModel, "onError: ${e.toString()}");
    if (!_errorStreamController!.isClosed) {
      _errorStreamController!.add(e);
    }
  }

  void isLoading(bool loading) {
    if (!_loadingStreamController!.isClosed) {
      _loadingStreamController!.add(loading);
    }
  }
}
