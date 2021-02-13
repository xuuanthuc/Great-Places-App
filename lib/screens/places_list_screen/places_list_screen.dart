import 'package:flutter/material.dart';
import 'package:great_place_app/providers/great_places.dart';
import 'package:great_place_app/screens/add_places_screen/add_places_screen.dart';
import 'package:great_place_app/screens/places_detail_screen/places_detail_screen.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<GreatPlaces>(
        child: Center(child: Text('Got no Place yet, Start adding some!!!'),),
        //kiem tra xem trong list items co gia tri khong neu khong thi tra ve ch la child o tren
        builder: (ctx, greatPlace, ch)=> greatPlace.items.length <= 0 ? ch : ListView.builder(
          itemCount: greatPlace.items.length,
          itemBuilder: (ctx, index) => ListTile(
            leading: CircleAvatar(backgroundImage: FileImage(greatPlace.items[index].image),),
            title: Text(greatPlace.items[index].title),
            onTap:() => Navigator.of(context).pushNamed(DetailPlace.routeName, arguments: greatPlace.items[index].id),
          ),
        ),
      ),
    );
  }
}
