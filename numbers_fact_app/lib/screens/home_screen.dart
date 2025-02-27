import 'package:flutter/material.dart';
import 'result_screen.dart'; // Importa a tela de resultado

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberController = TextEditingController();
  String _selectedCategory = "trivia"; // Categoria padrão

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Number Fact App',
            textAlign: TextAlign.center,),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Digite um número:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Ex: 98",
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Escolha uma categoria:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: [
                DropdownMenuItem(value: "trivia", child: Text("Trivia")),
                DropdownMenuItem(value: "math", child: Text("Matemática")),
                DropdownMenuItem(value: "year", child: Text("Ano")),
                DropdownMenuItem(value: "date", child: Text("Data")),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        number: _numberController.text,
                        category: _selectedCategory,
                      ),
                    ),
                  );
                },
                child: Text("Buscar Fato"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
