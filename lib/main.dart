import 'package:flutter/material.dart';
import 'package:hello_world_app/navigation/Top.dart';
import 'package:hello_world_app/navigation/home.dart';
import 'package:hello_world_app/navigation/profile.dart';
import 'package:hello_world_app/navigation/reservations.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/counter': (context) => const CounterFunctionsScreen(),
        '/home': (context) => const Home(),
        '/reservations': (context) => const Reservations(),
        '/profile': (context) => const Profile(),
        '/top': (context) => const Top(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent
      )
    );
}
}