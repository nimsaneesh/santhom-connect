class DirectoryModel {
  String? status;
  Metadata? metadata;
  List<Data>? data;

  DirectoryModel({this.status, this.metadata, this.data});

  DirectoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
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
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
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
  String? item;
  String? image;
  String? subItem;

  Lists({
    this.id,
    this.item,
    this.image,
    this.subItem,
  });

  Lists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    image = json['image'];
    subItem = json['sub_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item'] = this.item;
    data['image'] = this.image;
    data['sub_item'] = this.subItem;

    return data;
  }
}
