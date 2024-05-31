import 'dart:convert';
import 'package:econome/app/user/login_page.dart';
import 'package:econome/models/tag.dart';
import 'package:econome/models/wallet.dart';
import 'package:econome/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'logic.g.dart';

var ip = '127.0.0.1:8000';
// @riverpod
// Future<List<Wallet>> wallets(WalletsRef ref) async {
//   try {
//     final response = await http.get(
//       Uri.http('127.0.0.1:8000', '/wallet/'),
//       headers: {'Content-Type': 'application/json','Cookie':rawCookies!}, // Assuming secure cookie handling
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> json = jsonDecode(response.body);
//       final List<Wallet> x = json.map((wallet) => Wallet.fromJson(wallet)).toList();
//       print(x);
//       return x;
//     } else {
//       // Handle unsuccessful request (e.g., print error or return empty list)
//       print('Error fetching wallets: ${response.statusCode}');
//       return [];
//     }
//   } catch (e) {
//     // Handle other exceptions (e.g., network errors or JSON parsing errors)
//     print('Error fetching wallets: $e');
//     return [];
//   }
// }

@riverpod
class Wallets extends _$Wallets {
  @override
  Future<List<Wallet>> build() async {
    try {
      final response = await http.get(
        Uri.http(ip, '/wallet/'),
        headers: {
          'Content-Type': 'application/json',
          'Cookie': rawCookies!
        }, // Assuming secure cookie handling
      );

      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        final List<Wallet> x =
            json.map((wallet) => Wallet.fromJson(wallet)).toList();
        print(x);
        return x;
      } else {
        // Handle unsuccessful request (e.g., print error or return empty list)
        print('Error fetching wallets: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Handle other exceptions (e.g., network errors or JSON parsing errors)
      print('Error fetching wallets: $e');
      return [];
    }
  }

  Future<bool> add(Wallet a) async {
    debugPrint(a.toJson().toString());
    http.Response response = await http.post(Uri.http(ip, "/wallet/"),
        headers: {'Content-Type': 'application/json', 'Cookie': rawCookies!},
        body: jsonEncode(a.toJson()));
    if (response.statusCode == 200) {
      ref.invalidateSelf();
      return true;
    }
    return false;
  }

  Future<bool> delete(Wallet a) async {
    debugPrint(a.toJson().toString());
    http.Response response = await http.delete(Uri.http(ip, "/wallet/"),
        headers: {'Content-Type': 'application/json', 'Cookie': rawCookies!},
        body: jsonEncode(a.toJson()));
    if (response.statusCode == 200) {
      ref.invalidateSelf();
      return true;
    }
    return false;
  }
}

@riverpod
Future<List<Tag>> tags(TagsRef ref) async {
  final response = await http.get(
    Uri.http(ip, '/tag/'),
    headers: {
      'Content-Type': 'application/json',
      'Cookie': rawCookies!
    }, // Assuming secure cookie handling
  );
  final List<dynamic> json = jsonDecode(response.body);

  final List<Tag> x = json.map((tag) => Tag.fromJson(tag)).toList();
  print(json);
  return x;
}

@riverpod
class theme extends _$theme {
  var sad = ThemeMode.light;
  @override
  ThemeMode build() {
    return sad;
  }

  void toggle() {
    if (sad == ThemeMode.light) {
      sad = ThemeMode.dark;
    } else {
      sad = ThemeMode.light;
    }
    ref.invalidateSelf();
  }
}
