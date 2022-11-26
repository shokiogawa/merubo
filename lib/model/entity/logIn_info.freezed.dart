// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'logIn_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginInfo {
  bool get isLogin => throw _privateConstructorUsedError;
  User get currentUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginInfoCopyWith<LoginInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInfoCopyWith<$Res> {
  factory $LoginInfoCopyWith(LoginInfo value, $Res Function(LoginInfo) then) =
      _$LoginInfoCopyWithImpl<$Res, LoginInfo>;
  @useResult
  $Res call({bool isLogin, User currentUser});

  $UserCopyWith<$Res> get currentUser;
}

/// @nodoc
class _$LoginInfoCopyWithImpl<$Res, $Val extends LoginInfo>
    implements $LoginInfoCopyWith<$Res> {
  _$LoginInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
    Object? currentUser = null,
  }) {
    return _then(_value.copyWith(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get currentUser {
    return $UserCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginInfoCopyWith<$Res> implements $LoginInfoCopyWith<$Res> {
  factory _$$_LoginInfoCopyWith(
          _$_LoginInfo value, $Res Function(_$_LoginInfo) then) =
      __$$_LoginInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLogin, User currentUser});

  @override
  $UserCopyWith<$Res> get currentUser;
}

/// @nodoc
class __$$_LoginInfoCopyWithImpl<$Res>
    extends _$LoginInfoCopyWithImpl<$Res, _$_LoginInfo>
    implements _$$_LoginInfoCopyWith<$Res> {
  __$$_LoginInfoCopyWithImpl(
      _$_LoginInfo _value, $Res Function(_$_LoginInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
    Object? currentUser = null,
  }) {
    return _then(_$_LoginInfo(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_LoginInfo implements _LoginInfo {
  const _$_LoginInfo({required this.isLogin, required this.currentUser});

  @override
  final bool isLogin;
  @override
  final User currentUser;

  @override
  String toString() {
    return 'LoginInfo(isLogin: $isLogin, currentUser: $currentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginInfo &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLogin, currentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginInfoCopyWith<_$_LoginInfo> get copyWith =>
      __$$_LoginInfoCopyWithImpl<_$_LoginInfo>(this, _$identity);
}

abstract class _LoginInfo implements LoginInfo {
  const factory _LoginInfo(
      {required final bool isLogin,
      required final User currentUser}) = _$_LoginInfo;

  @override
  bool get isLogin;
  @override
  User get currentUser;
  @override
  @JsonKey(ignore: true)
  _$$_LoginInfoCopyWith<_$_LoginInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
