import 'package:flutter/material.dart';
import 'package:superapp/ia/ia_generated_page.dart';

class IaInputPage extends StatefulWidget {
  const IaInputPage({Key? key}) : super(key: key);

  @override
  _IaInputPageState createState() => _IaInputPageState();
}

class _IaInputPageState extends State<IaInputPage> {
  final TextEditingController _txtPrompt = TextEditingController();

  void _gerar() {
    String promptGerado = _txtPrompt.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IaGeneratedPage(
          prompt: promptGerado,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("IA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _txtPrompt,
                decoration: const InputDecoration(
                  labelText: "Digite o que deseja gerar",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _gerar,
                  child: Text("Gerar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
