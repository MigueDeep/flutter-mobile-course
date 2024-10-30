import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_world_app/modules/auth/login.dart';
import 'package:hello_world_app/modules/auth/register.dart';
import 'package:hello_world_app/navigation/navigation.dart';
import 'package:hello_world_app/widgets/splash_screen.dart';
import 'firebase_options.dart';
import 'package:hello_world_app/navigation/Top.dart';
import 'package:hello_world_app/navigation/home.dart';
import 'package:hello_world_app/navigation/profile.dart';
import 'package:hello_world_app/navigation/reservations.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/counter': (context) => const CounterFunctionsScreen(),
          '/': (context) => const SplashScreen(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/menu': (context) => const Navigation(),
          '/home': (context) => const Home(),
          '/reservations': (context) => const Reservations(),
          '/profile': (context) => const Profile(),
          '/top': (context) => const Top(),
        },
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent));
  }
}
