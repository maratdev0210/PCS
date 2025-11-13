import 'package:flutter/material.dart';
import 'package:mad_shop/main_screen.dart';
import 'package:mad_shop/screens/login_screen.dart';
import 'package:mad_shop/screens/password_screen.dart';
import 'package:mad_shop/screens/shop_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/create_account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/login': (context) => const LoginScreen(),
        '/password': (context) => const PasswordScreen(),
        '/home': (context) => const MainScreen(),
      },
    );
  }
}
