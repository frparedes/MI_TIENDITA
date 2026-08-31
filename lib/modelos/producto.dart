class Producto {
  final int id;
  final String nombre;
  final double precio;
  final String descripcion;
  final String imagen;
  final String categoria;
  bool favorito;

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.imagen,
    required this.categoria,
    this.favorito = false,
  });
}
