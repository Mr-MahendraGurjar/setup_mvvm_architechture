import 'package:setup_mvvm_architechture/repository/local/preferences.dart';
import 'package:setup_mvvm_architechture/repository/local/preferences_keys.dart';

class PreferencesRepository {
  final Preferences _preferences;

  PreferencesRepository(this._preferences);

  Future<void> saveUserId(String value) async {
    await _preferences.put<String>(PrefsKeys.kUserId, value);
  }

  Future<String> getUserId() async {
    return _preferences.get<String>(PrefsKeys.kUserId, "");
  }

  Future<void> saveEVVTrackingID(String value) async {
    await _preferences.put<String>(PrefsKeys.kEVVTrackingID, value);
  }

  Future<String> getEVVTrackingID() async {
    return _preferences.get<String>(PrefsKeys.kEVVTrackingID, "");
  }

  Future<void> setIsRemember(bool value) async {
    await _preferences.put<bool>(PrefsKeys.kIsRemember, value);
  }

  Future<bool> getIsRemember() async {
    return _preferences.get<bool>(PrefsKeys.kIsRemember, true);
  }

  Future<void> setIsBiometricsEnabled(bool value) async {
    await _preferences.put<bool>(PrefsKeys.kIsBiometricsEnabled, value);
  }

  Future<bool> getIsBiometricsEnabled() async {
    return _preferences.get<bool>(PrefsKeys.kIsBiometricsEnabled, false);
  }

  Future<void> setIsPrivacyPolicyShowed(bool value) async {
    await _preferences.put<bool>(PrefsKeys.kPrivacyPolicyShowed, value);
  }

  Future<bool> getIsPrivacyPolicyShowed() async {
    return _preferences.get<bool>(PrefsKeys.kPrivacyPolicyShowed, false);
  }

  Future<void> setIsAllowUseBioAuth(bool value) async {
    await _preferences.put<bool>(PrefsKeys.kIsAllowUseBio, value);
  }

  Future<bool> getCanUseBio() async {
    return _preferences.get<bool>(PrefsKeys.kIsAllowUseBio, false);
  }

  Future<void> setInactivityTimeOut(int value) async {
    await _preferences.put<int>(PrefsKeys.kInactivityTimeOut, value);
  }

  Future<int> getInactivityTimeOut() async {
    return _preferences.get<int>(PrefsKeys.kInactivityTimeOut, 60);
  }

  Future<void> setDaysOffline(int value) async {
    await _preferences.put<int>(PrefsKeys.kDaysOffline, value);
  }

  Future<int> getDaysOffline() async {
    return _preferences.get<int>(PrefsKeys.kDaysOffline, 3);
  }

  Future<void> setLastAvailableDate() async {
    await _preferences.put<int>(
        PrefsKeys.kLastAvailableDate, DateTime.now().millisecondsSinceEpoch);
  }

  Future<int> getLastAvailableDate() async {
    return _preferences.get<int>(PrefsKeys.kLastAvailableDate, -1);
  }

  Future<void> setLastUpdateDate(int value) async {
    await _preferences.put<int>(PrefsKeys.kLastUpdateDate, value);
  }

  Future<int> getLastUpdateDate() async {
    return _preferences.get<int>(PrefsKeys.kLastUpdateDate, -1);
  }

  Future<void> saveLockedState(bool value) async {
    await _preferences.put<bool>(PrefsKeys.kUserLockedState, value);
  }

  Future<bool> getLockedState() async {
    return _preferences.get<bool>(PrefsKeys.kUserLockedState, false);
  }

  Future<void> setClientIdBase(int value) async {
    await _preferences.put<int>(PrefsKeys.kClientIdBase, value);
  }

  Future<int> getClientIdBase() async {
    return _preferences.get<int>(PrefsKeys.kClientIdBase, 5000000);
  }

  Future<void> setGroupIdBase(int value) async {
    await _preferences.put<int>(PrefsKeys.kGroupIdBase, value);
  }

  Future<int> getGroupIdBase() async {
    return _preferences.get<int>(PrefsKeys.kGroupIdBase, 5000000);
  }

  Future<void> setApiEndPoint(String value) async {
    await _preferences.put<String>(PrefsKeys.kApiEndPoint, value);
  }

  Future<String> getApiEndPoint() async {
    return _preferences.get<String>(PrefsKeys.kApiEndPoint, "");
  }

  Future<void> setAuthToken(String value) async {
    await _preferences.put<String>(PrefsKeys.kAuthToken, value);
  }

  Future<String> getAuthToken() async {
    return _preferences.get<String>(PrefsKeys.kAuthToken, "");
  }

  Future<void> setUserName(String value) async {
    await _preferences.put<String>(PrefsKeys.kUserName, value);
  }

  Future<String> getUserName() async {
    return _preferences.get<String>(PrefsKeys.kUserName, "");
  }

  Future<void> setLastTimeStamp(String value) async {
    await _preferences.put<String>(PrefsKeys.kTimeStamp, value);
  }

  Future<String> getLastTimeStamp() async {
    return _preferences.get<String>(PrefsKeys.kTimeStamp, "");
  }

  Future<void> setReferralFormId(String value) async {
    await _preferences.put<String>(PrefsKeys.kReferralFormId, value);
  }

  Future<String> getReferralFormId() async {
    return _preferences.get<String>(PrefsKeys.kReferralFormId, "");
  }

  Future<void> setIntakeFormId(String value) async {
    await _preferences.put<String>(PrefsKeys.kIntakeFormId, value);
  }

  Future<String> getIntakeFormId() async {
    return _preferences.get<String>(PrefsKeys.kIntakeFormId, "");
  }

  Future<void> setReferralId(String value) async {
    await _preferences.put<String>(PrefsKeys.kReferralId, value);
  }

  Future<String> getReferralId() async {
    return _preferences.get<String>(PrefsKeys.kReferralId, "");
  }

  Future<void> setIntakeId(String value) async {
    await _preferences.put<String>(PrefsKeys.kIntakeId, value);
  }

  Future<String> getIntakeId() async {
    return _preferences.get<String>(PrefsKeys.kIntakeId, "");
  }

  Future<void> setClientProgramId(String value) async {
    await _preferences.put<String>(PrefsKeys.kClientProgramId, value);
  }

  Future<String> getClientProgramId() async {
    return _preferences.get<String>(PrefsKeys.kClientProgramId, "");
  }

  Future<void> setClientListData(String value) async {
    await _preferences.put<String>(PrefsKeys.kClientData, value);
  }

  Future<String> getClientListData() async {
    return _preferences.get<String>(PrefsKeys.kClientData, "");
  }
}
