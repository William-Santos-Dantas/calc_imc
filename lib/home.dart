import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String textInfo = 'Informe Seus Dados';

  void _resetField() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      textInfo = 'Informe Seus Dados';
      _formKey.currentState!.reset();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        textInfo = 'Abaixo do Peso (${imc.toStringAsFixed(2)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        textInfo = 'Peso Ideal (${imc.toStringAsFixed(2)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        textInfo = 'Levemente Acima do Peso (${imc.toStringAsFixed(2)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        textInfo = 'Obesidade Grau I (${imc.toStringAsFixed(2)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        textInfo = 'Obesidade Grau II (${imc.toStringAsFixed(2)})';
      } else if (imc >= 40) {
        textInfo = 'Obesidade Grau III (${imc.toStringAsFixed(2)})';
      }
    });
  }

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
            onPressed: _resetField,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              customTextField(
                  text: "Peso (kg)",
                  controller: weightController,
                  textValidate: 'Insira Seu Peso'),
              customTextField(
                  text: "Altura (cm)",
                  controller: heightController,
                  textValidate: 'Insira Sua Altura'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calculate();
                    }
                  },
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
              Text(
                textInfo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField(
      {required String text,
      required TextEditingController controller,
      required String textValidate}) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return textValidate;
        }
      },
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
