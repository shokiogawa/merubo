import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merubo/model/entity/message_bord.dart';

import 'message.dart';

part 'message_bord_with_messages.freezed.dart';


// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class MessageBordWithMessages with _$MessageBordWithMessages {
  const factory MessageBordWithMessages({
    required MessageBord messageBord,
    @Default([])List<Message> messages,
  }) = _MessageBordWithMessages;

}