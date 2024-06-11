import 'package:econome/widget/bigbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routefly/routefly.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icon/Group.svg",
                  semanticsLabel: 'A red up arrow',
                  fit: BoxFit.contain,
                ),
                const Text('econome',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'zendots', fontSize: 50)),
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: const Text(
                      'econome is an application designed to'
                      ' help, organize, and manage your  '
                      'finances in a smart, and '
                      'efficient manner.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    )),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                BigButton(
                    name: "Get Started",
                    tap: () => Routefly.push("user/login")), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
