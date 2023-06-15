import 'dart:convert';

UserGoal userGoalFromJson(String str) => UserGoal.fromJson(json.decode(str));
String userGoalToJson(UserGoal data) => json.encode(data.toJson());

class UserGoal {
  Data? data;

  UserGoal({this.data});

  UserGoal.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<SoftSkill>? softSkill;

  Data({this.softSkill});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['softSkill'] != null) {
      softSkill = <SoftSkill>[];
      json['softSkill'].forEach((v) {
        softSkill!.add(SoftSkill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (softSkill != null) {
      data['softSkill'] = softSkill!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SoftSkill {
  String? title;
  Status? status;
  String? id;

  SoftSkill({this.title, this.status, this.id});

  SoftSkill.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    status =
        json['status'] != null ? Status.fromJson(json['status']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Status {
  int? current;
  int? aspiration;
  bool? isSmartGoal;

  Status({this.current, this.aspiration, this.isSmartGoal});

  Status.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    aspiration = json['aspiration'];
    isSmartGoal = json['isSmartGoal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['aspiration'] = aspiration;
    data['isSmartGoal'] = isSmartGoal;
    return data;
  }
}
