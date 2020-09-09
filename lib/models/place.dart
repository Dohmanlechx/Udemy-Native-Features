import 'dart:io';

import 'package:flutter/cupertino.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  const Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
