import 'package:setup_mvvm_architechture/repository/local/preferences_repository.dart';

class LocalSettings {
  final PreferencesRepository? _preferenceRepository;

  LocalSettings(this._preferenceRepository);

  bool? _isRemember;
  bool? _isPrivacyPolicyShowed;
  String? _lastCompanyCode;
  String? _lastUserName;
  String? _lastPassword;
  DateTime? _lastAvailableDate;

  String? get lastCompanyCode => _lastCompanyCode;

  String? get lastUserName => _lastUserName;

  String? get lastPassword => _lastPassword;

  bool? get isRemember => _isRemember;

  bool? get isPrivacyPolicyShowed => _isPrivacyPolicyShowed;

  DateTime? get lastAvailableDate => _lastAvailableDate;

  Future<void> init() async {
    // _lastCompanyCode = await _fetchLastCompanyCode();
    // _lastUserName = await _fetchLastUserName();
    // _lastPassword = await _fetchPassword();
    _isRemember = await _getIsRemember();
    // _isPrivacyPolicyShowed = await _getIsPrivacyPolicyShowed();
    // _lastAvailableDate = await _getLastAvailableDate();
  }

  // Future<String> _fetchPassword() async =>
  //     await _preferenceRepository?.getPassword();

  // Future<void> savePassword(String password) async {
  //   _lastPassword = password;
  //   await _preferenceRepository?.savePassword(password);
  // }

  // Future<String> _fetchLastUserName() async =>
  //     await _preferenceRepository?.getUserName();

  // Future<void> saveLastUserName(String value) async {
  //   _lastUserName = value;
  //   await _preferenceRepository?.saveUserName(value);
  // }

  // Future<String> _fetchLastCompanyCode() async =>
  //     await _secureStorageRepository.getCompanyCode();

  // Future<void> saveLastCompanyCode(String value) async {
  //   _lastCompanyCode = value;
  //   await _secureStorageRepository.saveCompanyCode(value);
  // }

  Future<bool> _getIsRemember() async =>
      await _preferenceRepository!.getIsRemember();

  Future<void> saveIsRemember(bool value) async {
    _isRemember = value;
    await _preferenceRepository!.setIsRemember(value);
  }

  Future<bool> _getIsPrivacyPolicyShowed() async =>
      await _preferenceRepository!.getIsPrivacyPolicyShowed();

  Future<void> savePrivacyPolicyShowed(bool value) async {
    _isPrivacyPolicyShowed = value;
    await _preferenceRepository!.setIsPrivacyPolicyShowed(value);
  }

  void tryToSaveCredentials(
      String companyCode, String userName, String password) {
    // if (isRemember!) {
    //   saveLastCompanyCode(companyCode);
    //   saveLastUserName(userName);
    //   savePassword(password);
    // } else {
    //   saveLastUserName(userName);
    // }
  }

  bool isFirstAppLogin() {
    return lastUserName == null &&
        lastCompanyCode == null &&
        lastPassword == null;
  }
}
