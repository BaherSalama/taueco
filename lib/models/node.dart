import 'package:freezed_annotation/freezed_annotation.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  factory Node({
    required String key,
    required String name,
    required String type,
    required double amount,
    required double total,
    required Duration interval,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
