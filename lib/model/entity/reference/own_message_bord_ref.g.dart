// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_message_bord_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OwnMessageBordRef _$$_OwnMessageBordRefFromJson(Map<String, dynamic> json) =>
    _$_OwnMessageBordRef(
      messageBordRef: json['messageBordRef'],
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

Map<String, dynamic> _$$_OwnMessageBordRefToJson(
        _$_OwnMessageBordRef instance) =>
    <String, dynamic>{
      'messageBordRef': instance.messageBordRef,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.receiver: 'receiver',
  Role.owner: 'owner',
  Role.participant: 'participant',
};
