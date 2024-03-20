class UserModel {
  String? sId;
  String? email;
  String? firstname;
  String? lastname;
  String? phnumber;
  bool? isAdmin;
  int? age;
  List<String>? diseases;
  String? image;
  bool? verified;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.sId,
      this.email,
      this.firstname,
      this.lastname,
      this.phnumber,
      this.isAdmin,
      this.age,
      this.diseases,
      this.image,
      this.verified,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phnumber = json['phnumber'];
    isAdmin = json['isAdmin'];
    age = json['age'];
    diseases = json['diseases'].cast<String>();
    image = json['image'];
    verified = json['verified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phnumber'] = this.phnumber;
    data['isAdmin'] = this.isAdmin;
    data['age'] = this.age;
    data['diseases'] = this.diseases;
    data['image'] = this.image;
    data['verified'] = this.verified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
