import 'package:camap_bd_flutter/providers/great_places.dart';
import 'package:camap_bd_flutter/screens/place_form_screen.dart';
import 'package:camap_bd_flutter/screens/places_list_screen.dart';
import 'package:camap_bd_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Grate Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo, 
          accentColor: Colors.amber, 
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: PlacesListScreen(), 
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen()
        },
      ),
    );
  }
}