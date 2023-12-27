import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'xm_user.freezed.dart';
part 'xm_user.g.dart';

@freezed
class XMUser with _$XMUser {
  
  const factory XMUser({
    required String id,
    required String name,
    required String avatar,
  }) = _XMUser;

  factory XMUser.fromJson(Map<String, Object?> json)
      => _$XMUserFromJson(json); 

}