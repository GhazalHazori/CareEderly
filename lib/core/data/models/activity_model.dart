class ActivityModel {
  String? sId;
  String? elderly;
  String? activityName;
  String? description;
  String? endDate;
  int? repeat;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ActivityModel(
      {this.sId,
      this.elderly,
      this.activityName,
      this.description,
      this.endDate,
      this.repeat,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    elderly = json['elderly'];
    activityName = json['activityName'];
    description = json['description'];
    endDate = json['endDate'];
    repeat = json['repeat'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['elderly'] = this.elderly;
    data['activityName'] = this.activityName;
    data['description'] = this.description;
    data['endDate'] = this.endDate;
    data['repeat'] = this.repeat;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
