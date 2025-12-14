import "package:flutter/material.dart";

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var _formKey = GlobalKey<FormState>();
  bool _isPassObscure = true;
  bool _isComfirmedPassObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Registration Form",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: RegistrationForm(),
      ),
    );
  }

  Widget RegistrationForm() {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 24,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      prefixIcon: Icon(Icons.email),
                      label: Text("Email"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: _isPassObscure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      label: Text("Password"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPassObscure = !_isPassObscure;
                          });
                        },
                        icon: Icon(
                          _isPassObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the password";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: _isComfirmedPassObscure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      prefixIcon: Icon(Icons.lock_outline),
                      label: Text("Comfirmed password"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isComfirmedPassObscure = !_isComfirmedPassObscure;
                          });
                        },
                        icon: Icon(
                          _isComfirmedPassObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please comfirm the password";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Register successfully"),
                          ),
                        );
                        setState(() {
                          _formKey = GlobalKey<FormState>();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Register unsuccessfully"),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.person_add),
                    label: Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
