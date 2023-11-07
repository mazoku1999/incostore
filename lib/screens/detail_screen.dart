import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String titulo = '';
  String precio = '';
  //recibiendo argumentos con modal route

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    //las imagenes con hero animation

    return Scaffold(
      appBar: AppBar(
        title: Text(data['titulo']),
      ),
      body: Column(
        children: [
          Hero(
            tag: data['id'],
            child: Image.network(
              data['imagen'],
              height: 400,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data['titulo'],
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 20),
          Text(
            data['descripcion'],
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 20),
          Text(
            "Bs. ${data['precio'].toString()}",
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
