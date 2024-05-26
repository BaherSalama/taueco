// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      type: (json['type'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      interval: Duration(microseconds: (json['interval'] as num).toInt()),
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'amount': instance.amount,
      'total': instance.total,
      'interval': instance.interval.inMicroseconds,
    };
