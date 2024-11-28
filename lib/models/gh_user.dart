import 'dart:convert';

class GHUser {
  late String name;
  late String handle;
  Map<String, dynamic> details = {};

  GHUser({required this.name, required this.handle, String? avatarURL}) {
    details['avatar'] = avatarURL;
  }

  GHUser.fromJSON({required String json}) {
    var body = jsonDecode(json);
    this.name = body['name'] as String;
    handle = body['handle'] as String;

  }

}