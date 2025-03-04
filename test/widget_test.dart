import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cartelera_peliculas/main.dart';

void main() {
  testWidgets('Cartelera de Películas carga correctamente', (
    WidgetTester tester,
  ) async {
    // Construye nuestra app y genera un frame
    await tester.pumpWidget(const MiAplicacion());

    // Verifica que el título de la app esté presente
    expect(find.text('Cartelera de Películas'), findsOneWidget);

    // Verifica que haya un widget de carga o un GridView
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
