import 'package:econome/widget/piechart.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    dynamic media = MediaQuery.of(context);
    final List<Widget> _mainContents = [
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
      // ListView(children: [
      //   const TabBarView(children: [
      //     PieChartSample2(),
      //     PieChartSample1(),
      //     PieChartSample(),
      //   ]),
      //   Text(
      //     'Home page',
      //   ),
      // ]),
      Card(
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(8.0),
        child: ListView(children: [
          PieChartSample2(),
          PieChartSample1(),
          PieChartSample(),
          Text(
            'Home page',
          ),
        ]),
      ),
      const Card(
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Center(
            child: Text(
              'Home page',
            ),
          ),
        ),
      ),
      const Card(
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Center(
            child: Text(
              'Home page',
            ),
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: switch (currentPageIndex) {
          1 => Text("kill me"),
          _ => Text("sad"),
        },
        onPressed: () {},
      ),
      bottomNavigationBar: media.size.width <= 500
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Material(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: NavigationBar(
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
                  )))
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
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Show the navigaiton rail if screen width >= 640
          if (MediaQuery.of(context).size.width >= 500)
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
              leading: const Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ],
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
    );
  }
}
