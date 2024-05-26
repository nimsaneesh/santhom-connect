class OrganizationsDetailRespo {
  String? status;
  List<Null>? metadata;
  OrganizationDetailData? data;

  OrganizationsDetailRespo({this.status, this.metadata, this.data});

  OrganizationsDetailRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
 
    data = json['data'] != null ? new OrganizationDetailData.fromJson(json['data']) : null;
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

class OrganizationDetailData {
  Organization? organization;
  List<Members>? members;

  OrganizationDetailData({this.organization, this.members});

  OrganizationDetailData.fromJson(Map<String, dynamic> json) {
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organization {
  int? id;
  String? organizationName;
  String? coordinator;
  dynamic? coordinatorPhoneNumber;

  Organization(
      {this.id,
      this.organizationName,
      this.coordinator,
      this.coordinatorPhoneNumber});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationName = json['organization_name'];
    coordinator = json['coordinator'];
    coordinatorPhoneNumber = json['coordinator_phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['organization_name'] = this.organizationName;
    data['coordinator'] = this.coordinator;
    data['coordinator_phone_number'] = this.coordinatorPhoneNumber;
    return data;
  }
}

class Members {
  int? id;
  String? name;
  dynamic? image;
  int? familyId;
  String? position;
  String? officerPhoneNumber;
  String? familyName;
  String? familyHeadName;
  String? prayerGroupName;
  String? bloodGroupName;
  String? maritalStatusName;
  String? relationshipName;
  String? obituaryId;

  Members(
      {this.id,
      this.name,
      this.image,
      this.familyId,
      this.position,
      this.officerPhoneNumber,
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
    image = json['image'];
    familyId = json['family_id'];
    position = json['position'];
    officerPhoneNumber = json['officer_phone_number'];
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
    data['image'] = this.image;
    data['family_id'] = this.familyId;
    data['position'] = this.position;
    data['officer_phone_number'] = this.officerPhoneNumber;
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
