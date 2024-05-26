class MyFamilyModel {
  String? status;
  Data? data;

  MyFamilyModel({this.status, this.data});

  MyFamilyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Family? family;
  List<Memebers>? members;

  Data({this.family, this.members});

  Data.fromJson(Map<String, dynamic> json) {
    family =
        json['family'] != null ? new Family.fromJson(json['family']) : null;
    if (json['members'] != null) {
      members = <Memebers>[];
      json['members'].forEach((v) {
        members!.add(new Memebers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.family != null) {
      data['family'] = this.family!.toJson();
    }
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Family {
  int? id;
  dynamic familyCode;
  dynamic familyName;
  int? prayerGroupId;
  dynamic address1;
  dynamic address2;
  dynamic postOffice;
  dynamic pincode;
  dynamic mapLocation;
  dynamic? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic familyHeadName;
  dynamic prayerGroupName;
  dynamic familyHeadImage;

  Family(
      {this.id,
      this.familyCode,
      this.familyName,
      this.prayerGroupId,
      this.address1,
      this.address2,
      this.postOffice,
      this.pincode,
      this.mapLocation,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.familyHeadName,
      this.prayerGroupName,
      this.familyHeadImage});

  Family.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    familyCode = json['family_code'];
    familyName = json['family_name'];
    prayerGroupId = json['prayer_group_id'];
    address1 = json['address1'];
    address2 = json['address2'];
    postOffice = json['post_office'];
    pincode = json['pincode'];
    mapLocation = json['map_location'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    familyHeadName = json['family_head_name'];
    prayerGroupName = json['prayer_group_name'];
    familyHeadImage = json['family_head_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['family_code'] = this.familyCode;
    data['family_name'] = this.familyName;
    data['prayer_group_id'] = this.prayerGroupId;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['post_office'] = this.postOffice;
    data['pincode'] = this.pincode;
    data['map_location'] = this.mapLocation;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['family_head_name'] = this.familyHeadName;
    data['prayer_group_name'] = this.prayerGroupName;
    data['family_head_image'] = this.familyHeadImage;
    return data;
  }
}

class Memebers {
  int? id;
  dynamic? title;
  dynamic? name;
  dynamic? nickname;
  dynamic? familyId;
  dynamic? headOfFamily;
  dynamic? gender;
  dynamic? dob;
  dynamic? dateOfBaptism;
  dynamic? bloodGroupId;
  dynamic? maritalStatusId;
  dynamic? remark;
  dynamic? marrMembId;
  dynamic? dateOfMarriage;
  dynamic? relationshipId;
  dynamic? qualification;
  dynamic? occupation;
  dynamic? companyName;
  dynamic? email;
  dynamic? mobile;
  dynamic? altContactNo;
  dynamic? dateOfDeath;
  dynamic? image;
  dynamic? status;
  dynamic? userType;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? deletedAt;
  dynamic? familyName;
  dynamic? familyHeadName;
  dynamic? prayerGroupName;
  dynamic? bloodGroupName;
  dynamic? maritalStatusName;
  dynamic? relationshipName;
  dynamic? obituaryId;

  Memebers(
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
      this.remark,
      this.marrMembId,
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
      this.relationshipName,
      this.obituaryId});

  Memebers.fromJson(Map<String, dynamic> json) {
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
    remark = json['remark'];
    marrMembId = json['marr_memb_id'];
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
    obituaryId = json['obituary_id'];
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
    data['remark'] = this.remark;
    data['marr_memb_id'] = this.marrMembId;
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
    data['obituary_id'] = this.obituaryId;
    return data;
  }
}
