import 'package:gittrend/models/repository_model.dart';
import 'package:gittrend/resources/git_trend_api_provider.dart';

class Repository {
  final GitTrendApiProvider gitTrendApiProvider = GitTrendApiProvider();

  Future<List<RepositoryModel>> fetchTrendingRepositories(
          String language, String since, String spokenLanguageCode) =>
      gitTrendApiProvider.fetchTrendingRepositories(
          language, since, spokenLanguageCode);
}
