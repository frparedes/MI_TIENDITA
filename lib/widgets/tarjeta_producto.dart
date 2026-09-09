import 'package:flutter/material.dart';

import '../modelos/producto.dart';
import 'boton_favorito.dart';

class TarjetaProducto extends StatelessWidget {
  final Producto producto;
  final VoidCallback onTap;

  const TarjetaProducto({
    super.key,
    required this.producto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  producto.imagen,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.image_not_supported, size: 50),
                    );
                  },
                ),
              ),

              const SizedBox(height: 8),

              Text(
                producto.nombre,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                '\$${producto.precio.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    producto.categoria,
                    style: const TextStyle(fontSize: 12),
                  ),
                  BotonFavorito(producto: producto),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
