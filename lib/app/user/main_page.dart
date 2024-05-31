import 'dart:ui';

import 'package:econome/logic/logic.dart';
import 'package:econome/models/wallet.dart';
import 'package:econome/widget/piechart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routefly/routefly.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Wallet>> wallet = ref.watch(walletsProvider);
    dynamic media = MediaQuery.of(context);
    List<Widget> _mainContents = [
      CustomScrollView(
        slivers: [
          SliverGrid.count(
            crossAxisCount: media.size.width <= 600 ? 1 : 2,
            children: [
              PieChartSample(),
              PieChartSample(),
              PieChartSample(),
              PieChartSample(),
              PieChartSample(),
            ],
          ),
          SliverAppBar(
            centerTitle: true,
            title: Text("sad"),
            pinned: true,
          ),
          SliverGrid.count(
            crossAxisCount: media.size.width <= 600 ? 1 : 2,
            children: [
              PieChartSample(),
              PieChartSample(),
              PieChartSample(),
              PieChartSample(),
              PieChartSample(),
            ],
          )
        ],
      ),
      ListView(children: const [
        PieChartSample(),
      ]),
      ListView(children: const [
        PieChartSample2(),
        PieChartSample1(),
        PieChartSample(),
        Text(
          'Home page',
        ),
      ]),
      // CustomScrollView(
      //   slivers: [
      //   switch (wallet) {
      //   AsyncData(:final value) =>
      //     SliverGrid.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500), itemBuilder: (context, index) =>
      //         SizedBox(
      //           width: 500,
      //           height: 200,
      //           child: Card(
      //             child: ListTile(
      //             leading: Icon(Icons.wallet),
      //             title: Text(value[index].name),
      //             subtitle: Text(value[index].code),
      //         )))
      //     ),
      //   AsyncError(:final error, :final stackTrace) => Text(error.toString()),
      //   _ => const CircularProgressIndicator(),
      //   }
      //   ],

      // ),
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
        _ => const CircularProgressIndicator(),
      },
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
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
        // const TabBar(
        //   dividerHeight: 0,
        //   padding: EdgeInsets.all(16.0),
        //   indicator: DotIndicator(color: Colors.black, radius: 5),
        //   tabs: <Widget>[
        //     Tab(
        //       text: "Home",
        //       icon: Icon(Icons.cloud_outlined),
        //     ),
        //     Tab(
        //       text: "Transactions",
        //       icon: Icon(Icons.beach_access_sharp),
        //     ),
        //     Tab(
        //       text: "Goals",
        //       icon: Icon(Icons.brightness_5_sharp),
        //     ),
        //     Tab(
        //       text: "Wallets",
        //       icon: Icon(Icons.brightness_5_sharp),
        //     ),
        //   ],
        // ),
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
