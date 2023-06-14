import 'package:camap_bd_flutter/models/place.dart';
import 'package:camap_bd_flutter/screens/map_screen.dart';
import 'package:camap_bd_flutter/utils/location_util.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationInput extends StatefulWidget {

  final Function onSelectPosition;

  const LocationInput(
    this.onSelectPosition
  );

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl = '';

  void _showPreview(double? latitude, double? longitude) {
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: latitude, 
      longitude: longitude
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    Location location = new Location();
    final locData = await location.getLocation();

    _showPreview(locData.latitude, locData.longitude);
    
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedPosition = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapScreen(
          initialLocation: PlaceLocation(
            latitude: 0, 
            longitude: 0 
          ) 
        ), 
        fullscreenDialog: true
      )
    );

    if (selectedPosition == null) return;

    _showPreview(selectedPosition.latitude, selectedPosition.longitude);

    widget.onSelectPosition(selectedPosition);
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
              onPressed: _selectOnMap, 
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