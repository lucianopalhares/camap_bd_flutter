import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  late String imageFilePath;
  final _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageFilePath = '';
  }

  void _takePicture() async {

    try {
       
      final XFile? imageFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600
      );

      if (imageFile == null) {
        return;
      }

      setState(() {
        imageFilePath = imageFile.path;
      });

    } catch (e) {
      print('_takePicture = $e');
    }
  }

  Widget getFile() {
      
    if (imageFilePath != '') {

      return Image.file(
        File(imageFilePath), 
        width: double.infinity,
        fit: BoxFit.cover,
      );

    } else {
      return Text('Nenhuma imagem entra!');
    }
      
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180, 
          height: 100, 
          decoration: BoxDecoration(
            border: Border.all(
              width: 1, color: Colors.grey
            ), 
          ),
          alignment: Alignment.center,
          child: getFile(),
        ), 
        SizedBox(width: 10,), 
        TextButton.icon(
          onPressed: _takePicture, 
          icon: Icon(Icons.camera), 
          label: Text('Tirar Foto'), 
          style: TextButton.styleFrom(
            primary: Colors.black
          )
        )
      ]
    );
  }
}