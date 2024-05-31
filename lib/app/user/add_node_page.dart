// main.dart
import 'dart:convert';
import 'dart:ffi';
import 'package:duration_time_picker/duration_time_picker.dart';
import 'package:econome/logic/logic.dart';
import 'package:econome/models/eduration.dart';
import 'package:econome/models/node.dart';
import 'package:econome/models/tag.dart';

import 'package:econome/models/user.dart';
import 'package:econome/models/wallet.dart';
import 'package:econome/widget/bigbutton.dart';
import 'package:econome/widget/passwordinput.dart';
import 'package:econome/widget/textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routefly/routefly.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class AddNodePage extends ConsumerStatefulWidget {
  const AddNodePage({super.key});

  @override
  ConsumerState<AddNodePage> createState() => _AddNodeState();
}

class _AddNodeState extends ConsumerState<AddNodePage> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController interval = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  ColorLabel? selectedColor;
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
    final AsyncValue<List<Tag>> tags = ref.watch(tagsProvider);
    final AsyncValue<List<Wallet>> wallets = ref.watch(walletsProvider);
    Tag selectedTag;
    Wallet selectedwallet;
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
                          name: "Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Cant be empty';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      InputText(
                          controller: amount,
                          name: "Amount",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'cant be empty';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      InputText(
                          controller: interval,
                          name: "Interval",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Must be more than 8 letters';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      InputText(
                          controller: total,
                          name: "Total",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Must be more than 8 letters';
                            }
                            return null;
                          }),
                      SizedBox(height: 50),
                      DropdownMenu<Tag>(
                        label: Text("Tag"),
                        onSelected: (Tag? newValue) {
                          setState(() {
                            selectedTag = newValue!;
                            print(newValue);
                          });
                        },
                        dropdownMenuEntries: tags.when(
                          data: (data) =>
                              data.map<DropdownMenuEntry<Tag>>((tag) {
                            return DropdownMenuEntry<Tag>(
                              value: tag,
                              label: tag.name!,
                            );
                          }).toList(),
                          loading: () => [
                            DropdownMenuEntry(
                              value: null!,
                              label: 'loading',
                            ),
                          ],
                          error: (error, stack) => [
                            DropdownMenuEntry(value: null!, label: "failed"),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      DropdownMenu<Wallet>(
                        label: Text("wallet"),
                        onSelected: (Wallet? newValue) {
                          setState(() {
                            selectedwallet = newValue!;
                            print(newValue);
                          });
                        },
                        dropdownMenuEntries: wallets.when(
                          data: (data) =>
                              data.map<DropdownMenuEntry<Wallet>>((tag) {
                            return DropdownMenuEntry<Wallet>(
                              value: tag,
                              label: tag.name!,
                            );
                          }).toList(),
                          loading: () => [
                            DropdownMenuEntry(
                              value: null!,
                              label: 'loading',
                            ),
                          ],
                          error: (error, stack) => [
                            DropdownMenuEntry(value: null!, label: "failed"),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      BigButton(
                          name: "add Transaction",
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
