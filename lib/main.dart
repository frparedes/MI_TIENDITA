import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(title: const Text('Mi Tiendita')),
        body: const Center(
          child: Text(
            'Bienvenido a Mi Tiendita',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
