import 'dart:collection';
import 'package:flutter/material.dart';

class StateControl extends ChangeNotifier {
  //hier muss eigentlich die _data rein, wenn es später als json decodiert wurde
  final List<Map<String, dynamic>> _rooms = [];

  // so I can return _rooms globally
  UnmodifiableListView<Map<String, dynamic>> get rooms =>
      UnmodifiableListView(_rooms);

  void addRoom(Map<String, dynamic> roomData) {
    //to prevent double scanning
    if (!_rooms.contains(roomData)) {
      _rooms.add(roomData);
      notifyListeners();
    }
  }
}
