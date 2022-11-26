import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String displayName,
    required String email,
    required String phoneNumber
  }) = _User;
}