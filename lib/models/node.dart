import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  factory Node({
    int? id,
    required String name,
    required bool isgoal,
    required bool current,
    required double amount,
    required double total,
    required int wallet,
    required String tag,
    String? interval,
    DateTime? date,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
