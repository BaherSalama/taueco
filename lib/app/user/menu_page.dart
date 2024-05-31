// main.dart
import 'dart:convert';

import 'package:econome/models/user.dart';
import 'package:econome/widget/bigbutton.dart';
import 'package:econome/widget/passwordinput.dart';
import 'package:econome/widget/textinput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:routefly/routefly.dart';
import 'package:http/http.dart' as http;

class AppPage extends StatelessWidget {
  const AppPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SettingsList(
            sections: [
              SettingsSection(
                title: Text('Section'),
                tiles: [
                  SettingsTile(
                    title: Text('Language'),
                    leading: Icon(Icons.language),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile.switchTile(
                    title: Text('Use fingerprint'),
                    leading: Icon(Icons.fingerprint),
                    onToggle: (bool value) {},
                    initialValue: null,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
