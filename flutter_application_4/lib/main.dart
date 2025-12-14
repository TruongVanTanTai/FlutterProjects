import 'package:flutter/material.dart';
import 'place-list.dart';

void main() {
  runApp(SavedPlaces());
}

class SavedPlaces extends StatelessWidget {
  const SavedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PlaceList());
  }
}
