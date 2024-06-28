import 'package:flutter/material.dart';
import 'package:superapp/herois/heroi_detalhe.dart';
import 'package:superapp/model/heroi_item_model.dart';

class HeroiListItem extends StatelessWidget {
  final HeroiItemModel hero;

  const HeroiListItem({required this.hero});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HeroiDetalhePage(hero: hero),
          ),
        );
      },
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(hero.imagem,
                height: 180, width: 180, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Text(
              hero.nome,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
