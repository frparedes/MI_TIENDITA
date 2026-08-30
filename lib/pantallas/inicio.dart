import 'package:flutter/material.dart';
import 'catalogo.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Tiendita')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 65,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.shopping_bag,
                  size: 65,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'Mi Tiendita',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Productos que te encantan',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
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
