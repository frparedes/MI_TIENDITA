import 'package:flutter_test/flutter_test.dart';
import 'package:mi_tiendita/main.dart';

void main() {
  testWidgets('La aplicación inicia correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MiTienditaApp());

    expect(find.text('Bienvenido a Mi Tiendita'), findsOneWidget);
  });
}
