import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apipokemon/module/dashboard/view/dashboard.dart';

void main() {
  testWidgets('Carrega e exibe a lista de Pokémon', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(
      home: DashboardView(),
    ));

    expect(find.text('Pokédex'), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byType(ListTile), findsWidgets);

    expect(find.textContaining('bulbasaur'), findsWidgets);
  });
}
