import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modelos/producto.dart';
import '../providers/favoritos_provider.dart';

class BotonFavorito extends StatelessWidget {
  final Producto producto;

  const BotonFavorito({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritosProvider>(
      builder: (context, favoritosProvider, child) {
        final esFavorito = favoritosProvider.esFavorito(producto);

        return IconButton(
          onPressed: () {
            favoritosProvider.cambiarFavorito(producto);
          },
          icon: Icon(esFavorito ? Icons.favorite : Icons.favorite_border),
          tooltip: esFavorito ? 'Quitar de favoritos' : 'Agregar a favoritos',
        );
      },
    );
  }
}
