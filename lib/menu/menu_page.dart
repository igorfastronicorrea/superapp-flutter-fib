import 'package:flutter/material.dart';
import 'package:superapp/listaherois/herois_list_page.dart';
import 'package:superapp/menu/grid_item.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Menu"),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Quantidade de itens por linha
        children: List.generate(4, (index) {
          return GridItem(
            index: index,
          );
        }),
      ),
    );
  }
}
