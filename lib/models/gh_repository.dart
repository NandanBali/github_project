
import 'package:github_plus_plus/models/gh_user.dart';

class GHRepository {
  late GHUser owner;
  late String name;
  late Map<String, dynamic> misc_details = {};

  GHRepository.fromJSON(var decodedResponse) {
    // todo: replace with more robust fromJSON for owner
    owner = GHUser(name: decodedResponse["owner"]["login"] as String, handle: decodedResponse["owner"]["login"] as String, avatarURL: decodedResponse["owner"]["avatar_url"]);
    name = decodedResponse["name"] as String;
    misc_details["description"] = decodedResponse["description"];
    misc_details["stars"] = decodedResponse["stargazers_count"];
    misc_details["language"] = decodedResponse["language"];
    misc_details["watchers"] = decodedResponse["watchers_count"];
    misc_details["loc"] = decodedResponse["size"];
  }

}