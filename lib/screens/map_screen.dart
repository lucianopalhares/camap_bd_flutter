// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  MapScreen({
    required this.initialLocation,
    this.isReadOnly = false   
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng _pickedPosition = LatLng(0, 0);

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  Set<Marker> setMarker() {

    final position;

    if (widget.initialLocation.latitude != 0) {      
      position = widget.initialLocation.toLatLng();
    } else {
      position = _pickedPosition;
    }

    if (position == null && !widget.isReadOnly) {
      return <Marker>[].toSet();
    } else {
      return [
        Marker(
          markerId: MarkerId('p1'),
          position: position
        )
      ].toSet();  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione...'),
        actions: <Widget>[
          if (!widget.isReadOnly)
            IconButton(
              onPressed: _pickedPosition == null ? null 
                : () => {
                  Navigator.of(context).pop(_pickedPosition)
                }, 
              icon: Icon(Icons.check)
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude, 
            widget.initialLocation.longitude
          ), 
        ),
        onTap: widget.isReadOnly ? null : _selectPosition,
        markers: setMarker()
          
      )
    );
  }
}