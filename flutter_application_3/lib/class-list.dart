import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_application_3/class.dart";

class ClassList extends StatelessWidget {
  const ClassList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ClassInformationList()));
  }

  Widget ClassInformationList() {
    List<Class> classes = [];
    classes.add(
      Class(
        "2025-2026.1.TIN4403.001",
        "Lập trình ứng dụng cho các thiết bị di động - Nhóm 1",
        58,
      ),
    );
    classes.add(Class("2025-2026.1.TIN4404.005", "Java nâng cao Nhóm 5", 60));
    classes.add(
      Class("2024-2025.2.TIN3142.011", "Thực tập viết niên luận - Nhóm 11", 50),
    );
    classes.add(Class("2023-2024.1.TIN3023.012", "Toán Rời Rạc - Nhóm 12", 42));
    classes.add(Class("2022-2023.1.TOA1012.007", "Cơ sở toán - Nhóm 7", 35));

    return ListView(
      children: classes
          .map(
            (item) =>
                ClassItem(item.classId, item.className, item.numberOfStudents),
          )
          .toList(),
    );
  }

  Widget ClassItem(String? classId, String? className, int? numberOfStudents) {
    List colors = [
      Colors.blue,
      Colors.red,
      Colors.amber,
      Colors.pinkAccent,
      Colors.green,
      Colors.deepPurple,
      Colors.cyan,
      Colors.lightGreenAccent,
    ];

    Random random = Random();
    Color color = colors[random.nextInt(6)];

    return Container(
      margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 10),
      padding: EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfomationBlock(classId, className, numberOfStudents),
          PopupMenuButton(
            icon: Icon(Icons.more_horiz),
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Move")),
              PopupMenuItem(child: Text("Unsubscribe")),
            ],
          ),
        ],
      ),
    );
  }

  Widget InfomationBlock(
    String? classId,
    String? className,
    int? numberOfStudents,
  ) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                className == null ? "Default Class Name" : className,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                classId == null ? "Default Class Id" : classId,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Text("$numberOfStudents students", overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
