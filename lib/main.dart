import 'package:example/routes/router.gr.dart';
import 'package:example/services/navigation_service.dart';
import 'package:flutter/material.dart';
import './service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register all the models and services before the app starts
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 9, 202, 172),
          backgroundColor: Color.fromARGB(255, 26, 27, 30),
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
              bodyColor: Colors.white,
              displayColor: Colors.white)),
      initialRoute: Routes.startUp,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
