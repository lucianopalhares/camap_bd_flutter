import 'dart:io';
import 'dart:math';

import 'package:camap_bd_flutter/utils/db_util.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = []; 

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(), 
      title: title, 
      image: image, 
      location: PlaceLocation(latitude: 0, longitude: 0)
    );

    _items.add(newPlace);

    DbUtil.insert('places', {
      'id': newPlace.id, 
      'title': newPlace.title, 
      'image': newPlace.image.path,
    });

    notifyListeners();
  }
}