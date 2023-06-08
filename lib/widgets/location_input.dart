import 'package:camap_bd_flutter/utils/location_util.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl = '';

  Future<void> _getCurrentUserLocation() async {
    Location location = new Location();
    final locData = await location.getLocation();
    
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: locData.latitude, 
      longitude: locData.longitude
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170, 
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1, 
              color: Colors.grey
            )
          ),
          child: _previewImageUrl == '' 
          ? Text('Localização não informada')
          : Image.network(
            _previewImageUrl, 
            fit: BoxFit.cover, 
            width: double.infinity,
          ),
        ), 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              onPressed: _getCurrentUserLocation, 
              icon: Icon(Icons.location_on), 
              label: Text('Localização Atual'), 
              style: 
                ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(color: Theme.of(context).primaryColor)))
                
            ),
            TextButton.icon(
              onPressed: () {}, 
              icon: Icon(Icons.map), 
              label: Text('Selecione no Mapa'), 
              style: 
                ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(color: Theme.of(context).primaryColor)))
                
            ),
          ],
        )
      ],
    );
  }
}