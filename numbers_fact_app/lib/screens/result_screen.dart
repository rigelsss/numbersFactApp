import 'package:flutter/material.dart';
import '../services/numbers_api.dart'; // Importa a classe que busca os fatos da API

class ResultScreen extends StatefulWidget {
  final String number;
  final String category;

  ResultScreen({required this.number, required this.category});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String _fact = "Carregando...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFact(); // Quando a tela abrir, buscamos o fato automaticamente
  }

  Future<void> fetchFact() async {
    try {
      String fact = await NumbersApi.fetchNumberFact(widget.number, widget.category);
      setState(() {
        _fact = fact; // Atualiza o texto com o fato recebido
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar o fato: $e");
      setState(() {
        _fact = "Erro ao carregar o fato.";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultado")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fato sobre o número ${widget.number}:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator() // Exibe indicador de carregamento enquanto busca os dados
                  : Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _fact,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Voltar para a tela anterior
                },
                child: Text("Voltar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
