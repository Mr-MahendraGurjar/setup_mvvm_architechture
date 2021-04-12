import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

const String EN = 'en';

const Map<String, String> SUPPORTED_LOCALES_MAP = {
  EN: 'English',
};

const Map<String, String> SUPPORTED_LOCALES_ID_CODE = {
  EN: 'en_US',
};

AppLocalizations str(BuildContext context) => AppLocalizations.of(context);

class AppLocalizations {
  String get appName => Intl.message("Cx360", name: "appName");

  String get phoneValidationError =>
      Intl.message("Phone number not valid", name: "phoneValidationError");

  String get companyCodeHint =>
      Intl.message("Company code", name: "companyCodeHint");

  String get usernameHint => Intl.message("Username", name: "usernameHint");

  String get passwordHint => Intl.message("Password", name: "passwordHint");

  String get rememberMe =>
      Intl.message("Remember company code and login.", name: "rememberMe");

  String get btnLoginText => Intl.message("LOGIN", name: "btnLoginText");

  String get userBlockedMsg =>
      Intl.message("User is blocked, contact administrator",
          name: "userBlockedMsg");

  String get loginFailed => Intl.message("Login failed", name: "loginFailed");

  String get pleaseAuthenticate =>
      Intl.message('Please authenticate', name: 'pleaseAuthenticate');

  String get pleaseWait => Intl.message('Please wait', name: 'pleaseWait');

  String get close => Intl.message('Close', name: 'close');

  String get defaultErrorTitle =>
      Intl.message('Error', name: 'defaultErrorTitle');

  String get defaultInfoTitle => Intl.message('Info', name: 'defaultInfoTitle');

  String get defaultErrorConnectionMessage =>
      Intl.message('Connection Error', name: 'defaultErrorConnectionMessage');

  String get allowBioDialogTitle =>
      Intl.message('Do you want to allow cx360 to use bio auth?',
          name: 'allowBioDialogTitle');

  String get allowBioDialogMessage => Intl.message(
      'cx360 uses bio auth to restrict unauthoried users from accessingthe app.',
      name: 'allowBioDialogMessage');

  String get dontAllowDialogNegative =>
      Intl.message('Don\'t allow', name: 'dontAllowDialogNegative');

  String get okDialogPositive => Intl.message('OK', name: 'okDialogPositive');

  String get cancelDialogNegative =>
      Intl.message('CANCEL', name: 'cancelDialogNegative');

  String get settingsDialogBtn =>
      Intl.message('SETTINGS', name: 'settingsDialogBtn');

  String get dialogAbandonBtnText =>
      Intl.message('ABANDON', name: 'okDialogPositive');

  String get dialogCompleteBtnText =>
      Intl.message('COMPLETE', name: 'okDialogPositive');

  String get allowGeoDialogTitle => Intl.message(
      'Allow cx360 to access your location while you are using the app?',
      name: 'allowBioDialogTitle');

  String get allowGeoDialogDescription => Intl.message(
      'Location tracking is used only for recording your GPS coordinates while you use your app to record a service visit. This is to meet Electronic Visit Verification to meet 21st Century Cures Act Requirements.',
      name: 'allowGeoDialogDescription');

  String get allowGeoDialogMessage => Intl.message(
      'Ea est Lorem fugiat esse ex sit elit. Irure dolor excepteur officia eu excepteur consectetur.',
      name: 'allowBioDialogMessage');

  String get privacyPolicyScreenName =>
      Intl.message('Privacy policy', name: 'privacyPolicyScreenName');

  String get clientListScreenName =>
      Intl.message('Clients & Appointments', name: 'clientListScreenName');

  String get clientDetailScreenName =>
      Intl.message('Clients Details', name: 'clientDetailScreenName');

  String get lifePlanFormScreenName =>
      Intl.message('LifePlan Details', name: 'lifePlanFormScreenName');

  String get availableFormsScreenName =>
      Intl.message('Available Forms', name: 'availableFormsScreenName');

  String get chooseServiceScreenName =>
      Intl.message('Choose service', name: 'chooseServiceScreenName');

  String get currentVisitScreenName =>
      Intl.message('Current visit', name: 'currentVisitScreenName');

  String get visitNoteScreenName =>
      Intl.message('Visit note', name: 'visitNoteScreenName');

  String get visitSummaryScreenName =>
      Intl.message('Visit Summary', name: 'visitSummaryScreenName');

  String get endVisitScreenName =>
      Intl.message('End visit', name: 'endVisitScreenName');

  String get searchHintText => Intl.message('Search', name: 'searchHintText');

  String get startVisitBtnText =>
      Intl.message('START VISIT', name: 'startVisitBtnText');

  String get visitDateLabel =>
      Intl.message('Visit date', name: 'visitDateLabel');

  String get addressLabel => Intl.message('Address', name: 'addressLabel');

  String get typeServiceLabel =>
      Intl.message('Type of Services', name: 'typeServiceLabel');

  String get saveBtnLabel => Intl.message('SAVE', name: 'saveBtnLabel');

  String get clientNameLabel =>
      Intl.message('Client’s Name:', name: 'clientNameLabel');

  String get clockInLabel => Intl.message('Clock-in:', name: 'clockInLabel');

  String get clockOutLabel => Intl.message('Clock-out:', name: 'clockOutLabel');

  String get serviceLabel => Intl.message('Service:', name: 'serviceLabel');

  String get confirmLabel => Intl.message('CONFIRM', name: 'confirmLabel');

  String get staffActionLabel =>
      Intl.message('Staff action', name: 'staffActionLabel');

  String get staffServiceProvidedLabel =>
      Intl.message('Service provided', name: 'staffServiceProvidedLabel');

  String get yesLabel => Intl.message('Yes', name: 'yesLabel');

  String get noLabel => Intl.message('No', name: 'noLabel');

  String get staffResponseLabel =>
      Intl.message('Response to Staff Action', name: 'staffResponseLabel');

  String get successfulLabel =>
      Intl.message('Successful', name: 'successfulLabel');

  String get unsuccessfulLabel =>
      Intl.message('Unsuccessful', name: 'unsuccessfulLabel');

  String get refusedLabel => Intl.message('Refused', name: 'refusedLabel');

  String get staffSupportLabel =>
      Intl.message('Support', name: 'staffActionLabel');

  String get verbalLabel => Intl.message('Verbal', name: 'verbalLabel');

  String get physicalLabel => Intl.message('Physical', name: 'physicalLabel');

  String get independentLabel =>
      Intl.message('Independent', name: 'independentLabel');

  String get coachingLabel => Intl.message('Coaching', name: 'coachingLabel');

  String get gestureLabel => Intl.message('Gesture', name: 'gestureLabel');

  String get notApplicableLabel =>
      Intl.message('Not Applicable', name: 'notApplicableLabel');

  String get visitNoteLabel =>
      Intl.message('Leave a visit note', name: 'visitNoteLabel');

  String get visitNoteTextHint =>
      Intl.message('Text Here', name: 'visitNoteTextHint');

  String get reportWasCreatedText =>
      Intl.message('Report was created', name: 'reportWasCreatedText');

  String get endVisitBtnText =>
      Intl.message('END VISIT', name: 'endVisitBtnText');

  String get offlineDialogTitle =>
      Intl.message('You are offline now', name: 'offlineDialogTitle');

  String get offlineDialogMessage =>
      Intl.message('To update data, connect to the Internet',
          name: 'offlineDialogMessage');

  String get visitNotCompletedDialogTitle =>
      Intl.message('Your visit is not completed',
          name: 'visitNotCompletedDialogTitle');

  String get visitNotCompletedDialogMessage =>
      Intl.message('Please complete the visit.',
          name: 'visitNotCompletedDialogMessage');

  String get clientGroupVisitNotCompletedDialogTitle =>
      Intl.message('Your group visit is not completed',
          name: 'visitNotCompletedDialogTitle');

  String get clientGroupVisitNotCompletedDialogMessage =>
      Intl.message('Please complete the  group visit.',
          name: 'visitNotCompletedDialogMessage');

  String get nextBtnLabel => Intl.message('NEXT', name: 'nextBtnLabel');

  String get locationDisableTitleDialog =>
      Intl.message('Location Tracking is Required to Use the App',
          name: 'locationDisableTitleDialog');

  String get bioErrorManyAttemptsDialogTitle =>
      Intl.message('The operation was canceled to too many attempts',
          name: 'bioErrorManyAttemptsDialogTitle');

  String get bioErrorDialogTitle =>
      Intl.message('Try to login with credentials',
          name: 'bioErrorDialogTitle');

  String get companyCodeEmptyValidatorErrorText =>
      Intl.message('company code is empty',
          name: 'companyCodeEmptyValidatorErrorText');

  String get companyCodeNotValidValidatorErrorText =>
      Intl.message('company code not valid',
          name: 'companyCodeNotValidValidatorErrorText');

  String get userNameEmptyValidatorErrorText =>
      Intl.message('user name is empty',
          name: 'userNameEmptyValidatorErrorText');

  String get userNameNotValidValidatorErrorText =>
      Intl.message('user name not valid',
          name: 'userNameNotValidValidatorErrorText');

  String get passwordEmptyValidatorErrorText =>
      Intl.message('password is empty',
          name: 'passwordEmptyValidatorErrorText');

  String get lastDataUpdateLabel =>
      Intl.message('Last data Update:', name: 'lastDataUpdateLabel');

  String get errorScreenLabel =>
      Intl.message('Error', name: 'errorScreenLabel');

  String get dateOfBirthLabel =>
      Intl.message('Date of Birth: ', name: 'dateOfBirthLabel');

  String get admitDateLabel =>
      Intl.message('Admit Date: ', name: 'admitDateLabel');

  String get referralDateLabel =>
      Intl.message('Referral Date: ', name: 'referralDateLabel');

  String get clientIdLabel =>
      Intl.message('Client ID: ', name: 'clientIdLabel');

  String get clientGenderLabel =>
      Intl.message('Gender: ', name: 'clientGenderLabel');

  String get policyNumberLabel =>
      Intl.message('Policy No: ', name: 'policyNumberLabel');

  String get insuranceCompanyLabel =>
      Intl.message('Insurance Company: ', name: 'insuranceCompanyLabel');

  String get insuranceTypeLabel =>
      Intl.message('Insurance Type: ', name: 'insuranceTypeLabel');

  String get emptyResults => Intl.message('No results', name: 'emptyResults');

  String get locationDisabledTitle =>
      Intl.message('Location disabled', name: 'locationDisabledTitle');

  String get startGroupVisit =>
      Intl.message('Start Group Visit', name: 'startGroupVisit');

  String get endGroupVisit =>
      Intl.message('End Group Visit', name: 'endGroupVisit');

  String get locationDisabledMessage =>
      Intl.message('Location Tracking is required to start visiting',
          name: 'locationDisabledMessage');

  String get locationDisabledEndVisitMessage =>
      Intl.message('Location Tracking is required to end visiting',
          name: 'locationDisabledEndVisitMessage');

  String get locationDisabledMessageGO =>
      Intl.message('Location Tracking is required to initiate the session',
          name: 'locationDisabledMessage');

  String get locationReceivingStart =>
      Intl.message('Receiving the location to start the visit',
          name: 'locationReceivingStart');

  String get locationReceivingStartGo =>
      Intl.message('Receiving the location to initiate a new session',
          name: 'locationReceivingStart');

  String get locationReceivingEnd =>
      Intl.message('Receiving the location to end the visit',
          name: 'locationReceivingEnd');

  String get logOutDialogTitle =>
      Intl.message('Log-out from app?', name: 'logOutDialogTitle');

  String get logOutDialogMessage =>
      Intl.message('Are you sure?', name: 'logOutDialogMessage');

  String get okDialog => Intl.message('YES', name: 'okDialog');

  String get noDialog => Intl.message('NO', name: 'noDialog');

  static final List<String> supportedLanguageCodes =
      SUPPORTED_LOCALES_MAP.entries.map((entry) => entry.key).toList();

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLanguageCodes.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
