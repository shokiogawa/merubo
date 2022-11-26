import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default("") String displayName,
    @Default("") String email,
    @Default("") String phoneNumber
  }) = _User;
}