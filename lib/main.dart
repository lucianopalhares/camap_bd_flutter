import 'package:camap_bd_flutter/screens/places_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grate Places',
      theme: ThemeData(
        primarySwatch: Colors.indigo, 
        accentColor: Colors.amber, 
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: PlacesListScreen()
    );
  }
}