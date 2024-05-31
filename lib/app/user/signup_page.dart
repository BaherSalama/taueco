// main.dart
import 'dart:convert';

import 'package:econome/models/user.dart';
import 'package:econome/widget/bigbutton.dart';
import 'package:econome/widget/passwordinput.dart';
import 'package:econome/widget/textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routefly/routefly.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _HomePageState();
}

class _HomePageState extends State<SignupPage> {
  TextEditingController pass = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  bool _isObscure = true;

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  Future<bool> _submit() async {
    var a =
        User(password: pass.text, email: email.text, username: username.text);
    debugPrint(a.toJson().toString());
    http.Response response = await http.post(
        Uri.http("127.0.0.1:8000", "/user/"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(a.toJson()));
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return true;
    }

    return false;
    // Routefly.push("user/test");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pass.dispose();
    username.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Signup'),
        ),
        body: Center(
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputText(
                          controller: email,
                          name: "Email",
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      InputText(
                          controller: username,
                          name: "User name",
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Must be more than 8 letters';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      PasswordText(
                          controller: pass,
                          name: "Password",
                          hide: _isObscure,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Must be more than 8 letters';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      BigButton(
                          name: "signup",
                          tap: () async {
                            final isValid = _formKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }
                            _formKey.currentState?.save();
                            if (await _submit()) {
                              Routefly.pop(context);
                            } else {
                              const s =
                                  SnackBar(content: Text('Email already used'));
                              ScaffoldMessenger.of(context).showSnackBar(s);
                            }
                          })
                    ]),
              )),
        ));
  }
}
