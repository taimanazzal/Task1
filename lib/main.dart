import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_detail_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
      },
      // هاي الشاشات بتاخد data معها (arguments) فبنعملها onGenerateRoute
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          final user = settings.arguments as UserModel;
          return MaterialPageRoute(
            builder: (context) => ProfileDetailScreen(user: user),
          );
        }
        if (settings.name == '/edit-profile') {
          final user = settings.arguments as UserModel;
          return MaterialPageRoute(
            builder: (context) => EditProfileScreen(user: user),
          );
        }
        return null;
      },
    );
  }
}
