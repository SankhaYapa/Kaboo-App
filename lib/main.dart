import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kaboo_app/providers/calander_provider.dart';
import 'package:kaboo_app/providers/contact_provider.dart';
import 'package:kaboo_app/providers/login_provider.dart';
import 'package:kaboo_app/providers/registration_provider.dart';
import 'package:kaboo_app/providers/user_provider.dart';
import 'package:kaboo_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CalanderProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kabbo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      //home: const HomeScreen(),
      //home: const MainScreen(),
    );
  }
}
