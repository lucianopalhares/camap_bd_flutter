import 'dart:io';

import 'package:camap_bd_flutter/providers/great_places.dart';
import 'package:camap_bd_flutter/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {

  final _titleController = TextEditingController();
  late File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(
      context,
      listen: false
    ).addPlace(_titleController.text, _pickedImage);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Lugar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Titulo'
                    ),
                  ), 
                  ImageInput(this._selectImage)
                ]
              ),
            ),
          ),
          TextButton.icon(
            onPressed: _submitForm, 
            icon: Icon(Icons.add), 
            label: Text('Adicionar'), 
            style: TextButton.styleFrom(
              backgroundColor: Colors.orangeAccent, 
              elevation: 0, 
              tapTargetSize: MaterialTapTargetSize.shrinkWrap, 
              
            ),
          ), 
        ],
      ),
    );
  }
}