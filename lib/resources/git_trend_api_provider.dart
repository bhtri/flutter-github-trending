import 'package:dio/dio.dart';
import 'package:gittrend/models/repository_model.dart';

class GitTrendApiProvider {
  Dio dio = Dio();

  Future<List<RepositoryModel>> fetchTrendingRepositories(
    String language,
    String since,
    String spokenLanguage,
  ) async {
    String url =
        'https://ghapi.huchen.dev/repositories?language=$language&since=$since&spoken_language_code=$spokenLanguage';
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      Iterable list = response.data;
      return list.map((json) => RepositoryModel.fromJson(json)).toList();
    }

    throw Exception('Failed to load get');
  }
}
