class MedicineModel {
  String? sId;
  String? elderly;
  String? medicinName;
  String? description;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MedicineModel(
      {this.sId,
      this.elderly,
      this.medicinName,
      this.description,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    elderly = json['elderly'];
    medicinName = json['medicinName'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
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
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
