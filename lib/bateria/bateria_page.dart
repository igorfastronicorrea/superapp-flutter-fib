import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BateriaPage extends StatefulWidget {
  const BateriaPage({Key? key}) : super(key: key);

  @override
  _BateriaPageState createState() => _BateriaPageState();
}

class _BateriaPageState extends State<BateriaPage> {
  static const platform = MethodChannel('com.example.battery');

  Future<String> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Nível de bateria: $result%.';
    } on PlatformException catch (e) {
      batteryLevel = "Falha ao obter nível da bateria: '${e.message}'.";
    }

    return batteryLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Nível da Bateria'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _getBatteryLevel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else {
              return Text(snapshot.data ?? 'Erro desconhecido');
            }
          },
        ),
      ),
    );
  }
}
