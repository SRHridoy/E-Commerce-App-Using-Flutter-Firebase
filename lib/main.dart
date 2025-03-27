import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/screens/register_screen.dart';
import 'package:e_commerce_app/screens/splash_screen.dart';
import 'package:e_commerce_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: RegisterScreen(),
    );
  }
}
