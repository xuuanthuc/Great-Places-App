import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:great_place_app/helpers/db_helpers.dart';
import 'package:great_place_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: null,
      image: image,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      //image thi luu tru duong dan den hinh anh vi dinh dang trong CSDL la TEXT
    });
  }

  Future<void> fetchAndSetPlace() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image']),
          ),
        ).toList();
    print(dataList);
    notifyListeners();

  }
}
