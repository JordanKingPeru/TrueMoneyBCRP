
import 'package:flutter/material.dart';
import '../../third_party/login/login_page.dart';

class MostrarLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Satisfy',
      ),
      home: LoginPage(),
    );
  }
}