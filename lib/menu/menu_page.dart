import 'package:flutter/cupertino.dart';
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Menu")),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          5,
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
