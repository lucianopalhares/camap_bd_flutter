import 'package:camap_bd_flutter/providers/great_places.dart';
import 'package:camap_bd_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'), 
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            }, 
            icon: Icon(Icons.add)
          )
        ],
      ),
      body: FutureBuilder(
        future: 
          Provider.of<GreatPlaces>(context, listen: false).loadPlaces(), 
        builder: (contextFutureBuilder, snapshot) => 
          snapshot.connectionState == ConnectionState.waiting
          ? Center(child: CircularProgressIndicator(),)
          : Consumer<GreatPlaces>(
          child: Center(child: Text('Nenhum local cadastrado!')), 
          builder: (contextBuilder, greatPlaces, childBuilder) => 
            greatPlaces.itemsCount == 0 
            ? Text('Não possui nenhum local!') 
            : ListView.builder(
                itemCount: greatPlaces.itemsCount,
                itemBuilder: 
                  (contextItemBuilder, indexItemBuilder) => 
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                        greatPlaces.itemByIndex(indexItemBuilder).image
                      ),
                    ), 
                    title: Text(greatPlaces.itemByIndex(indexItemBuilder).title),
                    subtitle: Text(greatPlaces.itemByIndex(indexItemBuilder).location.address.toString()),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.PLACE_DETAIL, 
                        arguments: greatPlaces.itemByIndex(indexItemBuilder),
                      );
                    },
                  )
              )
            ),
      ),
    );
  }
}