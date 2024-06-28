import 'package:flutter/material.dart';
import 'package:superapp/model/heroi_item_model.dart';

class HeroiDetalhePage extends StatelessWidget {
  final HeroiItemModel hero;

  const HeroiDetalhePage({required this.hero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.nome),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(hero.imagem,
                height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              hero.nome,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Adicione aqui mais detalhes sobre o herói
            const Text(
              'Detalhes do herói aqui...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
