import 'package:gittrend/models/repository_model.dart';
import 'package:gittrend/models/repository_query_model.dart';
import 'package:gittrend/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class RepositoryQueryBloc {
  final repository = Repository();
  final repositoryQuery = BehaviorSubject<RepositoryQueryModel>();
  final trendingRepositoriesFetcher =
      BehaviorSubject<Future<List<RepositoryModel>>>();

  void fetchRepositoryQuery(RepositoryQueryModel queryModel) {
    repositoryQuery.sink.add(queryModel);
  }

  RepositoryQueryBloc() {
    // repositoryQuery.stream.transform().pipe(trendingRepositoriesFetcher);
  }

  queryTransformer() {}

  dispose() async {
    await repositoryQuery.drain();
    repositoryQuery.close();

    await trendingRepositoriesFetcher.drain();
    trendingRepositoriesFetcher.close();
  }
}
