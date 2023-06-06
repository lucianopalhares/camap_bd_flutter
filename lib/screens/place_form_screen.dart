import 'package:camap_bd_flutter/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Lugar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Titulo'
                ),
              ), 
              ImageInput()
            ]
          ),
          TextButton.icon(
            onPressed: () {}, 
            icon: Icon(Icons.add), 
            label: Text('Adicionar'), 
            style: TextButton.styleFrom(
              backgroundColor: Colors.orangeAccent
            ),
          )
        ],
      ),
    );
  }
}