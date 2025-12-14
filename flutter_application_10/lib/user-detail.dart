import 'package:flutter/material.dart';
import 'package:flutter_application_10/api.dart';
import 'package:flutter_application_10/model/token.dart';
import 'package:flutter_application_10/model/user.dart';

class UserDetail extends StatefulWidget {
  Token token;

  UserDetail({super.key, required this.token});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  late Api api;
  late Future<User?> user;

  @override
  void initState() {
    super.initState();
    api = Api();
    user = api.getUser(widget.token.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: UserProfile()));
  }

  Widget UserProfile() {
    return Column(children: [Toolbar(), UserInformationContainer()]);
  }

  Widget Toolbar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.logout),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              user = api.getUser(widget.token.accessToken);
            });
          },
          icon: Icon(Icons.refresh),
        ),
      ],
    );
  }

  Widget UserInformationContainer() {
    return FutureBuilder(
      future: user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (snapshot.data == null) {
            //return Center(child: Text("Get user information unsuccessfully"));
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
            return Container();
          }
          return UserInformation(snapshot.data!);
        } else {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget UserInformation(User user) {
    return Expanded(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.network(user.image),
                  Text(
                    "${user.firstName} ${user.lastName}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 8),
                  Text("Username: ${user.username}"),
                  Text("Email: ${user.email}"),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Center(
                  child: Text(
                    "Detail Infomation",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text("Age: ${user.age}"),
                Text("Gender: ${user.gender}"),
                Text("Phone: ${user.phone}"),
                Text("Birth: ${user.birthDate}"),
                Text("Blood group: ${user.bloodGroup}"),
                Text("Height: ${user.height}"),
                Text("Weight: ${user.weight}"),
                Text("EyeColor: ${user.eyeColor}"),
                Text("Ip: ${user.ip}"),
                Text("MacAddress: ${user.macAddress}"),
                Text("University: ${user.university}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
