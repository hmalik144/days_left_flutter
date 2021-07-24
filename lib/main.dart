import 'package:days_left/login/LoginScreen.dart';
import 'package:days_left/screens/OverviewScreen.dart';
import 'package:days_left/services/DialogService.dart';
import 'package:days_left/services/NavigationService.dart';
import 'package:days_left/viewmodels/UserAuthViewModel.dart';
import 'package:days_left/widgets/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'locator.dart';
import 'managers/DialogManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserAuthViewModel _userAuthViewModel = locator<UserAuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _userAuthViewModel.loggedIn ? OverviewScreen() : LoginScreen(),
      onGenerateRoute: generateRoute,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
    );
  }
}