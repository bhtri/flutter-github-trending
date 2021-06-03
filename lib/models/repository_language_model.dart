class RepositoryLanguageModel {
  String urlParam;
  String color;
  String name;

  RepositoryLanguageModel({
    this.name = 'All',
    this.color = '',
    this.urlParam = '',
  });

  factory RepositoryLanguageModel.fromJson(Map<String, dynamic> json) {
    return RepositoryLanguageModel(
      name: json['name'],
      color: json['color'],
      urlParam: json['urlParam'],
    );
  }
}
