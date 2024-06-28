import 'package:flutter/material.dart';
import 'package:superapp/herois/herois_list_page.dart';
import 'package:superapp/menu/grid_item.dart';

class MenuPage extends StatefulWidget {
  final String usuario;

  const MenuPage({Key? key, required this.usuario}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    print(widget.usuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Menu"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          4,
          (index) {
            return GridItem(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
