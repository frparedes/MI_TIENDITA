import 'package:flutter_test/flutter_test.dart';
import 'package:mi_tiendita/main.dart';

void main() {
  testWidgets('La aplicación inicia correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MiTienditaApp());

    expect(find.text('Mi Tiendita'), findsNWidgets(2));
    expect(find.text('Productos que te encantan'), findsOneWidget);
    expect(find.text('Ver catálogo'), findsOneWidget);
  });
}
