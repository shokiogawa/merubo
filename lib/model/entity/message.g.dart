// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      userName: json['userName'] as String,
      content: json['content'] as String,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'content': instance.content,
      'thumbnail': instance.thumbnail,
    };
