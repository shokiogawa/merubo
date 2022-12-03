import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merubo/model/entity/message.dart';

part 'message_bord.freezed.dart';

part 'message_bord.g.dart';

enum MessageBordType { type1, type2, type3, type4 }
enum Status {edited, send}

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class MessageBord with _$MessageBord {
  const factory MessageBord({
    String? id,
    MessageBordType? type,
    String? receiverUserName,
    String? lastMessage,
    String? title,
    Status? status,
    @Default([]) List<Message> messages,
  }) = _MessageBord;

  factory MessageBord.fromJson(Map<String, dynamic> json) =>
      _$MessageBordFromJson(json);
}
