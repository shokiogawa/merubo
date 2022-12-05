// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_bord_with_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageBordWithMessages {
  MessageBord get messageBord => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageBordWithMessagesCopyWith<MessageBordWithMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageBordWithMessagesCopyWith<$Res> {
  factory $MessageBordWithMessagesCopyWith(MessageBordWithMessages value,
          $Res Function(MessageBordWithMessages) then) =
      _$MessageBordWithMessagesCopyWithImpl<$Res, MessageBordWithMessages>;
  @useResult
  $Res call({MessageBord messageBord, List<Message> messages});

  $MessageBordCopyWith<$Res> get messageBord;
}

/// @nodoc
class _$MessageBordWithMessagesCopyWithImpl<$Res,
        $Val extends MessageBordWithMessages>
    implements $MessageBordWithMessagesCopyWith<$Res> {
  _$MessageBordWithMessagesCopyWithImpl(this._value, this._then);

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
              as List<Message>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageBordCopyWith<$Res> get messageBord {
    return $MessageBordCopyWith<$Res>(_value.messageBord, (value) {
      return _then(_value.copyWith(messageBord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageBordWithMessagesCopyWith<$Res>
    implements $MessageBordWithMessagesCopyWith<$Res> {
  factory _$$_MessageBordWithMessagesCopyWith(_$_MessageBordWithMessages value,
          $Res Function(_$_MessageBordWithMessages) then) =
      __$$_MessageBordWithMessagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MessageBord messageBord, List<Message> messages});

  @override
  $MessageBordCopyWith<$Res> get messageBord;
}

/// @nodoc
class __$$_MessageBordWithMessagesCopyWithImpl<$Res>
    extends _$MessageBordWithMessagesCopyWithImpl<$Res,
        _$_MessageBordWithMessages>
    implements _$$_MessageBordWithMessagesCopyWith<$Res> {
  __$$_MessageBordWithMessagesCopyWithImpl(_$_MessageBordWithMessages _value,
      $Res Function(_$_MessageBordWithMessages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageBord = null,
    Object? messages = null,
  }) {
    return _then(_$_MessageBordWithMessages(
      messageBord: null == messageBord
          ? _value.messageBord
          : messageBord // ignore: cast_nullable_to_non_nullable
              as MessageBord,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$_MessageBordWithMessages implements _MessageBordWithMessages {
  const _$_MessageBordWithMessages(
      {required this.messageBord, final List<Message> messages = const []})
      : _messages = messages;

  @override
  final MessageBord messageBord;
  final List<Message> _messages;
  @override
  @JsonKey()
  List<Message> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessageBordWithMessages(messageBord: $messageBord, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageBordWithMessages &&
            (identical(other.messageBord, messageBord) ||
                other.messageBord == messageBord) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, messageBord, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageBordWithMessagesCopyWith<_$_MessageBordWithMessages>
      get copyWith =>
          __$$_MessageBordWithMessagesCopyWithImpl<_$_MessageBordWithMessages>(
              this, _$identity);
}

abstract class _MessageBordWithMessages implements MessageBordWithMessages {
  const factory _MessageBordWithMessages(
      {required final MessageBord messageBord,
      final List<Message> messages}) = _$_MessageBordWithMessages;

  @override
  MessageBord get messageBord;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_MessageBordWithMessagesCopyWith<_$_MessageBordWithMessages>
      get copyWith => throw _privateConstructorUsedError;
}
