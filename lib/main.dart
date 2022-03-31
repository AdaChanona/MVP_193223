import 'package:flutter/material.dart';
import 'package:mvp_all/login/login_panel.dart';
import 'package:mvp_all/splash/splash_view.dart';
import 'package:mvp_all/pages/login.dart';
import 'package:mvp_all/register/register.dart';
import 'package:mvp_all/password/recover_pass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/login_panel': (context) => const LoginPanel(),
        '/recover_pass': (context) => const RecoverPass(),
      },
    );
  }
}
