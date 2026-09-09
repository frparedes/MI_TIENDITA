import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favoritos_provider.dart';
import '../modelos/producto.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos'), centerTitle: true),
      body: Consumer<FavoritosProvider>(
        builder: (context, favoritosProvider, child) {
          final favoritos = favoritosProvider.favoritos;

          if (favoritos.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80),
                  SizedBox(height: 16),
                  Text(
                    'No tienes productos favoritos',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: favoritos.length,
            itemBuilder: (context, index) {
              final producto = favoritos[index];

              return _TarjetaFavorito(
                producto: producto,
                onEliminar: () {
                  favoritosProvider.eliminarFavorito(producto);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${producto.nombre} eliminado de favoritos',
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _TarjetaFavorito extends StatelessWidget {
  final Producto producto;
  final VoidCallback onEliminar;

  const _TarjetaFavorito({required this.producto, required this.onEliminar});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            producto.imagen,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                width: 70,
                height: 70,
                child: Icon(Icons.image_not_supported),
              );
            },
          ),
        ),
        title: Text(
          producto.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$${producto.precio.toStringAsFixed(2)}'),
        trailing: IconButton(
          onPressed: onEliminar,
          icon: const Icon(Icons.favorite),
          tooltip: 'Eliminar de favoritos',
        ),
      ),
    );
  }
}
