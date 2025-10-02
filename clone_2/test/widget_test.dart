import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Importa o arquivo da sua aplicação. O nome do seu projeto pode ser diferente
// se você criou com outro nome.
// Substitua 'nome_do_seu_projeto' pelo nome da pasta do seu projeto.
import 'package:clone_2/main.dart'; // <--- CORRIJA ESTE IMPORT

void main() {
  // Nome do teste: verifica se consegue encontrar um item profundo na lista.
  testWidgets('finds a deep item in a long list', (tester) async {
    // 1. Construir a aplicação.
    await tester.pumpWidget(
      MyApp(items: List<String>.generate(10000, (i) => 'Item $i')),
    );

   // 2. Encontrar o widget de rolagem (ListView).
// Agora, encontramos o Scrollable que contém a chave 'long_list'.
// Isso resolve o TypeError.
final listFinder = find.descendant(
  of: find.byKey(const Key('long_list')),
  matching: find.byType(Scrollable),
);

    // 3. Definir o item que queremos encontrar (Item 50).
    final itemFinder = find.byKey(const Key('item_35_text'));

    // 4. Rolar até que o item esteja visível.
await tester.scrollUntilVisible(
  itemFinder,
  500.0,
  scrollable: listFinder, // listFinder é o Scrollable
);

    // 5. Verificar que o item foi encontrado.
    expect(itemFinder, findsOneWidget);
  });
}

//flutter test test/widget_test.dart