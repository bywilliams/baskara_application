import 'dart:math';

import 'package:flutter/material.dart';

class BaskaraPage extends StatefulWidget {
  @override
  _BaskaraPageState createState() => _BaskaraPageState();
}

class _BaskaraPageState extends State<BaskaraPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController cController = TextEditingController();

  double x1;
  double x2;
  double delta;
  String infoText = "Resultados aparecerão aqui!";

  void _calculate() {
    setState(() {
      double coeA = double.parse(aController.text);
      double coeB = double.parse(bController.text);
      double coeC = double.parse(cController.text);
      delta = (coeB * coeB) - (4 * coeA * coeC);
      if ((delta < 0) || (coeA == 0)) {
        infoText = "Esta equação nao possui raizes reais.";
      } else {
        x1 = (-coeB + sqrt(delta)) / (2 * coeA);
        x2 = (-coeB - sqrt(delta)) / (2 * coeA);
        infoText =
            "X1 = (${x1.toStringAsPrecision(5)})\n X2 = (${x2.toStringAsPrecision(5)})";
      }
    });
  }

  void _clear() {
    setState(() {
      aController.text = "";
      bController.text = "";
      cController.text = "";
      infoText = "";
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Baskara Application",
          style: TextStyle(
              fontSize: 30.0, color: Colors.black, fontFamily: 'Roboto'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _clear();
              })
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/classroom.jpg',
            height: 1000.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 250.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      height: 200,
                      width: 200.0,
                      image: AssetImage('images/baskara.png')),
                  buildTextField("Digite o coeficiente A", "A", aController),
                  Divider(),
                  buildTextField("Digite o coeficiente B", "B", bController),
                  Divider(),
                  buildTextField("Digite o coeficiente C", "C", cController),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.teal.shade900,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _calculate();
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      infoText,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontFamily: 'Roboto'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildTextField(
    String labelText, String hintText, TextEditingController c) {
  return TextFormField(
    decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black, fontSize: 25.0, fontFamily: 'Roboto'),
        border: OutlineInputBorder()),
    style: TextStyle(color: Colors.black, fontSize: 25.0),
    controller: c,
    validator: (value) {
      if (value.isEmpty) {
        return "Preencha os campos vazios";
      }
    },
  );
}
