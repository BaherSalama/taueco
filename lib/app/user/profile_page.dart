// main.dart
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:routefly/routefly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: ListView(children: [
          ListTile(
            title: Text("Profile"),
            onTap: (){
              Routefly.push("setting");
            },
          )
        ]) 
      );
  }
}
