import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimerPage extends StatefulWidget {
  const CountdownTimerPage({super.key});

  @override
  State<CountdownTimerPage> createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  Timer? timer = null;
  late TextEditingController textEditingController;
  late int periodOfTime;

  @override
  void initState() {
    textEditingController = TextEditingController();
    periodOfTime = 0;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    if (timer != null) timer!.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      periodOfTime = int.parse(textEditingController.text);
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (periodOfTime == 0) {
        setState(() {
          timer.cancel();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('⏰ Time\'s up!')));
        });
      } else {
        setState(() {
          periodOfTime--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('⌛ Countdown Timer'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: CountdownTimer(),
      ),
    );
  }

  Widget CountdownTimer() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Text(
            'Number of seconds to count down:',
            style: TextStyle(fontSize: 16),
          ),
          TextField(
            controller: textEditingController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide()),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.5),
              ),
            ),
          ),
          Text(
            '${(periodOfTime ~/ 60).toString().padLeft(2, '0')} : ${(periodOfTime % 60).toString().padLeft(2, '0')}',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if (textEditingController.text == null ||
                      textEditingController.text.isEmpty ||
                      !RegExp(r'^\d+$').hasMatch(textEditingController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('🔢 The input must be only number'),
                      ),
                    );
                  } else {
                    if (timer != null) timer!.cancel();
                    startTimer();
                  }
                },
                icon: Icon(Icons.play_arrow),
                label: Text('Start'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (timer != null) timer!.cancel();
                  setState(() {
                    textEditingController.clear();
                    periodOfTime = 0;
                  });
                },
                icon: Icon(Icons.refresh),
                label: Text('Reset'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
