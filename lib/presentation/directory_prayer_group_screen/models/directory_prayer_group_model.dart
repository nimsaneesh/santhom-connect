class DirectoryPrayerGroupModel {
  String? status;
  Data? data;

  DirectoryPrayerGroupModel({this.status, this.data});

  DirectoryPrayerGroupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['metadata'] != null) {}
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
  PrayerGroup? prayerGroup;
  List<Members>? members;

  Data({this.prayerGroup, this.members});

  Data.fromJson(Map<String, dynamic> json) {
    prayerGroup = json['prayer_group'] != null
        ? new PrayerGroup.fromJson(json['prayer_group'])
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
    if (this.prayerGroup != null) {
      data['prayer_group'] = this.prayerGroup!.toJson();
    }
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrayerGroup {
  dynamic id;
  dynamic groupName;
  dynamic leader;
  dynamic leaderPhoneNumber;

  PrayerGroup({this.id, this.groupName, this.leader, this.leaderPhoneNumber});

  PrayerGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['group_name'];
    leader = json['leader'];
    leaderPhoneNumber = json['leader_phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_name'] = this.groupName;
    data['leader'] = this.leader;
    data['leader_phone_number'] = this.leaderPhoneNumber;
    return data;
  }
}

class Members {
  dynamic id;
  dynamic name;
  dynamic image;
  dynamic familyId;
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
      this.image,
      this.familyId,
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
