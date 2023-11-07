import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incostore/screens/detail_screen.dart';
import 'package:incostore/screens/home_screen.dart';
import 'package:incostore/screens/login_screen.dart';
import 'package:incostore/screens/register_screen.dart';
import 'package:incostore/screens/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/details': (context) => const DetailScreen(),
      },
    );
  }
}
