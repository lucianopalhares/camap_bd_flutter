import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
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
          child: Text('Nenhuma imagem!'),
        ), 
        SizedBox(width: 10,), 
        TextButton.icon(
          onPressed: () {

          }, 
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