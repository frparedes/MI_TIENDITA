import 'package:flutter/material.dart';
import 'catalogo.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Tiendita'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                child: Icon(Icons.shopping_bag, size: 60),
              ),
              const SizedBox(height: 24),
              const Text(
                'Mi Tiendita',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Productos que te encantan',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Catalogo()),
                  );
                },
                icon: const Icon(Icons.store),
                label: const Text('Ver catálogo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
