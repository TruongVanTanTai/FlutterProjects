import 'package:flutter/material.dart';
import 'package:flutter_application_10/login-app.dart';
import 'package:flutter_application_11/registration-page.dart';
import 'package:flutter_application_12/colorful-page.dart';
import 'package:flutter_application_13/countdown-timer-page.dart';
import 'package:flutter_application_2/information-page.dart';
import 'package:flutter_application_3/class-list.dart';
import 'package:flutter_application_4/place-list.dart';
import 'package:flutter_application_5/villas.dart';
import 'package:flutter_application_6/counter-app.dart';
import 'package:flutter_application_7/log-in.dart';
import 'package:flutter_application_8/my-product.dart';
import 'package:flutter_application_9/my-articles.dart';

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
        appBar: AppBar(
          title: Text('Tổng hợp bài tập'),
          centerTitle: true,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                child: Center(
                  child: Text(
                    "📋 Danh sách bài tập",
                    style: TextStyle(color: Colors.white, fontSize: 24),
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
              ListTile(
                title: Text('Bài 2: Danh sách lớp học'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClassList()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 3: Danh sách địa điểm đơn giản'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaceList()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 4: Danh sách địa điểm phức tạp'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Villas()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 5: Ứng dụng đổi màu'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorfulPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 6: Ứng dụng đếm số'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CounterApp()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 7: Bộ đếm thời gian'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountdownTimerPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 8: Form đăng nhập'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInApp()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 9: Form đăng ký'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 10: Danh sách sản phẩm'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProducts()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 11: Danh sách tin tức'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyArticles()),
                  );
                },
              ),
              ListTile(
                title: Text('Bài 12: Đăng nhập và hồ sơ'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginApp()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '👨‍🎓 Trương Văn Tấn Tài',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '🪪 22T1020402',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
