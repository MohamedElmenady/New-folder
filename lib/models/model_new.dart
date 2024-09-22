class ModelNew {
  String? auther;
  String? title;
  String? image;

  ModelNew.formJson({required Map<String, dynamic> data}) {
    auther = data['author'];
    title = data['title'];
    image = data['urlToImage'];
  }
}
