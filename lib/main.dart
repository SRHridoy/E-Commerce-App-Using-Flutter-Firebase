import 'package:e_commerce_app/screens/add_to_cart_screen.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/screens/my_cart_screen.dart';
import 'package:e_commerce_app/screens/register_screen.dart';
import 'package:e_commerce_app/screens/splash_screen.dart';
import 'package:e_commerce_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'screens/setup_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: RegisterScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/splash': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/setup': (context) => SetupScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/bottomNavBar': (context) => BottomNavBarScreen(),
        '/myCart': (context) => MyCartScreen(),
        '/addToCart': (context) => AddToCartScreen(),
      },
    );
  }
}
