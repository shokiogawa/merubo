import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:merubo/model/entity/message_bord.dart';

part 'own_message_bord_ref.freezed.dart';
part 'own_message_bord_ref.g.dart';
// firestoreの情報を許容する。
@freezed
class OwnMessageBordRef with _$OwnMessageBordRef {
  const factory OwnMessageBordRef({
    required DocumentReference<Map<String, dynamic>> messageBordRef,
    required Role role
}) = _OwnMessageBordRef;
  factory OwnMessageBordRef.fromJson(Map<String, dynamic> json) =>
      _$OwnMessageBordRefFromJson(json);
}

