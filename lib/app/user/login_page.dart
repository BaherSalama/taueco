// main.dart
import 'dart:convert';

import 'package:econome/logic/logic.dart';
import 'package:econome/models/user.dart';
import 'package:econome/widget/bigbutton.dart';
import 'package:econome/widget/passwordinput.dart';
import 'package:econome/widget/textinput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routefly/routefly.dart';
import 'package:http/http.dart' as http;

String? rawCookies;
String? user;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
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
    http.Response response = await http.post(Uri.http(ip, "/user/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(a.toJson()));
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      if (response.headers['set-cookie'] != null) {
        // save/process cookies
        rawCookies = response.headers['set-cookie']!;
      }
      user = a.email;
      debugPrint("noice");
      debugPrint(rawCookies);
      return true;
    }
    return false;
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
          title: const Text('Login'),
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
                      // RichText( text: const TextSpan(
                      //           text: "Password",
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               color: Colors.black
                      //           ))),
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
                      InkWell(
                          onTap: () {
                            Routefly.push("user/signup");
                          },
                          child: RichText(
                            text: const TextSpan(
                                text: "Don’t have an account yet? ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  color: Color(0xff7d7d84),
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  )
                                ]),
                          )),
                      SizedBox(height: 50),
                      BigButton(
                          name: "Login",
                          tap: () async {
                            final isValid = _formKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }
                            _formKey.currentState?.save();
                            if (await _submit()) {
                              Routefly.navigate("user/main");
                            } else {
                              const s = SnackBar(
                                  content: Text('Email or password wrong'));
                              ScaffoldMessenger.of(context).showSnackBar(s);
                            }
                          })
                    ]),
              )),
        ));
  }
}
