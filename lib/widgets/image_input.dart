import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  Widget fieldFile = Text('Nenhuma imagem entra!');
  final _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _takePicture() async {

    try {

      File imageFilePath = File('');
       
      final XFile? imageFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600
      );

      if (imageFile == null) {
        return;
      }

      setState(() {
        imageFilePath = File(imageFile.path);

        fieldFile = Image.file(
          imageFilePath, 
          width: double.infinity,
          fit: BoxFit.cover,
        );
      });

      //diretorio armazenar imagem
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      String fileName = path.basename(imageFile.path);
      final savedImage = await imageFilePath.copy(
        '${appDir.path}/${fileName}'
      );
      widget.onSelectImage(savedImage);

    } catch (e) {
      print('_takePicture = $e');
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
          child: fieldFile,
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