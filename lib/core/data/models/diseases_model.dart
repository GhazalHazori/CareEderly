class DiseasesModel {
  String? sId;
  String? diseaseName;
  String? description;
  String? image;
  List<String>? steps;
  List<String>? advice;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? toolImage;

  DiseasesModel(
      {this.sId,
      this.diseaseName,
      this.description,
      this.image,
      this.steps,
      this.advice,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.toolImage});

  DiseasesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    diseaseName = json['diseaseName'];
    description = json['description'];
    image = json['image'];
    steps = json['steps'].cast<String>();
    advice = json['advice'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    toolImage = json['toolImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['diseaseName'] = this.diseaseName;
    data['description'] = this.description;
    data['image'] = this.image;
    data['steps'] = this.steps;
    data['advice'] = this.advice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['toolImage'] = this.toolImage;
    return data;
  }
}
