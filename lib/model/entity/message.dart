import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';
@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    String? userName,
    String? content,
    String? voiceMessage,
    String? thumbnail,
    String? image
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
