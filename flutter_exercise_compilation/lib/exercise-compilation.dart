import 'package:flutter/material.dart';
import 'package:flutter_application_2/information-page.dart';

class ExerciseCompilation extends StatefulWidget {
  const ExerciseCompilation({super.key});

  @override
  State<ExerciseCompilation> createState() => _ExerciseCompilationState();
}

class _ExerciseCompilationState extends State<ExerciseCompilation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Tổng hợp bài tập'), centerTitle: true),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                child: Text(
                  "📋 Danh sách bài tập",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text('Bài 1: Thông tin địa điểm du lịch'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformationPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
