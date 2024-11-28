import 'package:github_plus_plus/controller/caching/search_query.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class SearchCaching {
  late Future<Isar> db;
  var logger = Logger();

  SearchCaching() {
    db = initializeIsar();
  }

  Future<Isar> initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.openAsync(schemas: [SearchQuerySchema], directory: dir.path);
  }

  Future<void> cacheQuery(String searchQuery, String queryType) async {
    final isar = await db;
    final newQuery = SearchQuery()
      ..id = isar.searchQuerys.autoIncrement()
      ..searchQuery = searchQuery
      ..queryType = queryType;
    await isar.writeAsync((isar) async {
      isar.searchQuerys.put(newQuery);
    });
  }

  Future<void> removeQuery(int Id) async {
    final isar = await db;
    await isar.writeAsync((isar) async {
      isar.searchQuerys.delete(Id);
    });
  }

  Stream<List<SearchQuery>> getQueriesStream() async* {
    final isar = await db;
    yield* isar.searchQuerys.where().watch(fireImmediately: true);
  }

}
