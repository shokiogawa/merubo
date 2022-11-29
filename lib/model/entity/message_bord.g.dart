// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_bord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageBord _$$_MessageBordFromJson(Map<String, dynamic> json) =>
    _$_MessageBord(
      id: json['id'] as String,
      type: $enumDecode(_$MessageBordTypeEnumMap, json['type']),
      receiverUserName: json['receiverUserName'] as String,
      lastMessage: json['lastMessage'] as String,
      title: json['title'] as String,
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MessageBordToJson(_$_MessageBord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MessageBordTypeEnumMap[instance.type]!,
      'receiverUserName': instance.receiverUserName,
      'lastMessage': instance.lastMessage,
      'title': instance.title,
      'messages': instance.messages,
    };

const _$MessageBordTypeEnumMap = {
  MessageBordType.type1: 'type1',
  MessageBordType.type2: 'type2',
  MessageBordType.type3: 'type3',
  MessageBordType.type4: 'type4',
};
