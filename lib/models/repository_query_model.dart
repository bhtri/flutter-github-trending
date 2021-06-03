import 'package:gittrend/models/repository_language_model.dart';

class RepositoryQueryModel {
  Since _since = Since.daily;
  late RepositoryLanguageModel _language;

  set since(since) => _since = since;
  set language(language) => _language = language;

  Since get since => _since;
  RepositoryLanguageModel get language => _language;
}

enum Since {
  daily,
  weekly,
  monthly,
}
