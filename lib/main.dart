import 'package:example/routes/router.gr.dart';
import 'package:example/scoped_models/login_view_model.dart';
import 'package:example/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import './service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register all the models and services before the app starts
  setupLocator();
  String _defaultHome = await getInitialRoute();
  runApp(MyApp(_defaultHome));
}

class MyApp extends StatelessWidget {
  String defaultHome;
  @override
  MyApp(this.defaultHome);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 9, 202, 172),
          backgroundColor: Color.fromARGB(255, 26, 27, 30),
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
              bodyColor: Colors.white,
              displayColor: Colors.white)),
      initialRoute: defaultHome,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}

Future<String> getInitialRoute() async {
  SharedPrefService _sharedPrefService = locator<SharedPrefService>();
  String _defaultHome = Routes.homeViewRoute;
  bool _result = await _sharedPrefService.readPrefBool('isFirstLaunch') ?? true;
  if (_result) {
    _defaultHome = Routes.loginViewRoute;
  }
  return _defaultHome;
}
