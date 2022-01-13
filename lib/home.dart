import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,
            ),
            customTextField("Peso (kg)"),
            customTextField("Altura (cm)"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Calcular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ),
            const Text(
              'INFO',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextField(String text) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Colors.green),
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.green,
        fontSize: 25,
      ),
    );
  }
}
