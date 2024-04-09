class BulletinModel {
  String? status;
  Metadata? metadata;
  List<Data>? data;

  BulletinModel({this.status, this.metadata, this.data});

  BulletinModel.fromJson(Map<String, dynamic> json) {
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
  EventsMetadata? eventsMetadata;
  EventsMetadata? newsAnnouncementsMetadata;
  EventsMetadata? notificationsMetadata;
  EventsMetadata? vicarMessagesMetadata;
  EventsMetadata? obituariesMetadata;

  Metadata(
      {this.eventsMetadata,
      this.newsAnnouncementsMetadata,
      this.notificationsMetadata,
      this.vicarMessagesMetadata,
      this.obituariesMetadata});

  Metadata.fromJson(Map<String, dynamic> json) {
    eventsMetadata = json['events_metadata'] != null
        ? new EventsMetadata.fromJson(json['events_metadata'])
        : null;
    newsAnnouncementsMetadata = json['newsAnnouncements_metadata'] != null
        ? new EventsMetadata.fromJson(json['newsAnnouncements_metadata'])
        : null;
    notificationsMetadata = json['notifications_metadata'] != null
        ? new EventsMetadata.fromJson(json['notifications_metadata'])
        : null;
    vicarMessagesMetadata = json['VicarMessages_metadata'] != null
        ? new EventsMetadata.fromJson(json['VicarMessages_metadata'])
        : null;
    obituariesMetadata = json['obituaries_metadata'] != null
        ? new EventsMetadata.fromJson(json['obituaries_metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventsMetadata != null) {
      data['events_metadata'] = this.eventsMetadata!.toJson();
    }
    if (this.newsAnnouncementsMetadata != null) {
      data['newsAnnouncements_metadata'] =
          this.newsAnnouncementsMetadata!.toJson();
    }
    if (this.notificationsMetadata != null) {
      data['notifications_metadata'] = this.notificationsMetadata!.toJson();
    }
    if (this.vicarMessagesMetadata != null) {
      data['VicarMessages_metadata'] = this.vicarMessagesMetadata!.toJson();
    }
    if (this.obituariesMetadata != null) {
      data['obituaries_metadata'] = this.obituariesMetadata!.toJson();
    }
    return data;
  }
}

class EventsMetadata {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? nextPageUrl;
  String? prevPageUrl;
  int? from;
  int? to;

  EventsMetadata(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to});

  EventsMetadata.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? item;
  String? subItem;
  String? details;
  String? image;
  // String? type;
  // Null? groupOrgId;
  // String? groupOrganizationName;

  Lists({
    this.id,
    this.date,
    this.item,
    this.subItem,
    this.details,
    this.image,
    // this.type,
    // this.groupOrgId,
    // this.groupOrganizationName
  });

  Lists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    item = json['item'];
    subItem = json['sub_item'];
    details = json['details'];
    image = json['image'];
    // type = json['type'];
    // groupOrgId = json['group_org_id'];
    // groupOrganizationName = json['group_organization_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['item'] = this.item;
    data['sub_item'] = this.subItem;
    data['details'] = this.details;
    data['image'] = this.image;
    // data['type'] = this.type;
    // data['group_org_id'] = this.groupOrgId;
    // data['group_organization_name'] = this.groupOrganizationName;
    return data;
  }
}
