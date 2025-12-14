import 'package:flutter/material.dart';

class LogInApp extends StatefulWidget {
  const LogInApp({super.key});

  @override
  State<LogInApp> createState() => _LogInAppState();
}

class _LogInAppState extends State<LogInApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In Form"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: LogInForm(),
    );
  }

  Widget LogInForm() {
    final _formKey = GlobalKey<FormState>();
    bool isObscureText = true;

    void changeObcureTextState() {
      setState(() {
        isObscureText = !isObscureText;
      });
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "User name",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter the user name!";
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: isObscureText,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    changeObcureTextState();
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter the password!";
                }
                return null;
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: Size(200, 50),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Log in successfully!")),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login),
                  SizedBox(width: 8),
                  Text("Log In"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
