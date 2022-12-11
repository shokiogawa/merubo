import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_bord.freezed.dart';

part 'message_bord.g.dart';

enum MessageBordType { type1, type2, type3, type4 }

enum Status { edit, send, preview }

enum Role { receiver, owner, participant }

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class MessageBord with _$MessageBord {

  const factory MessageBord({
    required String id,
    MessageBordType? type,
    String? receiverUserName,
    String? lastMessage,
    String? title,
    @Default(Status.edit) Status status,
    Role? role,
  }) = _MessageBord;

  factory MessageBord.fromJson(Map<String, dynamic> json) =>
      _$MessageBordFromJson(json);
}
