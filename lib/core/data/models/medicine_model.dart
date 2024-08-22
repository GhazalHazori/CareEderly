class MedicineModel {
  String? sId;
  String? elderly;
  String? medicinName;
  String? description;
  String? endDate;
  int? repeat;
  bool? enableNotification;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MedicineModel(
      {this.sId,
      this.elderly,
      this.medicinName,
      this.description,
      this.endDate,
      this.repeat,
      this.enableNotification,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    elderly = json['elderly'];
    medicinName = json['medicinName'];
    description = json['description'];
    endDate = json['endDate'];
    repeat = json['repeat'];
    enableNotification = json['EnableNotification'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['elderly'] = this.elderly;
    data['medicinName'] = this.medicinName;
    data['description'] = this.description;
    data['endDate'] = this.endDate;
    data['repeat'] = this.repeat;
    data['EnableNotification'] = this.enableNotification;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
