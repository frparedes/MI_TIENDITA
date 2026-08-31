import 'package:flutter/material.dart';
import '../data/productos.dart';
import '../servicios/favoritos_service.dart';
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

  @override
  void initState() {
    super.initState();
    cargarFavoritos();
  }

  Future<void> cargarFavoritos() async {
    final idsFavoritos = await FavoritosService.obtenerFavoritos();

    if (!mounted) return;

    setState(() {
      for (final producto in productos) {
        producto.favorito = idsFavoritos.contains(producto.id);
      }
    });
  }

  Future<void> cambiarFavorito(int index) async {
    setState(() {
      productos[index].favorito = !productos[index].favorito;
    });

    final idsFavoritos = productos
        .where((producto) => producto.favorito)
        .map((producto) => producto.id)
        .toList();

    await FavoritosService.guardarFavoritos(idsFavoritos);

    if (!mounted) return;

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

  void abrirDetalle(Producto producto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleProducto(producto: producto),
      ),
    );
  }

  Future<void> abrirFavoritos() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Favoritos()),
    );

    if (!mounted) return;

    await cargarFavoritos();
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

                      return Card(
                        elevation: 3,
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            abrirDetalle(producto);
                          },
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
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                        ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      producto.categoria,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        final indiceReal = productos.indexOf(
                                          producto,
                                        );

                                        cambiarFavorito(indiceReal);
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
        ],
      ),
    );
  }
}
