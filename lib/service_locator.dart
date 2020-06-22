import 'package:example/scoped_models/home_view_model.dart';
import 'package:example/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';
import 'package:example/scoped_models/login_view_model.dart';
import 'package:example/scoped_models/sign_up_view_model.dart';

GetIt locator = new GetIt();

void setupLocator() {
  // Register services
  locator.registerLazySingleton<SharedPrefService>(() => SharedPrefService());
  // Register ScopedModels
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<SignUpViewModel>(() => SignUpViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}
