// main.dart
import 'package:econome/logic/logic.dart';
import 'package:econome/models/tag.dart';
import 'package:econome/models/wallet.dart';
import 'package:econome/models/node.dart';
import 'package:econome/widget/bigbutton.dart';
import 'package:econome/widget/textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routefly/routefly.dart';

final List<String> times = ["seconds", "minutes", "hours", "days", "months"];

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
  String time = times.first;

  final TextEditingController colorController = TextEditingController();
  Tag? selectedTag;
  Wallet? selectedwallet;
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  bool isgoal = false;
  bool iscurrent = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    amount.dispose();
    total.dispose();
    interval.dispose();
    colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Tag>> tags = ref.watch(tagsProvider);
    final AsyncValue<List<Wallet>> wallets = ref.watch(walletsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Node'),
        ),
        body: Center(
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
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
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Flexible(
                          child: InputText(
                              controller: interval,
                              name: "Interval",
                              validator: (value) {
                                // if (value!.isEmpty) {
                                //   return 'Must be more than 8 letters';
                                // }
                                return null;
                              }),
                        ),
                        DropdownMenu<String>(
                          label: Text("Tag"),
                          onSelected: (String? newValue) {
                            setState(() {
                              time = newValue!;
                              print(newValue);
                            });
                          },
                          dropdownMenuEntries: times
                              .map((data) => DropdownMenuEntry<String>(
                                    value: data,
                                    label: data,
                                  ))
                              .toList(),
                        ),
                      ]),
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
                      SizedBox(height: 20),
                      Flex(direction: Axis.horizontal,children: [
                      Text("Goal"),
                      Checkbox(
                          value: isgoal,
                          onChanged: (bool? value) {
                            setState(() {
                              isgoal = value!;
                            });
                          }),
                      ]),
                      BigButton(
                          name: "add Transaction",
                          tap: () async {
                            final isValid = _formKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }
                            _formKey.currentState?.save();
                            if (await ref.read(nodesProvider.notifier).add(Node(
                                name: name.text,
                                amount: double.parse(amount.text),
                                interval: interval.text + " " + time,
                                tag: selectedTag!.name!,
                                total: double.parse(total.text),
                                isgoal: isgoal,
                                current: iscurrent,
                                wallet: selectedwallet!.id!))) {
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
