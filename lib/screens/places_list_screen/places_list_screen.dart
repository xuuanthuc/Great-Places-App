import 'package:flutter/material.dart';
import 'package:great_place_app/screens/add_places_screen/add_places_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routerName);
            },
          )
        ],
      ),
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
