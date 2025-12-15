import 'package:flutter/material.dart';
import 'dart:math';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int currentNumber = 0;
  Color randomColor = Colors.red;

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.pink,
    Colors.purple,
  ];

  void decreaseNumber() {
    setState(() {
      Random random = Random();
      randomColor = colors[random.nextInt(colors.length)];
      currentNumber--;
    });
  }

  void increaseNumber() {
    setState(() {
      Random random = Random();
      randomColor = colors[random.nextInt(colors.length)];
      currentNumber++;
    });
  }

  void resetNumber() {
    setState(() {
      Random random = Random();
      randomColor = colors[random.nextInt(colors.length)];
      currentNumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number counting application'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: Colors.blue,
      ),
      body: NumberShowing(),
      backgroundColor: Colors.white,
    );
  }

  Widget NumberShowing() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Current value:', style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        Text(
          '$currentNumber',
          style: TextStyle(
            color: randomColor,
            fontSize: 100,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ActionBar(),
      ],
    );
  }

  Widget ActionBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        ElevatedButton(
          onPressed: decreaseNumber,
          child: Row(spacing: 5, children: [Icon(Icons.remove), Text('Giam')]),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
        ElevatedButton(
          onPressed: resetNumber,
          child: Row(spacing: 5, children: [Icon(Icons.refresh), Text('Lai')]),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
          ),
        ),
        ElevatedButton(
          onPressed: increaseNumber,
          child: Row(spacing: 5, children: [Icon(Icons.add), Text('Tang')]),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
