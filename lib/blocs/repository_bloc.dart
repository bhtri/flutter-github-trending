import 'package:gittrend/models/chart_model.dart';
import 'package:gittrend/models/repository_model.dart';
import 'package:gittrend/resources/repository.dart';
import 'package:rxdart/subjects.dart';

class RepositoriesBloc {
  final repository = Repository();
  final trendingRepositoriesFetcher =
      BehaviorSubject<Future<List<RepositoryModel>>>();

  Stream<Future<List<RepositoryModel>>> get trendingRepositories =>
      trendingRepositoriesFetcher.stream;

  void fetchTrendingRepositories(ChartModel chartModel) {
    if (chartModel.type == 0) {
      trendingRepositoriesFetcher.sink.add(
        repository.fetchTrendingRepositories(
          '',
          chartModel.since.toString().split('.').last,
          '',
        ),
      );
    }
  }

  dispose() async {
    await trendingRepositoriesFetcher.drain();
    trendingRepositoriesFetcher.close();
  }
}
