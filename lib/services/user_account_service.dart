import 'dart:async';
import 'dart:io';

import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/repository/local/preferences_repository.dart';
import 'package:rxdart/rxdart.dart';

class UserAccountService {
  int? _pausedTimestamp = 0;
  int? _kInactivityInMillis = 60000;
  SessionStatus? _status;
  String? _token;
  String? _userId;
  String? _deviceId;
  bool? _lockedState;

  final PreferencesRepository _prefs;

  BehaviorSubject<SessionStatus>? _sessionObserver;

  BehaviorSubject<SessionStatus> get sessionObserver => _sessionObserver!;

  String get token => _token!;

  String get userId => _userId!;

  String get deviceId => _deviceId!;

  bool get lockedState => _lockedState!;

  UserAccountService(this._prefs) {
    _sessionObserver = BehaviorSubject<SessionStatus>();
  }

  Future<void> init() async {
    _pausedTimestamp = 0;
    var min = await _prefs.getInactivityTimeOut();
    _kInactivityInMillis = _minToMillis(min);
    _token = await _getToken();
    _userId = await _getUserId();
    // _deviceId = await _getDeviceId();
    _lockedState = await _getLockedState();
  }

  Future<void> initSession(String token, int userId) async {
    await saveToken(token);
    await saveUserId(userId);
    _status = SessionStatus.LOG_IN;
    _sessionObserver?.add(_status!);
  }

  void disposeSession() {
    // secureStorageRepository().saveToken("");
    // prefRepository().setLastTimeStamp("");
    _status = SessionStatus.LOG_OUT;
    _sessionObserver?.add(_status!);
  }

  void onPaused() {
    _pausedTimestamp = DateTime.now().millisecondsSinceEpoch;
  }

  void onResumed() {
    if (_pausedTimestamp == 0) {
      return;
    }
    var current = DateTime.now().millisecondsSinceEpoch;
    var elapsedMillis = current - _pausedTimestamp!;
    if (elapsedMillis > _kInactivityInMillis!) {
      _pausedTimestamp = 0;
      disposeSession();
    } else {
      _pausedTimestamp = 0;
    }
  }

  Future<String> _getToken() async =>
      await prefRepository().getAuthToken();

  Future<void> saveToken(String value) async {
    _token = value;
    await prefRepository().setAuthToken(value);
  }

  Future<String> _getUserId() async => await _prefs.getUserId();

  Future<void> saveUserId(int value) async {
    _userId = value.toString();
    await _prefs.saveUserId(value.toString());
  }

  Future<bool> _getLockedState() async => await _prefs.getLockedState();

  Future<void> saveLockedState(bool value) async {
    _lockedState = value;
    await _prefs.saveLockedState(value);
  }

  int _minToMillis(int minutes) => minutes * 60 * 1000;

  // Future<String> _getDeviceId() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
  //     return iosDeviceInfo.identifierForVendor;
  //   } else {
  //     AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
  //     return androidDeviceInfo.androidId;
  //   }
  // }
}

enum SessionStatus { LOG_IN, LOG_OUT }
