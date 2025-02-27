import 'package:http/http.dart' as http;

class NumbersApi {
  static Future<String> fetchNumberFact(String number, String category) async {
    final url = Uri.parse("https://numbersapi.com/$number/$category");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body; // Retorna o fato recebido da API
    } else {
      throw Exception("Erro ao buscar o fato do número");
    }
  }
}
