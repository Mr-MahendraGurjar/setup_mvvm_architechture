import 'package:setup_mvvm_architechture/network/api_service.dart';
import 'package:setup_mvvm_architechture/repository/local/local_settings.dart';
import 'package:setup_mvvm_architechture/repository/local/preferences_repository.dart';
import 'package:setup_mvvm_architechture/repository/network_repository.dart';
import 'package:setup_mvvm_architechture/services/connection_service.dart';
import 'package:setup_mvvm_architechture/services/dialog_service.dart';
import 'package:setup_mvvm_architechture/services/user_account_service.dart';
import 'package:setup_mvvm_architechture/ui/theming/colors.dart';

import '../app/service_locator.dart';

ApiService apiService() => getIt.get<ApiService>();
AppColors colors() => getIt.get<AppColors>();

NetworkRepository networkRepository() => getIt.get<NetworkRepository>();
PreferencesRepository prefRepository() => getIt.get<PreferencesRepository>();
ConnectionService connectionService() => getIt<ConnectionService>();
DialogService dialogService() => getIt<DialogService>();
LocalSettings localSettings() => getIt.get<LocalSettings>();
UserAccountService userAccountService() => getIt<UserAccountService>();

