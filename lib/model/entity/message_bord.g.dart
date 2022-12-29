// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_bord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageBord _$$_MessageBordFromJson(Map<String, dynamic> json) =>
    _$_MessageBord(
      id: json['id'] as String,
      type: $enumDecodeNullable(_$MessageBordTypeEnumMap, json['type']),
      receiverUserName: json['receiverUserName'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastMovie: json['lastMovie'] as String?,
      lastPicture: json['lastPicture'] as String?,
      title: json['title'] as String?,
      ownerUserName: json['ownerUserName'] as String?,
      category: json['category'] as String?,
      receivedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['receivedAt'], const DateTimeConverter().fromJson),
      status:
          $enumDecodeNullable(_$StatusEnumMap, json['status']) ?? Status.edit,
    );

Map<String, dynamic> _$$_MessageBordToJson(_$_MessageBord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MessageBordTypeEnumMap[instance.type],
      'receiverUserName': instance.receiverUserName,
      'lastMessage': instance.lastMessage,
      'lastMovie': instance.lastMovie,
      'lastPicture': instance.lastPicture,
      'title': instance.title,
      'ownerUserName': instance.ownerUserName,
      'category': instance.category,
      'receivedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.receivedAt, const DateTimeConverter().toJson),
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$MessageBordTypeEnumMap = {
  MessageBordType.type1: 'type1',
  MessageBordType.type2: 'type2',
  MessageBordType.type3: 'type3',
  MessageBordType.type4: 'type4',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$StatusEnumMap = {
  Status.edit: 'edit',
  Status.send: 'send',
  Status.preview: 'preview',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
