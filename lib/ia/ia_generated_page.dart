import 'package:flutter/material.dart';
import 'package:superapp/api/api_service.dart';
import 'package:superapp/model/openai_data_model.dart';

class IaGeneratedPage extends StatefulWidget {
  final String prompt;

  const IaGeneratedPage({Key? key, required this.prompt}) : super(key: key);

  @override
  _IaGeneratedPageState createState() => _IaGeneratedPageState();
}

class _IaGeneratedPageState extends State<IaGeneratedPage> {
  late Future<OpenaiGenerationsModel> _futureOpenaiDataModel;

  @override
  void initState() {
    super.initState();
    _futureOpenaiDataModel = APIService().fetchImagemOpenAI(widget.prompt);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.prompt);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Imagem Gerada"),
      ),
      body: FutureBuilder(
        future: _futureOpenaiDataModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao gerar imagem"),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("Nenhuma imagem para ser carregada"),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                snapshot.data!.data.url,
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}
