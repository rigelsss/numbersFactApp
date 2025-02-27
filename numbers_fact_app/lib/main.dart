import 'package:flutter/material.dart';
import 'screens/home_screen.dart';  // Importa a tela inicial

void main() {
  runApp(MyApp()); // Inicia o app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      title: 'Numbers Fact App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define o tema do app
      ),
      home: HomeScreen(), // Define que a primeira tela será HomeScreen
    );
  }
}
