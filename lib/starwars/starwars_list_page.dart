import 'package:flutter/material.dart';
import 'package:superapp/api/api_service.dart';
import 'package:superapp/model/heroi_item_model.dart';
import 'package:superapp/starwars/starwars_list_item.dart';

class StarWarsListPage extends StatefulWidget {
  const StarWarsListPage({Key? key}) : super(key: key);

  @override
  _StarWarsListPageState createState() => _StarWarsListPageState();
}

class _StarWarsListPageState extends State<StarWarsListPage> {
  late Future<List<HeroiItemModel>> futureHerois;

  @override
  void initState() {
    super.initState();
    futureHerois = APIService().fetchStarWars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Star Wars"),
      ),
      body: FutureBuilder<List<HeroiItemModel>>(
        future: futureHerois,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum dado encontrado'));
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return StarWarsListItem(
                  hero: snapshot.data![index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          }
        },
      ),
    );
  }
}
