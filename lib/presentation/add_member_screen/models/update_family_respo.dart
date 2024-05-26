class UpdateFamilyRespo {
  String? status;
  UpdateData? data;
  UpdateFamilyRespo({this.status, this.data});
  UpdateFamilyRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new UpdateData.fromJson(json['data']) : null;
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

class UpdateData {
  String? messsage;
  Family? family;

  UpdateData({this.messsage, this.family});

  UpdateData.fromJson(Map<String, dynamic> json) {
    messsage = json['messsage'];
    family =
        json['family'] != null ? new Family.fromJson(json['family']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messsage'] = this.messsage;
    if (this.family != null) {
      data['family'] = this.family!.toJson();
    }
    return data;
  }
}

class Family {
  int? id;
  String? familyCode;
  String? familyName;
  String? prayerGroupId;
  String? address1;
  String? address2;
  String? postOffice;
  String? pincode;
  String? mapLocation;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? familyHeadName;
  String? prayerGroupName;

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
