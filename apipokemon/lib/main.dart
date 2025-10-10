import 'package:flutter/material.dart';
import 'package:apipokemon/core/injection.dart';
import 'package:apipokemon/module/dashboard/view/dashboard.dart';

void main() {
  configureDependencies(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: DashboardView(), 
    );
  }
}
