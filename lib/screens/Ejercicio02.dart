import 'package:flutter/material.dart';
import 'package:flutter_prueba_1/screens/Ejercicio01.dart';

void main(){
  runApp(Distancia());
}

class Distancia extends StatelessWidget {
  const Distancia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        title: const Text('Title'),
      ),
      body: Body(context),
    );
  }
}

Widget Body(context){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://media.gcflearnfree.org/content/62da99e3c980ce07ac5e4723_07_22_2022/Qu%C3%A9-es-la-distancia.png"),
        fit: BoxFit.cover
      )
    ),
    child: (
      Column(
        children: <Widget>[
          Velocidad(context),
          BotonD(context)
        ],
      )
    ),
  );
}

final TextEditingController _velocidad = TextEditingController();
Widget Velocidad(context){
  return(
    TextField(
      controller: _velocidad,
      decoration:const InputDecoration(
        hintText: "Ingrese la velocidad en m/s"
      ),
    )
  );
}

Widget BotonD(context){
  return(
    ElevatedButton(onPressed: (){
      alerta(context);
    }, child: Text("Calcular"))
  );
}

double calcularD(){
  double velocidad = double.tryParse(_velocidad.text) ?? 0.0;
  
  double distancia = velocidad * 100;
  return distancia;
}

void alerta(context){
  showDialog(context: context, builder:
    (context){
      return(
        AlertDialog(
          title: Text("Respuesta"),
          content: Text("La distancia es: ${calcularD()} m"),
        )
      );
    }
  );
}