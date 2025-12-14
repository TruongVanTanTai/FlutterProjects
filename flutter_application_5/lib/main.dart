import 'package:flutter/material.dart';
import 'villas.dart';

void main() {
  runApp(Booking());
}

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Villas());
  }
}
