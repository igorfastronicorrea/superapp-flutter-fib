import 'package:flutter/material.dart';
import 'package:superapp/api/api_service.dart';
import 'package:superapp/listaherois/heroi_list_item.dart';
import 'package:superapp/model/heroi_item_model.dart';

class HeroisListPage extends StatefulWidget {
  const HeroisListPage({Key? key}) : super(key: key);

  @override
  _HeroisListPageState createState() => _HeroisListPageState();
}

class _HeroisListPageState extends State<HeroisListPage> {
  late Future<List<HeroiItemModel>> futureHerois;

  @override
  void initState() {
    super.initState();
    futureHerois = APIService().fetchHerois();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Listagem de Herois"),
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
                return HeroiListItem(hero: snapshot.data![index]);
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
