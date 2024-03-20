class CategoryModel {
  int? id;
  String? name;
  String? details;
  String? repeat;

  CategoryModel({this.id, this.name, this.details, this.repeat});
  CategoryModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    repeat = json['repeat'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['details'] = this.details;
    data['name'] = this.name;
    data['repeat'] = this.repeat;

    return data;
  }
}
