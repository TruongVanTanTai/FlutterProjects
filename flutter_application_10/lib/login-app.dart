import "package:flutter/material.dart";
import "package:flutter_application_10/api.dart";
import "package:flutter_application_10/model/token.dart";
import "package:flutter_application_10/user-detail.dart";

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  var _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: LoginContainer()));
  }

  Widget LoginContainer() {
    // final _usernameController = TextEditingController();
    // final _passwordController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Login and Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.deepPurple,
            ),
          ),
        ),
        SizedBox(height: 60),
        Container(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              children: [
                TextFormField(
                  //initialValue: _username,
                  //controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _username = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text("Username"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the username";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  //controller: _passwordController,
                  //initialValue: _password,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    label: Text("Password"),
                    suffixIcon: _password == null || _password == ""
                        ? null
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enther the password";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Api api = Api();
                      Token? token = await api.getToken(
                        _username,
                        _password,
                        1,
                      );
                      if (token != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetail(token: token),
                          ),
                        );
                        setState(() {
                          _formKey = GlobalKey<FormState>();
                          _isObscure = true;
                          _password = null;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Log in unsuccessfully"),
                          ),
                        );
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      "Log in",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
