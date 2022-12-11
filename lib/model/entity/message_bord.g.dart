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
      title: json['title'] as String?,
      status:
          $enumDecodeNullable(_$StatusEnumMap, json['status']) ?? Status.edit,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.owner,
    );

Map<String, dynamic> _$$_MessageBordToJson(_$_MessageBord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MessageBordTypeEnumMap[instance.type],
      'receiverUserName': instance.receiverUserName,
      'lastMessage': instance.lastMessage,
      'title': instance.title,
      'status': _$StatusEnumMap[instance.status]!,
      'role': _$RoleEnumMap[instance.role],
    };

const _$MessageBordTypeEnumMap = {
  MessageBordType.type1: 'type1',
  MessageBordType.type2: 'type2',
  MessageBordType.type3: 'type3',
  MessageBordType.type4: 'type4',
};

const _$StatusEnumMap = {
  Status.edit: 'edit',
  Status.send: 'send',
  Status.preview: 'preview',
};

const _$RoleEnumMap = {
  Role.receiver: 'receiver',
  Role.owner: 'owner',
  Role.participant: 'participant',
};
