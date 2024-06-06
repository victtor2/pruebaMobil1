import 'package:flutter/material.dart';
import 'package:flutter_prueba_1/screens/Ejercicio01.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Pagina Principal",
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
        title: const Text('Pagina Principal'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    /*decoration: const BoxDecoration(
      image: DecorationImage(
        image: Image.asset('assets/image/GitHub-logo.webp')
    ),*/
    child: (
      
      Column(
        children: <Widget>[
          Nombre(),
          Boton(context)
        ],
      )
    ),
  );
}

Widget Nombre(){
  return(
    const Text("Victor Grazon")
  );
}

Widget Boton(context){
  return(
    ElevatedButton(onPressed: () {
      Navigator.push(context,
       MaterialPageRoute(builder: (context) => MasaCorporal())
       );
    }, child: Text("Ir al Ejercicio01"))
  );
}