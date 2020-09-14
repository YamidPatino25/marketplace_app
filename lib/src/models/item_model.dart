class ItemModel {
  String _title;
  String _img;


  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['title'].length);
    _title = parsedJson['title'];
    _img = parsedJson['url'];

  }

  String get title => _title;


}


