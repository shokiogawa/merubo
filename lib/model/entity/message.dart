import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';
@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String userName,
    required String content,
    String? thumbnail
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
