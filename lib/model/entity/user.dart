import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    @Default("") String displayName,
    @Default("") String email,
    @Default("") String phoneNumber
  }) = _User;
}