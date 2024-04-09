class ContributionRespo {
  String? status;
  Metadata? metadata;
  ContributionData? data;

  ContributionRespo({this.status, this.metadata, this.data});

  ContributionRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    data = json['data'] != null
        ? new ContributionData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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

class ContributionData {
  Family? family;
  int? total;
  List<Payments>? payments;

  ContributionData({this.family, this.total, this.payments});

  ContributionData.fromJson(Map<String, dynamic> json) {
    family =
        json['family'] != null ? new Family.fromJson(json['family']) : null;
    total = json['total'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.family != null) {
      data['family'] = this.family!.toJson();
    }
    data['total'] = this.total;
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Family {
  int? id;
  String? familyCode;
  String? familyName;
  String? familyHeadName;
  String? prayerGroupName;

  Family(
      {this.id,
      this.familyCode,
      this.familyName,
      this.familyHeadName,
      this.prayerGroupName});

  Family.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    familyCode = json['family_code'];
    familyName = json['family_name'];
    familyHeadName = json['family_head_name'];
    prayerGroupName = json['prayer_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['family_code'] = this.familyCode;
    data['family_name'] = this.familyName;
    data['family_head_name'] = this.familyHeadName;
    data['prayer_group_name'] = this.prayerGroupName;
    return data;
  }
}

class Payments {
  int? id;
  int? memberId;
  String? member;
  String? purpose;
  String? date;
  int? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Payments(
      {this.id,
      this.memberId,
      this.member,
      this.purpose,
      this.date,
      this.amount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    member = json['member'];
    purpose = json['purpose'];
    date = json['date'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['member'] = this.member;
    data['purpose'] = this.purpose;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
