// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      type: (json['type'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      wallet: (json['wallet'] as num).toInt(),
      tag: json['tag'] as String,
      interval: json['interval'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'amount': instance.amount,
      'total': instance.total,
      'wallet': instance.wallet,
      'tag': instance.tag,
      'interval': instance.interval,
      'date': instance.date?.toIso8601String(),
    };
