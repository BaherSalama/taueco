// main.dart
import 'package:econome/logic/logic.dart';
import 'package:econome/models/node.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_time/relative_time.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  Timeline({super.key, required this.nodes});
  AsyncValue<List<Node>> nodes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(119, 152, 86, 210),
                offset: Offset.zero,
                blurRadius: 5)
          ]),
      margin: EdgeInsets.all(17.0),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: const EdgeInsets.all(10.0)),
          switch (nodes) {
            AsyncData(:final value) => Outertimeline(
                processes: value.where((e) => e.interval!.isNotEmpty).toList()
                  ..sort((a, b) => add_interval_to_date(a.date, a.interval)
                      .compareTo(add_interval_to_date(b.date, b.interval)))),
            AsyncError(:final error, :final stackTrace) =>
              Text(error.toString()),
            _ => const CircularProgressIndicator(),
          },
          Padding(padding: const EdgeInsets.all(10.0)),
        ],
      ),
    );
  }
}

class Outertimeline extends StatelessWidget {
  const Outertimeline({Key? key, required this.processes}) : super(key: key);

  final List<Node> processes;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xff989898),
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      processes[index].name,
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    _InnerTimeline(messages: processes[index]),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              return DotIndicator(
                color: Color.fromARGB(146, 86, 19, 202),
                child: Icon(
                  Icons.timelapse_outlined,
                  color: Colors.white,
                  size: 12.0,
                ),
              );
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(),
          ),
        ),
      ),
    );
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.messages,
  });

  final Node messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline(
          theme: TimelineTheme.of(context).copyWith(
            nodePosition: 0,
            connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                  thickness: 1.0,
                ),
            indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                  size: 10.0,
                  position: 0.5,
                ),
          ),
          children: [
            TimelineTile(
              contents: Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(RelativeTime.locale(const Locale('en')).format(
                      add_interval_to_date(messages.date, messages.interval))),
                ),
              ),
              node: TimelineNode(
                indicator: DotIndicator(),
                startConnector: SolidLineConnector(),
                endConnector: SolidLineConnector(),
              ),
            ),
            TimelineTile(
              contents: Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text("amount: " + messages.amount.toString()),
                ),
              ),
              node: TimelineNode(
                indicator: DotIndicator(),
                startConnector: SolidLineConnector(),
              ),
            )
          ]),
    );
  }
}
