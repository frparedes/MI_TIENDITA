import 'package:flutter/material.dart';

import '../data/productos.dart';
import '../widgets/tarjeta_producto.dart';
import 'detalle_producto.dart';
import 'favoritos.dart';
import '../modelos/producto.dart';

class Catalogo extends StatefulWidget {
  const Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  String categoriaSeleccionada = 'Todos';

  final List<String> categorias = [
    'Todos',
    'Perros',
    'Gatos',
    'Juguetes',
    'Accesorios',
  ];

  void abrirDetalle(Producto producto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleProducto(producto: producto),
      ),
    );
  }

  void abrirFavoritos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Favoritos()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productosFiltrados = categoriaSeleccionada == 'Todos'
        ? productos
        : productos
              .where((producto) => producto.categoria == categoriaSeleccionada)
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo 🐾'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: abrirFavoritos,
            icon: const Icon(Icons.favorite),
            tooltip: 'Mis favoritos',
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                final seleccionada = categoria == categoriaSeleccionada;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(categoria),
                    selected: seleccionada,
                    onSelected: (seleccionada) {
                      if (!seleccionada) return;

                      setState(() {
                        categoriaSeleccionada = categoria;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const Divider(height: 1),

          Expanded(
            child: productosFiltrados.isEmpty
                ? const Center(
                    child: Text('No hay productos en esta categoría'),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.70,
                        ),
                    itemCount: productosFiltrados.length,
                    itemBuilder: (context, index) {
                      final producto = productosFiltrados[index];

                      return TarjetaProducto(
                        producto: producto,
                        onTap: () {
                          abrirDetalle(producto);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
