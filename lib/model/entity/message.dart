import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';
@freezed
class Message with _$Message {
  const factory Message({
    String? id,
    String? userName,
    String? content,
    String? voiceMessage,
    String? thumbnail
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
