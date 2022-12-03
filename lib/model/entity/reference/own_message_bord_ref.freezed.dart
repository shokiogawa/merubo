// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'own_message_bord_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OwnMessageBordRef _$OwnMessageBordRefFromJson(Map<String, dynamic> json) {
  return _OwnMessageBordRef.fromJson(json);
}

/// @nodoc
mixin _$OwnMessageBordRef {
  DocumentReference<Map<String, dynamic>> get messageBordRef => throw _privateConstructorUsedError;

  Role get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OwnMessageBordRefCopyWith<OwnMessageBordRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnMessageBordRefCopyWith<$Res> {
  factory $OwnMessageBordRefCopyWith(
          OwnMessageBordRef value, $Res Function(OwnMessageBordRef) then) =
      _$OwnMessageBordRefCopyWithImpl<$Res, OwnMessageBordRef>;

  @useResult
  $Res call({DocumentReference<Map<String, dynamic>> messageBordRef, Role role});
}

/// @nodoc
class _$OwnMessageBordRefCopyWithImpl<$Res, $Val extends OwnMessageBordRef>
    implements $OwnMessageBordRefCopyWith<$Res> {
  _$OwnMessageBordRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageBordRef = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      messageBordRef: null == messageBordRef
          ? _value.messageBordRef
          : messageBordRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Map<String, dynamic>>,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OwnMessageBordRefCopyWith<$Res>
    implements $OwnMessageBordRefCopyWith<$Res> {
  factory _$$_OwnMessageBordRefCopyWith(_$_OwnMessageBordRef value,
          $Res Function(_$_OwnMessageBordRef) then) =
      __$$_OwnMessageBordRefCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({DocumentReference<Map<String, dynamic>> messageBordRef, Role role});
}

/// @nodoc
class __$$_OwnMessageBordRefCopyWithImpl<$Res>
    extends _$OwnMessageBordRefCopyWithImpl<$Res, _$_OwnMessageBordRef>
    implements _$$_OwnMessageBordRefCopyWith<$Res> {
  __$$_OwnMessageBordRefCopyWithImpl(
      _$_OwnMessageBordRef _value, $Res Function(_$_OwnMessageBordRef) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageBordRef = null,
    Object? role = null,
  }) {
    return _then(_$_OwnMessageBordRef(
      messageBordRef: null == messageBordRef
          ? _value.messageBordRef
          : messageBordRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Map<String, dynamic>>,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OwnMessageBordRef implements _OwnMessageBordRef {
  const _$_OwnMessageBordRef(
      {required this.messageBordRef, required this.role});

  factory _$_OwnMessageBordRef.fromJson(Map<String, dynamic> json) =>
      _$$_OwnMessageBordRefFromJson(json);

  @override
  final DocumentReference<Map<String, dynamic>> messageBordRef;
  @override
  final Role role;

  @override
  String toString() {
    return 'OwnMessageBordRef(messageBordRef: $messageBordRef, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OwnMessageBordRef &&
            const DeepCollectionEquality()
                .equals(other.messageBordRef, messageBordRef) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(messageBordRef), role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OwnMessageBordRefCopyWith<_$_OwnMessageBordRef> get copyWith =>
      __$$_OwnMessageBordRefCopyWithImpl<_$_OwnMessageBordRef>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OwnMessageBordRefToJson(
      this,
    );
  }
}

abstract class _OwnMessageBordRef implements OwnMessageBordRef {
  const factory _OwnMessageBordRef(
      {required final DocumentReference<Map<String, dynamic>> messageBordRef,
      required final Role role}) = _$_OwnMessageBordRef;

  factory _OwnMessageBordRef.fromJson(Map<String, dynamic> json) =
      _$_OwnMessageBordRef.fromJson;

  @override
  DocumentReference<Map<String, dynamic>> get messageBordRef;

  @override
  Role get role;

  @override
  @JsonKey(ignore: true)
  _$$_OwnMessageBordRefCopyWith<_$_OwnMessageBordRef> get copyWith =>
      throw _privateConstructorUsedError;
}
