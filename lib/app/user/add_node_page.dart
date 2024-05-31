// main.dart
import 'dart:convert';
import 'dart:ffi';
import 'package:duration_time_picker/duration_time_picker.dart';
import 'package:econome/models/node.dart';

import 'package:econome/models/user.dart';
import 'package:econome/widget/bigbutton.dart';
import 'package:econome/widget/passwordinput.dart';
import 'package:econome/widget/textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routefly/routefly.dart';

class AddNodePage extends StatefulWidget {
  const AddNodePage({super.key});

  @override
  State<AddNodePage> createState() => _AddNodeState();
}

class _AddNodeState extends State<AddNodePage> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController interval = TextEditingController();
  Duration _durationMilli = Duration.zero;
  Duration _durationSecond = Duration.zero;
  Duration _durationMin = Duration.zero;
  Duration _durationHour = Duration.zero;
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  Future<bool> _submit() async {
    // var a =
    //     Node(name: name.text,
    //     amount:amount.text as double,
    //     total: total.text as double,
    //     interval: interval.text,
    //     tag: ,
    //     type: ,
    //     wallet: ,
    //     );
    // debugPrint(a.toJson().toString());
    // http.Response response = await http.post(
    //     Uri.http("127.0.0.1:8000", "/user/"),
    //     headers: {'Content-Type': 'application/json'},
    //     body: jsonEncode(a.toJson()));
    // debugPrint(response.statusCode.toString());
    // if (response.statusCode == 200) {
    //   return true;
    // }
    return false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    amount.dispose();
    total.dispose();
    interval.dispose();
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
                child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputText(
                          controller: name,
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
                          controller:amount,
                          name: "User name",
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Must be more than 8 letters';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      DurationTimePicker(
                        duration: _durationMilli,
                        baseUnit: BaseUnit.hour,
                        circleColor: Colors.grey.withOpacity(0.5),
                        progressColor: Colors.blue.withOpacity(1),
                        onChange: (val) {
                          setState(
                            () => _durationMilli = val,
                          );
                        },
                      ),
                      //     DurationTimePicker(
                      //       duration: _durationSecond,
                      //       baseUnit: BaseUnit.second,
                      //       progressColor: Colors.amber,
                      //       onChange: (val) {
                      //         setState(
                      //           () => _durationSecond = val,
                      //         );
                      //       },
                      //     ),
                      //     DurationTimePicker(
                      //       duration: _durationMin,
                      //       baseUnit: BaseUnit.minute,
                      //       circleColor: Colors.pink,
                      //       onChange: (val) {
                      //         setState(
                      //           () => _durationMin = val,
                      //         );
                      //       },
                      //     ),
                      //     DurationTimePicker(
                      //       duration: _durationHour,
                      //       baseUnit: BaseUnit.hour,
                      //       onChange: (val) {
                      //         setState(
                      //           () => _durationHour = val,
                      //         );
                      //       },
                      //     )
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
