import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/helpers/db_helper.dart';
import 'package:flutter_complete_guide/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: null,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DbHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image,
      },
    );
  }

  Future<void> fetchandSetplaces() async {
    final dataList = await DbHelper.getData('user_places');
    dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }
}
