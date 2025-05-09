import 'package:flutter/material.dart';
import 'package:flutter_ucp1_115/presentation/home_page.dart';
import 'package:flutter_ucp1_115/presentation/login_page.dart';
import 'package:flutter_ucp1_115/presentation/pelanggan_page.dart';
import 'package:flutter_ucp1_115/presentation/piket_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Nama aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login', // Route awal ketika aplikasi dibuka
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/piket': (context) => const PiketPage(),
        '/pelangan': (context) => const PelangganPage(),
      },
    );
  }
}
