import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:customer_app/utils/theme.dart';
import 'package:customer_app/controllers/bindings/initialBindings.dart';
import 'package:customer_app/views/screens/splash_screen.dart';

Future<void> main() async {
  InitialBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initialisation = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialisation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  'Something went wrong. Please chek your internet connection.'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Milkton Customer App',
              home: SplashView(),
              theme: lightTheme,
            );
          }
          return CircularProgressIndicator();
        });
  }
}
