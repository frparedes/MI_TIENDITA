import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pantallas/inicio.dart';
import 'providers/favoritos_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritosProvider(),
      child: const MiTienditaApp(),
    ),
  );
}

class MiTienditaApp extends StatelessWidget {
  const MiTienditaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Tiendita',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5F6F52),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        cardTheme: const CardThemeData(elevation: 3, margin: EdgeInsets.zero),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ),
      home: const Inicio(),
    );
  }
}
