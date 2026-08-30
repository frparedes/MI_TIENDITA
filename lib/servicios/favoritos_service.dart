import 'package:shared_preferences/shared_preferences.dart';

class FavoritosService {
  static const String claveFavoritos = 'favoritos';

  // Guardar los IDs de los productos favoritos
  static Future<void> guardarFavoritos(List<int> ids) async {
    final preferencias = await SharedPreferences.getInstance();

    await preferencias.setStringList(
      claveFavoritos,
      ids.map((id) => id.toString()).toList(),
    );
  }

  // Obtener los IDs de los productos favoritos
  static Future<List<int>> obtenerFavoritos() async {
    final preferencias = await SharedPreferences.getInstance();

    final lista = preferencias.getStringList(claveFavoritos) ?? [];

    return lista.map((id) => int.parse(id)).toList();
  }
}
