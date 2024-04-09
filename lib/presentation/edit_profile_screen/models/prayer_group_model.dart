class PrayerGroupRespo {
  String? status;
  Metadata? metadata;
  List<PrayerGroupData>? data;

  PrayerGroupRespo({this.status, this.metadata, this.data});

  PrayerGroupRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <PrayerGroupData>[];
      json['data'].forEach((v) {
        data!.add(new PrayerGroupData.fromJson(v));
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
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  Null? nextPageUrl;
  Null? prevPageUrl;
  int? from;
  int? to;

  Metadata(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to});

  Metadata.fromJson(Map<String, dynamic> json) {
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

class PrayerGroupData {
  int? id;
  String? groupName;
  String? leader;
  String? leaderPhoneNumber;

  PrayerGroupData({this.id, this.groupName, this.leader, this.leaderPhoneNumber});

  PrayerGroupData.fromJson(Map<String, dynamic> json) {
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
