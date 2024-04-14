class DirectoryFamilyProfileModel {
  String? status;
  Data? data;

  DirectoryFamilyProfileModel({this.status, this.data});

  DirectoryFamilyProfileModel.fromJson(Map<String, dynamic> json) {
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
  List<Members>? members;

  Data({this.family, this.members});

  Data.fromJson(Map<String, dynamic> json) {
    family =
        json['family'] != null ? new Family.fromJson(json['family']) : null;
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
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
  dynamic id;
  dynamic familyCode;
  dynamic familyName;
  dynamic prayerGroupId;
  dynamic address1;
  dynamic address2;
  dynamic postOffice;
  dynamic pincode;
  dynamic mapLocation;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic familyHeadName;
  dynamic prayerGroupName;

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
      this.prayerGroupName});

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
    return data;
  }
}

class Members {
  dynamic id;
  dynamic name;
  dynamic relationshipId;
  dynamic familyId;
  dynamic image;
  dynamic familyName;
  dynamic familyHeadName;
  dynamic prayerGroupName;
  dynamic bloodGroupName;
  dynamic maritalStatusName;
  dynamic relationshipName;
  dynamic obituaryId;

  Members(
      {this.id,
      this.name,
      this.relationshipId,
      this.familyId,
      this.image,
      this.familyName,
      this.familyHeadName,
      this.prayerGroupName,
      this.bloodGroupName,
      this.maritalStatusName,
      this.relationshipName,
      this.obituaryId});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    relationshipId = json['relationship_id'];
    familyId = json['family_id'];
    image = json['image'];
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
    data['name'] = this.name;
    data['relationship_id'] = this.relationshipId;
    data['family_id'] = this.familyId;
    data['image'] = this.image;
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
