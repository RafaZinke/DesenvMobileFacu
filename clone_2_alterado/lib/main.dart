import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(items: List<String>.generate(10000, (i) => 'Item $i')));
}

class MyApp extends StatefulWidget {
  final List<String> items;
  const MyApp({super.key, required this.items});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<String> filteredItems;
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void _filterItems(String input) {
    setState(() {
      query = input;
      filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Long List with Search',
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: _filterItems,
            decoration: const InputDecoration(
              hintText: 'Buscar item...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white70),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          key: const Key('long_list'),
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            return ItemTile(title: filteredItems[index], index: index);
          },
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String title;
  final int index;

  const ItemTile({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        key: Key('item_${index}_text'),
      ),
    );
  }
}
