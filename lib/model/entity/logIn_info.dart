import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merubo/model/entity/user.dart';

part 'logIn_info.freezed.dart';

@freezed
class LoginInfo with _$LoginInfo {
  const factory LoginInfo({
    required bool isLogin,
    required User currentUser
  }) = _LoginInfo;
}