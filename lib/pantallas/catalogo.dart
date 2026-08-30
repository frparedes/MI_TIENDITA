import 'package:flutter/material.dart';
import '../data/productos.dart';
import 'detalle_producto.dart';
import 'favoritos.dart';

class Catalogo extends StatefulWidget {
  const Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  // Cambiar producto entre favorito y no favorito
  void cambiarFavorito(int index) {
    setState(() {
      productos[index].favorito = !productos[index].favorito;
    });

    final producto = productos[index];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          producto.favorito
              ? '${producto.nombre} agregado a favoritos'
              : '${producto.nombre} eliminado de favoritos',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Abrir detalle del producto
  void abrirDetalle(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleProducto(producto: productos[index]),
      ),
    );
  }

  // Abrir favoritos y actualizar catálogo al regresar
  Future<void> abrirFavoritos() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Favoritos()),
    );

    // Actualizamos la pantalla al regresar
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
        centerTitle: true,

        // Botón de favoritos
        actions: [
          IconButton(
            onPressed: abrirFavoritos,
            icon: const Icon(Icons.favorite),
            tooltip: 'Mis favoritos',
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),

        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.70,
          ),

          itemCount: productos.length,

          itemBuilder: (context, index) {
            final producto = productos[index];

            return Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,

              child: InkWell(
                onTap: () {
                  abrirDetalle(index);
                },

                child: Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // Imagen
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

                      // Nombre
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

                      // Precio
                      Text(
                        '\$${producto.precio.toStringAsFixed(2)}',

                        style: const TextStyle(fontSize: 16),
                      ),

                      // Botón favorito
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          IconButton(
                            onPressed: () {
                              cambiarFavorito(index);
                            },

                            icon: Icon(
                              producto.favorito
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
