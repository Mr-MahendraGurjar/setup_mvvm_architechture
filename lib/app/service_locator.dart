import 'package:setup_mvvm_architechture/network/api_client.dart';
import 'package:setup_mvvm_architechture/network/api_service.dart';
import 'package:setup_mvvm_architechture/repository/local/local_settings.dart';
import 'package:setup_mvvm_architechture/repository/local/preferences.dart';
import 'package:setup_mvvm_architechture/repository/local/preferences_repository.dart';
import 'package:setup_mvvm_architechture/repository/network_repository.dart';
import 'package:setup_mvvm_architechture/services/connection_service.dart';
import 'package:setup_mvvm_architechture/services/dialog_service.dart';
import 'package:setup_mvvm_architechture/services/user_account_service.dart';
import 'package:get_it/get_it.dart';
import '../app/service_locator_provider.dart';
import '../ui/theming/colors.dart';

GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton(() => AppColors());
  getIt.registerLazySingleton(() => Preferences());

  getIt.registerLazySingleton(() => ApiClient());
  getIt.registerLazySingleton(() => ApiService(getIt.get<ApiClient>()));

  getIt.registerLazySingleton(
      () => PreferencesRepository(getIt.get<Preferences>()));
  getIt.registerLazySingleton(() => NetworkRepository(apiService()));

  getIt.registerLazySingleton(() => DialogService());
  getIt.registerLazySingleton(() => ConnectionService());

  getIt.registerLazySingleton(() => LocalSettings(
        prefRepository(),
      ));
  getIt.registerLazySingleton(() => UserAccountService(prefRepository()));
}
