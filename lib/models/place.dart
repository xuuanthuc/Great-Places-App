import 'dart:html';

import 'package:flutter/cupertino.dart';

class PlaceLocation {
  final double latitude;
  final double longtitude;
  final String address;

  PlaceLocation({
    @required this.latitude,
    @required this.longtitude,
    this.address,});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}