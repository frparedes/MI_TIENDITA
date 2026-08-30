import 'package:flutter/material.dart';
import '../data/productos.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({super.key});

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  void eliminarFavorito(int index) {
    setState(() {
      productos[index].favorito = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${productos[index].nombre} eliminado de favoritos'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoritos = productos.where((producto) => producto.favorito).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos'), centerTitle: true),
      body: favoritos.isEmpty
          ? const Center(
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
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final producto = favoritos[index];

                final indiceProducto = productos.indexOf(producto);

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
                      onPressed: () {
                        eliminarFavorito(indiceProducto);
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
