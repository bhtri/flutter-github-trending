import 'package:dio/dio.dart';
import 'package:gittrend/models/repository_model.dart';

class GitTrendApiProvider {
  Dio dio = Dio();

  Future<List<RepositoryModel>> fetchTrendingRepositories(
    String language,
    String since,
    String spokenLanguage,
  ) async {
    try {
      // https://github.com/huchenme/github-trending-api/issues/130#issuecomment-706741619
      String url =
          'https://hackertab.pupubird.com/repositories?language=$language&since=$since&spoken_language_code=$spokenLanguage';
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        Iterable list = response.data;
        return list.map((json) => RepositoryModel.fromJson(json)).toList();
      }

      throw Exception('Failed to load get');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
