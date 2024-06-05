// main.dart
import 'dart:convert';

import 'package:econome/logic/logic.dart';
import 'package:econome/models/wallet.dart';
import 'package:econome/widget/bigbutton.dart';
import 'package:econome/widget/textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routefly/routefly.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<SignupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController code = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    code.dispose();
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
                          controller: name,
                          name: "Name",
                          validator: (value) {
                            if (value!.isEmpty || value.length < 2) {
                              return 'Must be more than 2 letters';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      InputText(
                          controller: code,
                          name: "Code",
                          validator: (value) {
                            if (value!.isEmpty || value.length == 7) {
                              return 'Must be 7 letters';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      BigButton(
                          name: "Add wallet",
                          tap: () async {
                            final isValid = _formKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }
                            _formKey.currentState?.save();
                            if (await ref.read(walletsProvider.notifier).add(
                                Wallet(name: name.text, code: code.text))) {
                              Routefly.pop(context);
                            } else {
                              const s = SnackBar(content: Text('Cant add'));
                              ScaffoldMessenger.of(context).showSnackBar(s);
                            }
                          })
                    ]),
              )),
        ));
  }
}
