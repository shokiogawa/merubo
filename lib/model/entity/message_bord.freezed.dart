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
  String? get id => throw _privateConstructorUsedError;
  MessageBordType? get type => throw _privateConstructorUsedError;
  String? get receiverUserName => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  Status? get status => throw _privateConstructorUsedError;
  Role? get role => throw _privateConstructorUsedError;
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
      {String? id,
      MessageBordType? type,
      String? receiverUserName,
      String? lastMessage,
      String? title,
      Status? status,
      Role? role,
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
    Object? id = freezed,
    Object? type = freezed,
    Object? receiverUserName = freezed,
    Object? lastMessage = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? role = freezed,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageBordType?,
      receiverUserName: freezed == receiverUserName
          ? _value.receiverUserName
          : receiverUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
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
      {String? id,
      MessageBordType? type,
      String? receiverUserName,
      String? lastMessage,
      String? title,
      Status? status,
      Role? role,
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
    Object? id = freezed,
    Object? type = freezed,
    Object? receiverUserName = freezed,
    Object? lastMessage = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? role = freezed,
    Object? messages = null,
  }) {
    return _then(_$_MessageBord(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageBordType?,
      receiverUserName: freezed == receiverUserName
          ? _value.receiverUserName
          : receiverUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageBord with DiagnosticableTreeMixin implements _MessageBord {
  const _$_MessageBord(
      {this.id,
      this.type,
      this.receiverUserName,
      this.lastMessage,
      this.title,
      this.status,
      this.role,
      final List<Message> messages = const []})
      : _messages = messages;

  factory _$_MessageBord.fromJson(Map<String, dynamic> json) =>
      _$$_MessageBordFromJson(json);

  @override
  final String? id;
  @override
  final MessageBordType? type;
  @override
  final String? receiverUserName;
  @override
  final String? lastMessage;
  @override
  final String? title;
  @override
  final Status? status;
  @override
  final Role? role;
  final List<Message> _messages;
  @override
  @JsonKey()
  List<Message> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageBord(id: $id, type: $type, receiverUserName: $receiverUserName, lastMessage: $lastMessage, title: $title, status: $status, role: $role, messages: $messages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageBord'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('receiverUserName', receiverUserName))
      ..add(DiagnosticsProperty('lastMessage', lastMessage))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('messages', messages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageBord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.receiverUserName, receiverUserName) ||
                other.receiverUserName == receiverUserName) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      receiverUserName,
      lastMessage,
      title,
      status,
      role,
      const DeepCollectionEquality().hash(_messages));

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
      {final String? id,
      final MessageBordType? type,
      final String? receiverUserName,
      final String? lastMessage,
      final String? title,
      final Status? status,
      final Role? role,
      final List<Message> messages}) = _$_MessageBord;

  factory _MessageBord.fromJson(Map<String, dynamic> json) =
      _$_MessageBord.fromJson;

  @override
  String? get id;
  @override
  MessageBordType? get type;
  @override
  String? get receiverUserName;
  @override
  String? get lastMessage;
  @override
  String? get title;
  @override
  Status? get status;
  @override
  Role? get role;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_MessageBordCopyWith<_$_MessageBord> get copyWith =>
      throw _privateConstructorUsedError;
}
