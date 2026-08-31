# mi_tiendita

Aplicación móvil desarrollada en Flutter como parte de las actividades integradoras.

Mi Tiendita es una aplicación de catálogo de productos que permite visualizar productos, consultar su información, marcar productos como favoritos y conservar los favoritos guardados en el dispositivo.

---

# Actividad Integradora 2

## Descripción de la aplicación

En esta actividad se continuó mejorando la aplicación desarrollada en la Actividad Integradora 1.

La aplicación Mi Tiendita fue ampliada incorporando navegación entre diferentes pantallas, nuevos widgets de Flutter, manejo de estado mediante `setState()`, persistencia de información utilizando `shared_preferences` y personalización de la interfaz.

La aplicación está orientada a una tienda virtual sencilla donde el usuario puede consultar productos y administrar sus favoritos.

---

## Nuevas funcionalidades implementadas

Durante la Actividad Integradora 2 se incorporaron las siguientes funcionalidades:

- Navegación entre cuatro pantallas.
- Catálogo de productos.
- Visualización del detalle de cada producto.
- Sistema de favoritos.
- Agregar y quitar productos de favoritos.
- Contador de cantidad de productos.
- Mensajes mediante `SnackBar`.
- Persistencia de favoritos utilizando `shared_preferences`.
- Restauración de favoritos al volver a abrir la aplicación.
- Personalización de colores.
- Incorporación de logotipo.
- Personalización del ícono de la aplicación.

---

## Pantallas desarrolladas

### 1. Inicio

Pantalla principal de la aplicación.

Permite visualizar:

- Logotipo de Mi Tiendita.
- Nombre de la aplicación.
- Descripción.
- Botón para acceder al catálogo.

---

### 2. Catálogo

Permite visualizar los productos disponibles mediante una cuadrícula.

Cada producto muestra:

- Imagen.
- Nombre.
- Precio.
- Botón para agregar o quitar de favoritos.

También permite:

- Acceder al detalle de un producto.
- Acceder a la pantalla de favoritos.

---

### 3. Detalle del producto

Permite visualizar información más detallada de un producto seleccionado.

Incluye:

- Imagen del producto.
- Nombre.
- Precio.
- Descripción.
- Selector de cantidad.
- Botón para agregar el producto al carrito.
- Mensaje de confirmación mediante `SnackBar`.

La cantidad puede incrementarse o disminuirse mediante botones.

---

### 4. Favoritos

Muestra los productos que el usuario ha marcado como favoritos.

Permite:

- Visualizar los productos favoritos.
- Eliminar productos de favoritos.
- Mostrar un mensaje cuando se elimina un producto.
- Mantener los favoritos guardados en el dispositivo.

---

## Navegación

La navegación entre las pantallas se implementó utilizando `Navigator` y `MaterialPageRoute`.

El flujo principal de la aplicación es:

```text
Inicio
   |
   | Ver catálogo
   v
Catálogo
   |
   | Seleccionar producto
   v
Detalle del producto

Catálogo
   |
   | Mis favoritos
   v
Favoritos