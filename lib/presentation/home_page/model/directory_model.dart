class DirectoryModel {
  String? status;

  List<Data>? data;

  DirectoryModel({this.status, this.data});

  DirectoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  FamilyMetadata? familyMetadata;
  FamilyMetadata? membersMetadata;
  PrayerGroupMetadata? prayerGroupMetadata;
  PrayerGroupMetadata? organizationMetadata;

  Metadata(
      {this.familyMetadata,
      this.membersMetadata,
      this.prayerGroupMetadata,
      this.organizationMetadata});

  Metadata.fromJson(Map<String, dynamic> json) {
    familyMetadata = json['family_metadata'] != null
        ? new FamilyMetadata.fromJson(json['family_metadata'])
        : null;
    membersMetadata = json['members_metadata'] != null
        ? new FamilyMetadata.fromJson(json['members_metadata'])
        : null;
    prayerGroupMetadata = json['prayer_group_metadata'] != null
        ? new PrayerGroupMetadata.fromJson(json['prayer_group_metadata'])
        : null;
    organizationMetadata = json['organization_metadata'] != null
        ? new PrayerGroupMetadata.fromJson(json['organization_metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.familyMetadata != null) {
      data['family_metadata'] = this.familyMetadata!.toJson();
    }
    if (this.membersMetadata != null) {
      data['members_metadata'] = this.membersMetadata!.toJson();
    }
    if (this.prayerGroupMetadata != null) {
      data['prayer_group_metadata'] = this.prayerGroupMetadata!.toJson();
    }
    if (this.organizationMetadata != null) {
      data['organization_metadata'] = this.organizationMetadata!.toJson();
    }
    return data;
  }
}

class FamilyMetadata {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? nextPageUrl;
  Null? prevPageUrl;
  int? from;
  int? to;

  FamilyMetadata(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to});

  FamilyMetadata.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['next_page_url'] = this.nextPageUrl;
    data['prev_page_url'] = this.prevPageUrl;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class PrayerGroupMetadata {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  Null? nextPageUrl;
  Null? prevPageUrl;
  int? from;
  int? to;

  PrayerGroupMetadata(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to});

  PrayerGroupMetadata.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['next_page_url'] = this.nextPageUrl;
    data['prev_page_url'] = this.prevPageUrl;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class Data {
  String? category;
  List<Lists>? list;

  Data({this.category, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['list'] != null) {
      list = <Lists>[];
      json['list'].forEach((v) {
        list!.add(new Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  int? id;
  dynamic? item;
  dynamic? subItem;
  dynamic? image;
  dynamic? type;
  dynamic? familyHeadName;
  dynamic? prayerGroupName;
  dynamic? familyHeadImage;
  dynamic? familyId;
  dynamic? familyName;
  dynamic? bloodGroupName;
  dynamic? maritalStatusName;
  dynamic? relationshipName;
  dynamic obituaryId;

  Lists(
      {this.id,
      this.item,
      this.subItem,
      this.image,
      this.type,
      this.familyHeadName,
      this.prayerGroupName,
      this.familyHeadImage,
      this.familyId,
      this.familyName,
      this.bloodGroupName,
      this.maritalStatusName,
      this.relationshipName,
      this.obituaryId});

  Lists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    subItem = json['sub_item'];
    image = json['image'];
    type = json['type'];
    familyHeadName = json['family_head_name'];
    prayerGroupName = json['prayer_group_name'];
    familyHeadImage = json['family_head_image'];
    familyId = json['family_id'];
    familyName = json['family_name'];
    bloodGroupName = json['blood_group_name'];
    maritalStatusName = json['marital_status_name'];
    relationshipName = json['relationship_name'];
    obituaryId = json['obituary_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item'] = this.item;
    data['sub_item'] = this.subItem;
    data['image'] = this.image;
    data['type'] = this.type;
    data['family_head_name'] = this.familyHeadName;
    data['prayer_group_name'] = this.prayerGroupName;
    data['family_head_image'] = this.familyHeadImage;
    data['family_id'] = this.familyId;
    data['family_name'] = this.familyName;
    data['blood_group_name'] = this.bloodGroupName;
    data['marital_status_name'] = this.maritalStatusName;
    data['relationship_name'] = this.relationshipName;
    data['obituary_id'] = this.obituaryId;
    return data;
  }
}
//   }
// class Lists {
//   int? id;
//   String? item;
//   String? image;
//   String? subItem;
//   String? type;
//   String? link;

//   Lists({
//     this.id,
//     this.item,
//     this.image,
//     this.subItem,
//     this.type,
//     this.link,
//   });

//   Lists.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     item = json['item'];
//     image = json['image'];
//     subItem = json['sub_item'];
//     type = json['type'];
//     link = json['link'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['item'] = this.item;
//     data['image'] = this.image;
//     data['sub_item'] = this.subItem;
//     data['type'] = this.type;
//     data['link'] = this.link;

//     return data;
//   }
// }
