import 'package:isar/isar.dart';

part 'search_query.g.dart';

@Collection()
class SearchQuery {
  late int id;
  late String searchQuery;
  late String queryType;
}