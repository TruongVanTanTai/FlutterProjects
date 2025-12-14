import "package:flutter/material.dart";
import "class-list.dart";

void main(List<String> args) {
  runApp(ClassRoom());
}

class ClassRoom extends StatelessWidget {
  const ClassRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ClassList());
  }
}
