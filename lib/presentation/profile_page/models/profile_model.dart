import '../../../core/app_export.dart';

class ProfileModel {
  String? status;
  List<Null>? metadata;
  Data? data;

  ProfileModel({this.status, this.metadata, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    // if (json['metadata'] != null) {
    //   metadata = <Null>[];
    //   json['metadata'].forEach((v) {
    //     metadata!.add(new Null.fromJson(v));
    //   });
    // }
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    // if (this.metadata != null) {
    //   data['metadata'] = this.metadata!.map((v) => v.toJson()).toList();
    // }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Member? member;

  Data({this.member});

  Data.fromJson(Map<String, dynamic> json) {
    member =
        json['member'] != null ? new Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.member != null) {
      data['member'] = this.member!.toJson();
    }
    return data;
  }
}

class Member {
  int? id;
  Null? title;
  String? name;
  Null? nickname;
  int? familyId;
  int? headOfFamily;
  String? gender;
  String? dob;
  Null? dateOfBaptism;
  Null? bloodGroupId;
  Null? maritalStatusId;
  Null? dateOfMarriage;
  int? relationshipId;
  Null? qualification;
  Null? occupation;
  Null? companyName;
  String? email;
  Null? mobile;
  Null? altContactNo;
  Null? dateOfDeath;
  String? image;
  int? status;
  int? userType;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? familyName;
  String? familyHeadName;
  String? prayerGroupName;
  String? bloodGroupName;
  String? maritalStatusName;
  String? relationshipName;

  Member(
      {this.id,
      this.title,
      this.name,
      this.nickname,
      this.familyId,
      this.headOfFamily,
      this.gender,
      this.dob,
      this.dateOfBaptism,
      this.bloodGroupId,
      this.maritalStatusId,
      this.dateOfMarriage,
      this.relationshipId,
      this.qualification,
      this.occupation,
      this.companyName,
      this.email,
      this.mobile,
      this.altContactNo,
      this.dateOfDeath,
      this.image,
      this.status,
      this.userType,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.familyName,
      this.familyHeadName,
      this.prayerGroupName,
      this.bloodGroupName,
      this.maritalStatusName,
      this.relationshipName});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    name = json['name'];
    nickname = json['nickname'];
    familyId = json['family_id'];
    headOfFamily = json['head_of_family'];
    gender = json['gender'];
    dob = json['dob'];
    dateOfBaptism = json['date_of_baptism'];
    bloodGroupId = json['blood_group_id'];
    maritalStatusId = json['marital_status_id'];
    dateOfMarriage = json['date_of_marriage'];
    relationshipId = json['relationship_id'];
    qualification = json['qualification'];
    occupation = json['occupation'];
    companyName = json['company_name'];
    email = json['email'];
    mobile = json['mobile'];
    altContactNo = json['alt_contact_no'];
    dateOfDeath = json['date_of_death'];
    image = json['image'];
    status = json['status'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    familyName = json['family_name'];
    familyHeadName = json['family_head_name'];
    prayerGroupName = json['prayer_group_name'];
    bloodGroupName = json['blood_group_name'];
    maritalStatusName = json['marital_status_name'];
    relationshipName = json['relationship_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['family_id'] = this.familyId;
    data['head_of_family'] = this.headOfFamily;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['date_of_baptism'] = this.dateOfBaptism;
    data['blood_group_id'] = this.bloodGroupId;
    data['marital_status_id'] = this.maritalStatusId;
    data['date_of_marriage'] = this.dateOfMarriage;
    data['relationship_id'] = this.relationshipId;
    data['qualification'] = this.qualification;
    data['occupation'] = this.occupation;
    data['company_name'] = this.companyName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['alt_contact_no'] = this.altContactNo;
    data['date_of_death'] = this.dateOfDeath;
    data['image'] = this.image;
    data['status'] = this.status;
    data['user_type'] = this.userType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['family_name'] = this.familyName;
    data['family_head_name'] = this.familyHeadName;
    data['prayer_group_name'] = this.prayerGroupName;
    data['blood_group_name'] = this.bloodGroupName;
    data['marital_status_name'] = this.maritalStatusName;
    data['relationship_name'] = this.relationshipName;
    return data;
  }
}
