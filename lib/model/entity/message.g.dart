// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String,
      userName: json['userName'] as String?,
      content: json['content'] as String?,
      voiceMessage: json['voiceMessage'] as String?,
      thumbnail: json['thumbnail'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'content': instance.content,
      'voiceMessage': instance.voiceMessage,
      'thumbnail': instance.thumbnail,
      'image': instance.image,
    };
