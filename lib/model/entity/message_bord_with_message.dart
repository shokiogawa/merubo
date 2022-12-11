import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merubo/model/entity/message_bord.dart';

import 'message.dart';

part 'message_bord_with_message.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class MessageBordWithMessage with _$MessageBordWithMessage {
  const factory MessageBordWithMessage({
    required MessageBord messageBord,
    required Message messages,
  }) = _MessageBordWithMessage;
}
