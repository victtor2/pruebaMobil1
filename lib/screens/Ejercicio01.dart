import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_prueba_1/main.dart';

void main () {
  runApp(MasaCorporal());
}

class MasaCorporal extends StatelessWidget {
  const MasaCorporal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Calculo IMC",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 01'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://www.revistadiabetes.org/wp-content/uploads/Como-evaluar-en-peso-saludable.-Que-anadir-al-IMC.1.jpg"),
        fit: BoxFit.cover
        )
    ),
    child: (
      Column(
        children: <Widget>[
          Altura(),
          Peso(),
          BotonCalcular(),
          Boton1(context),
        ],
      )
    ),
  );
}

final TextEditingController _altura = TextEditingController();
Widget Altura(){
  return Container(
    child: (
      TextField(
        controller: _altura,
        decoration: InputDecoration(hintText: "Ingresar su altura en metros"),
        keyboardType: TextInputType.number,
      )
    ),
  );
}

final TextEditingController _peso = TextEditingController();
Widget Peso(){
  return Container(
    child: (
      TextField(
        controller: _peso,
        decoration: InputDecoration(hintText: "Ingresar su peso en kilogramos"),
        keyboardType: TextInputType.number,
      )
    ),
  );
}

Widget BotonCalcular(){
  return(
    FilledButton(onPressed: (){
      alerta(context);
    }, child: Text("Calcular IMC"))
  );
}

double calcularImc(){
  double altura = double.tryParse(_altura.text) ?? 0.00 ;
  double peso = double.tryParse(_peso.text) ?? 0.00;
  double imc = peso/pow(altura, 2);
  
  return (imc);
}

String interpretarImc(double imc) {
  if (imc < 18.5) {
    return "Bajo de peso";
  } else if (imc >= 18.5 && imc <= 24.9) {
    return "Peso normal";
  } else if (imc >= 25 && imc <= 29.9) {
    return "Sobrepeso";
  } else {
    return "Obesidad";
  }
}

void alerta(context){
  double imc = calcularImc();
  String interpretacion = interpretarImc(imc);
  showDialog(context: context, builder:
    (context){
      return(
        AlertDialog(
          title: Text("Respuesta"),
          content: Text("El IMC es: ${imc.toStringAsFixed(2)}\nEstado: $interpretacion"),
        )
      );
    }
  );
}

Widget Boton1(context){
  return(
    FilledButton(onPressed: (){
      irPrincipal(context);
    }, child: Text("Ir paginga Principal"))
  );
}

void irPrincipal(context){
  Navigator.pushReplacement(context,
   MaterialPageRoute(builder: (context) => const Principal())
   );
}