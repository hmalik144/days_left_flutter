import 'package:days_left/viewmodels/LoginViewModel.dart';
import 'package:days_left/viewmodels/UserAuthViewModel.dart';
import 'package:get_it/get_it.dart';
import 'data/FirebaseAuthData.dart';
import 'services/DialogService.dart';
import 'services/NavigationService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  final FirebaseAuthData firebaseSource = FirebaseAuthData();

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => UserAuthViewModel(firebaseSource));
  locator.registerLazySingleton(() => LoginViewModel(firebaseSource));
}
