import 'dart:ui';
import 'package:econome/logic/logic.dart';
import 'package:econome/models/eduration.dart';
import 'package:econome/models/node.dart';
import 'package:econome/models/wallet.dart';
import 'package:econome/widget/piechart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:relative_time/relative_time.dart';
import 'package:routefly/routefly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

DateTime addMonths(DateTime date, int months) {
  if (months != 0) {
    final newYear = date.year +
        (months / 12).floor(); // Calculate new year (integer division)
    final newMonth =
        (date.month + months % 12) % 12; // Adjust month within 1-12 range
    return DateTime(newYear, newMonth, date.day); // Create new DateTime object
  }
  return date;
}

DateTime addDurationToDate(DateTime date,
    {int seconds = 0, int minutes = 0, int hours = 0, int months = 0}) {
  final duration = Duration(seconds: seconds, minutes: minutes, hours: hours);
  final newDate = date.add(duration);
  return addMonths(newDate, months); // Add months after adding base duration
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Wallet>> wallet = ref.watch(walletsProvider);
    final AsyncValue<List<Node>> nodes = ref.watch(nodesProvider);
    ref.watch(wsProvider);
    dynamic media = MediaQuery.of(context);
    List<Widget> _mainContents = [
      CustomScrollView(slivers: [
        SliverGrid.count(
          crossAxisCount: media.size.width <= 600 ? 1 : 2,
          children: [
            PieChartSample3(),
          ],
        ),
        SliverAppBar(
          centerTitle: true,
          title: Text("sad"),
          pinned: true,
        )
      ]),
      switch (nodes) {
        AsyncData(:final value) => ListView.builder(
            reverse: true,
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              var x = value[index].date;
              var y = parseDuration(value[index].interval!);
              var z = Duration(
                  days: y.days!,
                  hours: y.hours!,
                  minutes: y.minutes!,
                  seconds: y.seconds!);
              var w = addMonths(x!, y.months!);
              w = w.add(z);
              return PieMenu(
                actions: [
                  PieAction(
                    tooltip: const Text('delete'),
                    onSelect: () async {
                      await ref
                          .read(nodesProvider.notifier)
                          .delete(value[index]);
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                                  RelativeTime.locale(const Locale('en'))
                                      .format(w)),
                              Text("amount: " + value[index].amount.toString(),
                                  style: TextStyle(
                                      color: value[index].amount < 0
                                          ? Colors.red
                                          : Colors.green)),
                              Text("total: " + value[index].total.toString()),
                              Text("tag: " + value[index].tag)
                            ],
                          ),
                        ])),
              );
            },
          ),
        AsyncError(:final error, :final stackTrace) => Text(error.toString()),
        _ => const CircularProgressIndicator(),
      },
      ListView(children: const [
      ]),
      switch (wallet) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              return PieMenu(
                child: Card(
                    child: ListTile(
                  leading: Icon(Icons.wallet),
                  title: Text(value[index].name),
                  subtitle: Text(value[index].code),
                )),
                actions: [
                  PieAction(
                    tooltip: const Text('delete'),
                    onSelect: () async {
                      await ref
                          .read(walletsProvider.notifier)
                          .delete(value[index]);
                    },
                    child: const Icon(Icons.delete), // Can be any widget
                  ),
                ],
              );
            },
          ),
        AsyncError(:final error, :final stackTrace) => Text(error.toString()),
        _ => Skeletonizer(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.wallet),
                    title: Text("aaaaaaaaaaaaaaaaaaaaah"),
                    subtitle: Text("aaaaaaaaahaaaaaaaaah"),
                  ),
                );
              },
            ),
          )
      },
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Routefly.pushNavigate("profile");
            },
            icon: SvgPicture.asset(
              "assets/icon/menu.svg",
              semanticsLabel: 'A red up arrow',
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () {
                    ref.read(themeProvider.notifier).toggle();
                  },
                  icon: SvgPicture.asset(
                    "assets/icon/moon.svg",
                    semanticsLabel: 'A red up arrow',
                    fit: BoxFit.contain,
                  ),
                )),
          ],
          titleSpacing: 0,
          title: Text(
            switch (currentPageIndex) {
              1 => "Transactions",
              2 => "Goals",
              3 => "Wallets",
              _ => 'econome'
            },
            style: switch (currentPageIndex) {
              0 => TextStyle(fontFamily: 'zendots', fontSize: 25),
              _ => TextStyle(
                  fontFamily: 'sfpro',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: switch (currentPageIndex) {
            1 => Text("kill me"),
            _ => Text("sad"),
          },
          onPressed: () {
            switch (currentPageIndex) {
              case 3:
                Routefly.pushNavigate("add_wallet");
                break;
              case 1:
                Routefly.pushNavigate("add_node");
                break;
              default:
                null;
            }
          },
        ),
        bottomNavigationBar: media.size.width <= 600
            ? NavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shadowColor: Colors.black,
                onDestinationSelected: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                indicatorColor: Colors.amber,
                selectedIndex: currentPageIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    label: "Home",
                    icon: Icon(Icons.cloud_outlined),
                  ),
                  NavigationDestination(
                    icon: Badge(child: Icon(Icons.notifications_sharp)),
                    label: 'Transactions',
                  ),
                  NavigationDestination(
                    icon: Badge(
                      label: Text('2'),
                      child: Icon(Icons.messenger_sharp),
                    ),
                    label: 'Goals',
                  ),
                  NavigationDestination(
                    icon: Badge(
                      label: Text('2'),
                      child: Icon(Icons.messenger_sharp),
                    ),
                    label: 'Wallets',
                  ),
                ],
              )
            : null,
        body: PieCanvas(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Show the navigaiton rail if screen width >= 640
              if (MediaQuery.of(context).size.width >= 600)
                NavigationRail(
                  minWidth: 55.0,
                  selectedIndex: currentPageIndex,
                  // Called when one tab is selected
                  onDestinationSelected: (int index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  selectedLabelTextStyle: const TextStyle(
                    color: Colors.amber,
                  ),
                  unselectedLabelTextStyle: const TextStyle(),
                  // navigation rail items
                  destinations: const [
                    NavigationRailDestination(
                        icon: Icon(Icons.home), label: Text('Home')),
                    NavigationRailDestination(
                        icon: Icon(Icons.feed), label: Text('Feed')),
                    NavigationRailDestination(
                        icon: Icon(Icons.favorite), label: Text('Favorites')),
                    NavigationRailDestination(
                        icon: Icon(Icons.settings), label: Text('Settings')),
                  ],
                ),
              Expanded(child: _mainContents[currentPageIndex])
            ],
          ),
        ));
  }
}
