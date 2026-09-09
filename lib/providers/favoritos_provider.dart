import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/productos.dart';
import '../modelos/producto.dart';

class FavoritosProvider extends ChangeNotifier {
  final List<Producto> _favoritos = [];

  List<Producto> get favoritos => _favoritos;

  FavoritosProvider() {
    cargarFavoritos();
  }

  bool esFavorito(Producto producto) {
    return _favoritos.any((favorito) => favorito.id == producto.id);
  }

  Future<void> cargarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();

    final idsFavoritos = prefs.getStringList('favoritos') ?? [];

    _favoritos.clear();

    for (final producto in productos) {
      if (idsFavoritos.contains(producto.id.toString())) {
        _favoritos.add(producto);
      }
    }

    notifyListeners();
  }

  Future<void> agregarFavorito(Producto producto) async {
    if (!esFavorito(producto)) {
      _favoritos.add(producto);

      await guardarFavoritos();

      notifyListeners();
    }
  }

  Future<void> eliminarFavorito(Producto producto) async {
    _favoritos.removeWhere((favorito) => favorito.id == producto.id);

    await guardarFavoritos();

    notifyListeners();
  }

  Future<void> cambiarFavorito(Producto producto) async {
    if (esFavorito(producto)) {
      await eliminarFavorito(producto);
    } else {
      await agregarFavorito(producto);
    }
  }

  Future<void> guardarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();

    final idsFavoritos = _favoritos
        .map((producto) => producto.id.toString())
        .toList();

    await prefs.setStringList('favoritos', idsFavoritos);
  }
}
