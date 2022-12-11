// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_bord_with_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageBordWithMessage {
  MessageBord get messageBord => throw _privateConstructorUsedError;
  Message get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageBordWithMessageCopyWith<MessageBordWithMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageBordWithMessageCopyWith<$Res> {
  factory $MessageBordWithMessageCopyWith(MessageBordWithMessage value,
          $Res Function(MessageBordWithMessage) then) =
      _$MessageBordWithMessageCopyWithImpl<$Res, MessageBordWithMessage>;
  @useResult
  $Res call({MessageBord messageBord, Message messages});

  $MessageBordCopyWith<$Res> get messageBord;
  $MessageCopyWith<$Res> get messages;
}

/// @nodoc
class _$MessageBordWithMessageCopyWithImpl<$Res,
        $Val extends MessageBordWithMessage>
    implements $MessageBordWithMessageCopyWith<$Res> {
  _$MessageBordWithMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageBord = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messageBord: null == messageBord
          ? _value.messageBord
          : messageBord // ignore: cast_nullable_to_non_nullable
              as MessageBord,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Message,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageBordCopyWith<$Res> get messageBord {
    return $MessageBordCopyWith<$Res>(_value.messageBord, (value) {
      return _then(_value.copyWith(messageBord: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get messages {
    return $MessageCopyWith<$Res>(_value.messages, (value) {
      return _then(_value.copyWith(messages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageBordWithMessageCopyWith<$Res>
    implements $MessageBordWithMessageCopyWith<$Res> {
  factory _$$_MessageBordWithMessageCopyWith(_$_MessageBordWithMessage value,
          $Res Function(_$_MessageBordWithMessage) then) =
      __$$_MessageBordWithMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MessageBord messageBord, Message messages});

  @override
  $MessageBordCopyWith<$Res> get messageBord;
  @override
  $MessageCopyWith<$Res> get messages;
}

/// @nodoc
class __$$_MessageBordWithMessageCopyWithImpl<$Res>
    extends _$MessageBordWithMessageCopyWithImpl<$Res,
        _$_MessageBordWithMessage>
    implements _$$_MessageBordWithMessageCopyWith<$Res> {
  __$$_MessageBordWithMessageCopyWithImpl(_$_MessageBordWithMessage _value,
      $Res Function(_$_MessageBordWithMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageBord = null,
    Object? messages = null,
  }) {
    return _then(_$_MessageBordWithMessage(
      messageBord: null == messageBord
          ? _value.messageBord
          : messageBord // ignore: cast_nullable_to_non_nullable
              as MessageBord,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }
}

/// @nodoc

class _$_MessageBordWithMessage implements _MessageBordWithMessage {
  const _$_MessageBordWithMessage(
      {required this.messageBord, required this.messages});

  @override
  final MessageBord messageBord;
  @override
  final Message messages;

  @override
  String toString() {
    return 'MessageBordWithMessage(messageBord: $messageBord, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageBordWithMessage &&
            (identical(other.messageBord, messageBord) ||
                other.messageBord == messageBord) &&
            (identical(other.messages, messages) ||
                other.messages == messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageBord, messages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageBordWithMessageCopyWith<_$_MessageBordWithMessage> get copyWith =>
      __$$_MessageBordWithMessageCopyWithImpl<_$_MessageBordWithMessage>(
          this, _$identity);
}

abstract class _MessageBordWithMessage implements MessageBordWithMessage {
  const factory _MessageBordWithMessage(
      {required final MessageBord messageBord,
      required final Message messages}) = _$_MessageBordWithMessage;

  @override
  MessageBord get messageBord;
  @override
  Message get messages;
  @override
  @JsonKey(ignore: true)
  _$$_MessageBordWithMessageCopyWith<_$_MessageBordWithMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
