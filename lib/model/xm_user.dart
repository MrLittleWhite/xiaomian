import 'package:isar/isar.dart';

part 'xm_user.g.dart';

@embedded
class XMUser {
  String? uId;
  String? name;

  XMUser({this.uId, this.name});

  XMUser.fromJson(Map<String, dynamic> json) {
    uId = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = uId;
    data['name'] = name;
    return data;
  }
}
