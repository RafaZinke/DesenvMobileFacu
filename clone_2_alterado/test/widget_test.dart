import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clone_2_alterado/main.dart'; // Corrija para seu caminho real

void main() {
  testWidgets('finds a deep item in a filtered long list', (tester) async {
    await tester.pumpWidget(
      MyApp(items: List<String>.generate(10000, (i) => 'Item $i')),
    );

    // Encontrar o widget Scrollable dentro do ListView
    final scrollableFinder = find.descendant(
      of: find.byKey(const Key('long_list')),
      matching: find.byType(Scrollable),
    ).first;

    // Buscar pelo item 35 (presente inicialmente)
    final itemFinder = find.byKey(const Key('item_35_text'));

    // Scroll até o item ficar visível
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: scrollableFinder,
    );

    expect(itemFinder, findsOneWidget);

    // Agora testar a busca: digitar "Item 9999" no TextField
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'Item 9999');
    await tester.pumpAndSettle();

    // Agora o item 9999 deve aparecer como único na lista
    final filteredItemFinder = find.byKey(const Key('item_0_text')); 
    // Depois do filtro, item 9999 é o único, ele estará em posição 0 na lista filtrada.
    final item9999Finder = find.text('Item 9999');

    expect(filteredItemFinder, findsOneWidget);
    expect(item9999Finder, findsOneWidget);
  });
}
