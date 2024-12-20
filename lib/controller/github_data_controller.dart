import 'dart:convert';
import 'dart:math';

import 'package:github_plus_plus/models/gh_repository.dart';
import 'package:github_plus_plus/models/gh_user.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class GithubDataController {

  late Map<String, String> stdHeaders;

  var logger = Logger();

  GithubDataController() {
    this.stdHeaders = {
      "Accept": "application/vnd.github+json",
      "X-GitHub-Api-Version": "2022-11-28",
    };
  }

  Future<List<GHUser>> searchUsers({required String searchQuery}) async {
    List<GHUser> l = [];

    http.Response response = await http.get(
        Uri.parse("https://api.github.com/search/users?q=${searchQuery}"),
        headers: this.stdHeaders
    );
    print(response.body);
    var resBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("decoding ${resBody["total_count"]}");
      for (int i = 0; i < 10; i++) {
        var userBody = resBody["items"][i];
        GHUser user = GHUser(
            name: userBody["login"],
            handle: userBody["login"],
            avatarURL: userBody["avatar_url"]);
        print("Here 1");
        user.details["followers"] = 20;
        print("Here 2 $i");
        l.add(user);
      }
    }
    return l;
  }

  Future<int> _getNumberOfFollowers(String followers_uri) async {
    http.Response response = await http.get(Uri.parse(followers_uri), headers: stdHeaders);
    if(response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.length;
    } else {
      return 0;
    }
  }

  Future<List<GHRepository>> searchRepositories({required String searchQuery}) async {
    List<GHRepository> repos = <GHRepository>[];
    print("Fetching");
    http.Response response = await http.get(Uri.parse("https://api.github.com/search/repositories?q=$searchQuery"), headers: stdHeaders);
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      try {
        print(data["total_count"]);
        for(int i = 0; i < 20 && i < data["total_count"]; i++) {
          try {
            repos.add(GHRepository.fromJSON(data["items"][i]));
            logger.d("Added ${repos[i].name}");
          } catch (e) {
            print(e);
          }
        }
      } catch(e) {
        print("Stuffx");
        print(e);
      }
    }
    logger.d("Added all to ${repos.toString()}");
    return repos;
  }

  Future<String> getRepositoryReadme(GHRepository repo) async {
    String s = "";
    http.Response response = await http.get(
      Uri.parse("https://api.github.com/repos/${repo.owner.name}/${repo.name}/readme"),
      headers: {
        "Accept": "application/vnd.github.html+json",
        "X-GitHub-Api-Version": "2022-11-28",
      },
    );
    if(response.statusCode == 200) {
      return response.body.toString();

    } else {
      logger.d("Status code: ${response.statusCode.toString()}");
    }
    return s;
  }

  Future<Map<String, String>> fetchRepositoryFiles(GHRepository repository) async {
    Map<String, String> fileLinks = {};
    http.Response response = await http.get(
      Uri.parse("https://api.github.com/repos/${repository.owner.name}/${repository.name}/contents/"),
      headers: stdHeaders,
    );

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for(var file in data as List) {
        fileLinks[file["path"] as String] = file["url"] as String;
        logger.d("${file["path"]}: ${file["url"]}");
      }
    } else {
      logger.d("Broke");
    }
    repository.misc_details["files"] = fileLinks;
    logger.d("done");
    return fileLinks;
  }

  Future<String> fetchFile(String fileURL) async {
    String fileText;
    http.Response response = await http.get(
      Uri.parse(fileURL),
      headers: {
        "Accept": "application/vnd.github.html+json",
        "X-GitHub-Api-Version": "2022-11-28",
      },
    );
    if(response.statusCode == 200) {
      fileText = response.body;
    } else {
      fileText = "Failed to fetch";
    }
    return fileText;
  }

  Future<List<GHRepository>> fetchUserRepositories(GHUser user) async {
    List<GHRepository> list = [];
    http.Response response = await http.get(
      Uri.parse("https://api.github.com/users/${user.name}/repos"),
      headers: stdHeaders,
    );
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for(var repo in data as List<dynamic>) {
        try {
          // repos.add(GHRepository.fromJSON(data["items"][i]));
          list.add(GHRepository.fromJSON(repo));
          logger.d("Added ${repo["name"]}");
        } catch (e) {
          print(e);
        }
      }
    } else {
      logger.d("Couldn't fetch");
    }
    return list;
  }
}
