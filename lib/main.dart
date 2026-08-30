import 'package:flutter/material.dart';
import 'pantallas/inicio.dart';

void main() {
  runApp(const MiTienditaApp());
}

class MiTienditaApp extends StatelessWidget {
  const MiTienditaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Tiendita',
      theme: ThemeData(useMaterial3: true),
      home: const Inicio(),
    );
  }
}
