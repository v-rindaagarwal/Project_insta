import "package:flutter/material.dart";
import 'package:start_up/screens/auth_screen.dart';
import 'package:start_up/screens/home_page.dart';
import 'package:start_up/screens/register_screen.dart';
import 'package:start_up/screens/login_screen.dart';
import 'package:start_up/screens/signinwithotp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/signup_phone': (context) => const SignInWithPhone(),
      },
      home: HomePage(),
    );
  }
}
