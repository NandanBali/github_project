import 'package:flutter/material.dart';
import 'package:github_plus_plus/components/standard_card.dart';
import 'package:github_plus_plus/controller/github_data_controller.dart';
import 'package:github_plus_plus/models/gh_repository.dart';
import 'package:github_plus_plus/models/gh_user.dart';
import 'package:github_plus_plus/globals.dart' as globals;
import 'package:github_plus_plus/view/repository/repository_view.dart';
import 'package:github_plus_plus/view/user/user_view.dart';
import 'package:logger/logger.dart';

// todo: use streams for lazy loading
class ResultsFetcher {
  var logger = Logger();

  String _iTok(int i) {
    double x;
    if (i > 1000000) {
      x = double.parse((i / 1000000).toStringAsFixed(1));
      return "${x}m";
    } else if (i > 1000 && i < 1000000) {
      x = double.parse((i / 1000).toStringAsFixed(1));
      return "${x}k";
    } else {
      x = double.parse(i.toStringAsFixed(0));
      return "$x";
    }
  }

  Widget _generateUserResultWidget(GHUser user) {

    logger.d(user.name);
    return StandardCard(
        routeDestination: UserView(user: user),
        innerContainer: Container(
          child: Row(
            children: [
              CircleAvatar(foregroundImage: NetworkImage(user.details["avatar"]),),
              SizedBox(width: 16.0,),
              Flexible(child: Text(user.name)),
            ],
          ),
        ));
  }

  Widget _generateRepoResultWidget(GHRepository repo) {
    logger.d(repo.name);
    return StandardCard(
      routeDestination: RepositoryView(repository: repo), 
        innerContainer: Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(repo.owner.details["avatar"]),
                radius: 8.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                repo.owner.name,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0, width: double.infinity),
          // title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              repo.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(height: 4.0, width: double.infinity),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              repo.misc_details["description"] == null
                  ? "No description provided"
                  : repo.misc_details["description"],
              style: repo.misc_details["description"] == null
                  ? TextStyle(fontStyle: FontStyle.italic)
                  : TextStyle(),
            ),
          ),

          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 16.0,
                  ),
                  SizedBox(width: 2.0),
                  Text(_iTok(repo.misc_details["stars"]), style: TextStyle(fontWeight: FontWeight.w300),),
                ],
              ),
              const SizedBox(
                width: 16.0,
              ),
              Row(
                children: [
                  Text(
                    "${repo.misc_details["language"]}",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(
                width: 16.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.code,
                    weight: 0.1,
                  ),
                  Text(
                    " ${_iTok(repo.misc_details["loc"])} lines",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }

  Future<List<Widget>> getUserResultWidgets(String searchQuery) async {
    List<Widget> l = [];
    for (GHUser ghUser
        in await GithubDataController(authToken: globals.github_creds)
            .searchUsers(searchQuery: searchQuery) as List<GHUser>) {
      print(ghUser.handle);

      l.add(_generateUserResultWidget(ghUser));
    }
    return l;
  }

  Future<List<Widget>> getReposResultWidgets(String searchQuery) async {
    List<Widget> l = [];
    for (GHRepository ghRepository
        in await GithubDataController(authToken: globals.github_creds)
                .searchRepositories(searchQuery: searchQuery)
            as List<GHRepository>) {
      l.add(_generateRepoResultWidget(ghRepository));
      logger.d("${l.length}");
    }
    logger.d(l.length);
    return l;
  }
}
