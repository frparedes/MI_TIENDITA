import 'package:flutter_test/flutter_test.dart';
import 'package:mi_tiendita/main.dart';

void main() {
  testWidgets('La aplicación inicia correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MiTienditaApp());

    expect(find.text('Mi Tiendita'), findsOneWidget);
    expect(find.text('Todo para consentir a tu mascota 🐾'), findsOneWidget);
    expect(find.text('Ver productos'), findsOneWidget);
  });
}
