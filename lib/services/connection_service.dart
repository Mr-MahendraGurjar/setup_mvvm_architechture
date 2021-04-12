import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';

class ConnectionService {
  bool hasConnection = false;

  Stream get connectionChange => _connectionChangeController.stream;

  late StreamController _connectionChangeController;

  void init() {
    // var _connectivity = Connectivity();
    _connectionChangeController = StreamController.broadcast();
    // _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  void dispose() {
    _connectionChangeController.close();
  }

  void _connectionChange(ConnectivityResult result) {
//    checkConnection();
    bool previousConnection = hasConnection;
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        hasConnection = true;
        if (previousConnection != hasConnection) {
          _connectionChangeController.add(hasConnection);
        }
        break;
      case ConnectivityResult.none:
        hasConnection = false;
        if (previousConnection != hasConnection) {
          _connectionChangeController.add(hasConnection);
        }
        break;
      default:
        hasConnection = false;
        break;
    }
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      print(result);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      _connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }

  Future<void> tryToSendNotSendVisitData(BuildContext context) async {
   
  }

  Future<void> saveFormData(BuildContext context) async {
    
  }

  Future<void> saveClientGroup(BuildContext context) async {
    
  }

  Future<void> saveClientGroupEVVData(BuildContext context) async {
    
  }
}
