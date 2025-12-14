import 'dart:math';

import 'package:flutter/material.dart';

class ColorfulPage extends StatefulWidget {
  const ColorfulPage({super.key});

  @override
  State<ColorfulPage> createState() => _ColorfulPageState();
}

class _ColorfulPageState extends State<ColorfulPage> {
  List<String> labels = [
    'Blue',
    'Red',
    'Green',
    'Yellow',
    'Purple',
    'Pink',
    'Orange',
    'Grey',
  ];

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.pink,
    Colors.orange,
    Colors.grey,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Color Application'),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        body: ColorfulContainer(),
      ),
    );
  }

  Widget ColorfulContainer() {
    return Container(
      width: double.infinity,
      color: colors[currentIndex],
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Current color: ${labels[currentIndex]}',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(Icons.refresh),
                label: Text('Refresh'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: colors[currentIndex],
                  backgroundColor: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    Random random = Random();
                    currentIndex = random.nextInt(8);
                  });
                },
                icon: Icon(Icons.color_lens),
                label: Text('Change color'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: colors[currentIndex],
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
