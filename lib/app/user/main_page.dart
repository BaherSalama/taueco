import 'dart:async';
import 'dart:ui';
import 'package:econome/logic/logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:econome/models/eduration.dart';
import 'package:econome/models/node.dart';
import 'package:econome/models/tag.dart';
import 'package:econome/models/wallet.dart';
import 'package:econome/widget/nodeview.dart';
import 'package:econome/widget/piechart.dart';
import 'package:econome/widget/timeline.dart';
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

DateTime addDurationToDate(DateTime date,
    {int seconds = 0, int minutes = 0, int hours = 0, int months = 0}) {
  final duration = Duration(seconds: seconds, minutes: minutes, hours: hours);
  final newDate = date.add(duration);
  return addMonths(newDate, months); // Add months after adding base duration
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  Tag? selectedTag;
  Wallet? selectedwallet;
  int currentPageIndex = 0;
  late Timer _timer;
  int sad = 0;
  int g = 0;
  void changepie(int a) {
    setState(() {
      g = a;
      sad = a;
    });
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 30), (Timer timer) {
      // print(sad);
      ref.read(nodesProvider.notifier).up();
      ref.read(balanceProvider(sad).notifier).up();
      // print(sad);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Wallet>> wallet = ref.watch(walletsProvider);
    final AsyncValue<List<Node>> nodes = ref.watch(nodesProvider);
    final AsyncValue<List<Tag>> tags = ref.watch(tagsProvider);
    final AsyncValue<Map<String, double>> balance =
        ref.watch(balanceProvider(sad));
    dynamic media = MediaQuery.of(context);
    List<Widget> _mainContents = [
      CustomScrollView(slivers: [
        SliverList.list(
          // crossAxisCount: media.size.width <= 600 ? 1 : 2,
          children: [
            PieChartSample3(balance: balance, sad: sad, g: g, c: changepie),
            Timeline(nodes: nodes),
          ],
        ),
        SliverAppBar(
          centerTitle: true,
          title: Text("sad"),
          pinned: true,
        )
      ]),
      switch (nodes) {
        AsyncData(:final value) => NodeView(
            value: value
                .where((e) =>
                    (selectedwallet != null
                        ? selectedwallet?.id == e.wallet
                        : true) &&
                    (selectedTag == null ? true : selectedTag?.name == e.tag))
                .toList()),
        AsyncError(:final error, :final stackTrace) => Text(error.toString()),
        _ => const CircularProgressIndicator(),
      },
      switch (nodes) {
        AsyncData(:final value) => NodeView(
            value: value
                .where((e) =>
                    (selectedwallet != null
                        ? selectedwallet?.id == e.wallet
                        : true) &&
                    (selectedTag == null ? true : selectedTag?.name == e.tag)
                    &&
                    (e.type == 0)
                )
                .toList()),
        AsyncError(:final error, :final stackTrace) => Text(error.toString()),
        _ => const CircularProgressIndicator(),
      },
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
    return PieCanvas(
        child: Scaffold(
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
                fontFamily: 'sfpro', fontSize: 25, fontWeight: FontWeight.bold),
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: PieMenu(
        theme: PieTheme(
            buttonTheme: PieButtonTheme(
                backgroundColor: Colors.black, iconColor: Colors.red)),
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withBlue(100),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(16),
            child: Text("Hold")),
        actions: [
          PieAction(
            tooltip: const Text('Add'),
            onSelect: () => switch (currentPageIndex) {
              1 => Routefly.pushNavigate("add_node"),
              3 => Routefly.pushNavigate("add_wallet"),
              _ => null
            },
            child: const Icon(Icons.add), // Can be any widget
          ),
          PieAction(
            tooltip: const Text('Search'),
            onSelect: () => showModalBottomSheet(
                isScrollControlled: true,
                elevation: 5,
                context: context,
                builder: (ctx) => Padding(
                      padding: EdgeInsets.only(
                          top: 15,
                          left: 15,
                          right: 15,
                          bottom: MediaQuery.of(ctx).viewInsets.bottom + 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flex(
                            direction: Axis.vertical,
                            children: [
                              Flex(direction: Axis.horizontal, children: [
                                Text("wallets: "),
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
                                      DropdownMenuEntry(
                                          value: null!, label: "failed"),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 50),
                              ]),
                              Flex(direction: Axis.horizontal, children: [
                                Text("tag: "),
                                DropdownMenu<Wallet>(
                                  label: Text("wallet"),
                                  onSelected: (Wallet? newValue) {
                                    setState(() {
                                      selectedwallet = newValue!;
                                    });
                                  },
                                  dropdownMenuEntries: wallet.when(
                                    data: (data) => data
                                        .map<DropdownMenuEntry<Wallet>>((tag) {
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
                                      DropdownMenuEntry(
                                          value: null!, label: "failed"),
                                    ],
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    )),
            child: const Icon(Icons.search), // Can be any widget
          ),
        ],
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
      body: Row(
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
