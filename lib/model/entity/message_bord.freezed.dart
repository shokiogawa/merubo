// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_bord.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageBord _$MessageBordFromJson(Map<String, dynamic> json) {
  return _MessageBord.fromJson(json);
}

/// @nodoc
mixin _$MessageBord {
  MessageBordType get type => throw _privateConstructorUsedError;
  String get receiverUserName => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageBordCopyWith<MessageBord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageBordCopyWith<$Res> {
  factory $MessageBordCopyWith(
          MessageBord value, $Res Function(MessageBord) then) =
      _$MessageBordCopyWithImpl<$Res, MessageBord>;
  @useResult
  $Res call(
      {MessageBordType type,
      String receiverUserName,
      String lastMessage,
      List<Message> messages});
}

/// @nodoc
class _$MessageBordCopyWithImpl<$Res, $Val extends MessageBord>
    implements $MessageBordCopyWith<$Res> {
  _$MessageBordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? receiverUserName = null,
    Object? lastMessage = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageBordType,
      receiverUserName: null == receiverUserName
          ? _value.receiverUserName
          : receiverUserName // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageBordCopyWith<$Res>
    implements $MessageBordCopyWith<$Res> {
  factory _$$_MessageBordCopyWith(
          _$_MessageBord value, $Res Function(_$_MessageBord) then) =
      __$$_MessageBordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MessageBordType type,
      String receiverUserName,
      String lastMessage,
      List<Message> messages});
}

/// @nodoc
class __$$_MessageBordCopyWithImpl<$Res>
    extends _$MessageBordCopyWithImpl<$Res, _$_MessageBord>
    implements _$$_MessageBordCopyWith<$Res> {
  __$$_MessageBordCopyWithImpl(
      _$_MessageBord _value, $Res Function(_$_MessageBord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? receiverUserName = null,
    Object? lastMessage = null,
    Object? messages = null,
  }) {
    return _then(_$_MessageBord(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageBordType,
      receiverUserName: null == receiverUserName
          ? _value.receiverUserName
          : receiverUserName // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageBord implements _MessageBord {
  const _$_MessageBord(
      {required this.type,
      required this.receiverUserName,
      required this.lastMessage,
      final List<Message> messages = const []})
      : _messages = messages;

  factory _$_MessageBord.fromJson(Map<String, dynamic> json) =>
      _$$_MessageBordFromJson(json);

  @override
  final MessageBordType type;
  @override
  final String receiverUserName;
  @override
  final String lastMessage;
  final List<Message> _messages;
  @override
  @JsonKey()
  List<Message> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessageBord(type: $type, receiverUserName: $receiverUserName, lastMessage: $lastMessage, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageBord &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.receiverUserName, receiverUserName) ||
                other.receiverUserName == receiverUserName) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, receiverUserName,
      lastMessage, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageBordCopyWith<_$_MessageBord> get copyWith =>
      __$$_MessageBordCopyWithImpl<_$_MessageBord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageBordToJson(
      this,
    );
  }
}

abstract class _MessageBord implements MessageBord {
  const factory _MessageBord(
      {required final MessageBordType type,
      required final String receiverUserName,
      required final String lastMessage,
      final List<Message> messages}) = _$_MessageBord;

  factory _MessageBord.fromJson(Map<String, dynamic> json) =
      _$_MessageBord.fromJson;

  @override
  MessageBordType get type;
  @override
  String get receiverUserName;
  @override
  String get lastMessage;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_MessageBordCopyWith<_$_MessageBord> get copyWith =>
      throw _privateConstructorUsedError;
}
