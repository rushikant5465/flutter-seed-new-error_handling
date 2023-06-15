class User {
  String? name;
  int? id;
  int? age;
  String? address;

  User({
    this.name,
    this.id,
    this.age,
    this.address,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    age = json['age'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['age'] = age;
    data['address'] = address;
    return data;
  }
}
