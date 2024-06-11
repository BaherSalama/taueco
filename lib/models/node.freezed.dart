// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Node _$NodeFromJson(Map<String, dynamic> json) {
  return _Node.fromJson(json);
}

/// @nodoc
mixin _$Node {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isgoal => throw _privateConstructorUsedError;
  bool get current => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  int get wallet => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String? get interval => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res, Node>;
  @useResult
  $Res call(
      {int? id,
      String name,
      bool isgoal,
      bool current,
      double amount,
      double total,
      int wallet,
      String tag,
      String? interval,
      DateTime? date});
}

/// @nodoc
class _$NodeCopyWithImpl<$Res, $Val extends Node>
    implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? isgoal = null,
    Object? current = null,
    Object? amount = null,
    Object? total = null,
    Object? wallet = null,
    Object? tag = null,
    Object? interval = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isgoal: null == isgoal
          ? _value.isgoal
          : isgoal // ignore: cast_nullable_to_non_nullable
              as bool,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NodeImplCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$NodeImplCopyWith(
          _$NodeImpl value, $Res Function(_$NodeImpl) then) =
      __$$NodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      bool isgoal,
      bool current,
      double amount,
      double total,
      int wallet,
      String tag,
      String? interval,
      DateTime? date});
}

/// @nodoc
class __$$NodeImplCopyWithImpl<$Res>
    extends _$NodeCopyWithImpl<$Res, _$NodeImpl>
    implements _$$NodeImplCopyWith<$Res> {
  __$$NodeImplCopyWithImpl(_$NodeImpl _value, $Res Function(_$NodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? isgoal = null,
    Object? current = null,
    Object? amount = null,
    Object? total = null,
    Object? wallet = null,
    Object? tag = null,
    Object? interval = freezed,
    Object? date = freezed,
  }) {
    return _then(_$NodeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isgoal: null == isgoal
          ? _value.isgoal
          : isgoal // ignore: cast_nullable_to_non_nullable
              as bool,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NodeImpl implements _Node {
  _$NodeImpl(
      {this.id,
      required this.name,
      required this.isgoal,
      required this.current,
      required this.amount,
      required this.total,
      required this.wallet,
      required this.tag,
      this.interval,
      this.date});

  factory _$NodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NodeImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final bool isgoal;
  @override
  final bool current;
  @override
  final double amount;
  @override
  final double total;
  @override
  final int wallet;
  @override
  final String tag;
  @override
  final String? interval;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'Node(id: $id, name: $name, isgoal: $isgoal, current: $current, amount: $amount, total: $total, wallet: $wallet, tag: $tag, interval: $interval, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isgoal, isgoal) || other.isgoal == isgoal) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isgoal, current,
      amount, total, wallet, tag, interval, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeImplCopyWith<_$NodeImpl> get copyWith =>
      __$$NodeImplCopyWithImpl<_$NodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NodeImplToJson(
      this,
    );
  }
}

abstract class _Node implements Node {
  factory _Node(
      {final int? id,
      required final String name,
      required final bool isgoal,
      required final bool current,
      required final double amount,
      required final double total,
      required final int wallet,
      required final String tag,
      final String? interval,
      final DateTime? date}) = _$NodeImpl;

  factory _Node.fromJson(Map<String, dynamic> json) = _$NodeImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  bool get isgoal;
  @override
  bool get current;
  @override
  double get amount;
  @override
  double get total;
  @override
  int get wallet;
  @override
  String get tag;
  @override
  String? get interval;
  @override
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$NodeImplCopyWith<_$NodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
