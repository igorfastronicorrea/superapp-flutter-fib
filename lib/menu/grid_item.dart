import 'package:flutter/material.dart';
import 'package:superapp/listaherois/herois_list_page.dart';
import 'package:superapp/ia/ia_input_page.dart';

class GridItem extends StatelessWidget {
  final int index;

  const GridItem({required this.index});

  @override
  Widget build(BuildContext context) {
    List<IconData> iconList = [
      Icons.flash_on,
      Icons.computer_rounded,
      Icons.museum,
      Icons.camera,
    ];

    List<String> tituloList = [
      "Listagem de Herois",
      "Inteligência Artificial",
      "Atrações Turísticas",
      "Criar Atração"
    ];

    IconData iconData = iconList[index];
    String text = tituloList[index];

    return GestureDetector(
      onTap: () => {
        switch (index) {
          0 => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HeroisListPage())),
          1 => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const IaInputPage())),
          _ => print("opcao nao implementada")
        },
      },
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData, size: 48),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
