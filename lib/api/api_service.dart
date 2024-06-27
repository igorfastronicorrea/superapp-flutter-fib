import 'dart:convert';

import 'package:superapp/model/heroi_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:superapp/model/openai_data_model.dart';

class APIService {
  Future<List<HeroiItemModel>> fetchHerois() async {
    final response =
        await http.get(Uri.parse('https://demo1201562.mockable.io/herois'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((hero) => HeroiItemModel.fromJson(hero)).toList();
    } else {
      throw Exception('Falha ao carregar os heróis');
    }
  }

  Future<OpenaiGenerationsModel> fetchImagemOpenAI(String promptOpenAI) async {
    final url = Uri.parse('https://api.openai.com/v1/images/generations');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer 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',
    };
    final body = jsonEncode({
      'model': 'dall-e-3',
      'prompt': promptOpenAI,
      'n': 1,
      'size': '1024x1024'
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return OpenaiGenerationsModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}
