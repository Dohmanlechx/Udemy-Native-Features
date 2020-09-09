import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:udemy_native_features/helpers/db_helper.dart';
import 'package:udemy_native_features/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    // return [...items]; - Stackoverflow error!
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();

    DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
  }

  Future<void> fetchAndSet() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((e) => Place(
              id: e['id'],
              title: e['title'],
              image: File(e['image']),
              location: null,
            ))
        .toList();
    notifyListeners();
  }
}
