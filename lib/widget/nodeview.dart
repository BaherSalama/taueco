// main.dart
import 'package:econome/logic/logic.dart';
import 'package:econome/models/node.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:relative_time/relative_time.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:flutter/material.dart';

class NodeView extends StatelessWidget {
  NodeView({super.key, required this.nodes,required this.tags,required this.walltes});
  String? tags;
  int? walltes;
  AsyncValue<List<Node>> nodes;

  @override
  Widget build(BuildContext context) {
    return switch (nodes) {
      AsyncData(:final value) => 
      Filtered(
      value: value
      .where((e)=>
      (walltes!=null ? walltes == e.wallet : true) &&
      (tags ==null ? true:tags == e.tag)
      ).toList()),
      AsyncError(:final error, :final stackTrace) => Text(error.toString()),
      _ => const CircularProgressIndicator(),
    };
  }
}

class Filtered extends ConsumerWidget {
  const Filtered({Key? key, required this.value}) : super(key: key);

  final List<Node> value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      reverse: true,
      itemCount: value.length,
      itemBuilder: (BuildContext context, int index) {
        var w = add_interval_to_date(value[index].date, value[index].interval);
        return PieMenu(
          actions: [
            PieAction(
              tooltip: const Text('delete'),
              onSelect: () async {
                await ref.read(nodesProvider.notifier).delete(value[index]);
              },
              child: const Icon(Icons.delete), // Can be any widget
            ),
          ],
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(120, 0, 170, 255),
                        offset: Offset.zero,
                        blurRadius: 5)
                  ]),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.wallet),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("name: " + value[index].name),
                    Text("time: " +
                        RelativeTime.locale(const Locale('en')).format(w)),
                    Text("amount: " + value[index].amount.toString(),
                        style: TextStyle(
                            color: value[index].amount < 0
                                ? Colors.red
                                : Colors.green)),
                    Text("total: " + value[index].total.toString()),
                    Text("tag: " + value[index].tag),
                    Text("wallet: " + value[index].wallet.toString())
                  ],
                ),
              ])),
        );
      },
    );
  }
}
