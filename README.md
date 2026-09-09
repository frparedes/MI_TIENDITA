# 🐾 Mi Tiendita

**Autor: Freddy Paredes**

Aplicación móvil desarrollada en Flutter como continuación de las actividades integradoras anteriores.

El proyecto inició con la aplicación **Mi Mascota** y evolucionó hacia **Mi Tiendita**, una aplicación orientada a la visualización y gestión de productos para mascotas.

---

# 📱 Proyecto 3 – Gestión de estado con Provider

En esta tercera actividad se incorporó el manejo de estado mediante el patrón **Provider**, manteniendo y mejorando las funcionalidades desarrolladas anteriormente.

La aplicación permite visualizar productos, consultar su detalle, seleccionar categorías y administrar productos favoritos.

---

## 🎯 Objetivo

Aplicar los conocimientos de Flutter relacionados con:

- Manejo de estado mediante `Provider`.
- Uso de `ChangeNotifier`.
- Actualización reactiva de la interfaz.
- Creación de widgets reutilizables.
- Organización del proyecto en diferentes archivos y carpetas.
- Navegación entre pantallas.
- Persistencia de información utilizando `SharedPreferences`.
- Control de versiones mediante Git y GitHub.

---

# ✨ Funcionalidades

La aplicación cuenta con las siguientes funcionalidades:

- 🏠 Pantalla de inicio.
- 🛍️ Catálogo de productos.
- 🐶🐱 Filtrado de productos por categoría.
- 🔎 Visualización del detalle de cada producto.
- ❤️ Agregar productos a favoritos.
- 💔 Eliminar productos de favoritos.
- 📋 Visualización de la lista de favoritos.
- 💾 Persistencia de favoritos mediante `SharedPreferences`.
- 🔄 Actualización automática de favoritos utilizando `Provider`.
- 📱 Navegación entre diferentes pantallas.
- 🖼️ Visualización de imágenes de los productos.
- 🔔 Mensajes mediante `SnackBar`.
- 🔢 Cambio de cantidad de productos.
- 🐾 Logotipo relacionado con mascotas.
- 📱 Ícono personalizado de la aplicación.
- 🎨 Personalización visual de la interfaz.

---

# 🧩 Manejo de estado con Provider

Para esta actividad se incorporó el paquete **Provider** para administrar el estado de los productos favoritos.

El estado principal se encuentra en:

```text
lib/providers/favoritos_provider.dart