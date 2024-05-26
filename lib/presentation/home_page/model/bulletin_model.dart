class BulletinModel {
  String? status;
  List<Data>? data;

  BulletinModel({this.status, this.data});

  BulletinModel.fromJson(Map<String, dynamic> json) {
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
  dynamic type;
  // Null? groupOrgId;
  // String? groupOrganizationName;

  Lists({
    this.id,
    this.date,
    this.item,
    this.subItem,
    this.details,
    this.image,
    this.type,
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
    type = json['type_value'];
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
    data['type_value'] = this.type;
    // data['group_org_id'] = this.groupOrgId;
    // data['group_organization_name'] = this.groupOrganizationName;
    return data;
  }
}
