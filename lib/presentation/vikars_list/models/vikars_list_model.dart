class VikarsListRespo {
  String? status;
  Metadata? metadata;
  List<VikarsListData>? data;

  VikarsListRespo({this.status, this.metadata, this.data});

  VikarsListRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <VikarsListData>[];
      json['data'].forEach((v) {
        data!.add(new VikarsListData.fromJson(v));
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

class VikarsListData {
  int? id;
  int? memberId;
  String? title;
  String? name;
  String? familyName;
  String? dob;
  String? designation;
  String? dateOfJoining;
  String? dateOfRelieving;
  String? email;
  String? mobile;
  String? photo;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  VikarsListData(
      {this.id,
      this.memberId,
      this.title,
      this.name,
      this.familyName,
      this.dob,
      this.designation,
      this.dateOfJoining,
      this.dateOfRelieving,
      this.email,
      this.mobile,
      this.photo,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  VikarsListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    title = json['title'];
    name = json['name'];
    familyName = json['family_name'];
    dob = json['dob'];
    designation = json['designation'];
    dateOfJoining = json['date_of_joining'];
    dateOfRelieving = json['date_of_relieving'];
    email = json['email'];
    mobile = json['mobile'];
    photo = json['photo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['title'] = this.title;
    data['name'] = this.name;
    data['family_name'] = this.familyName;
    data['dob'] = this.dob;
    data['designation'] = this.designation;
    data['date_of_joining'] = this.dateOfJoining;
    data['date_of_relieving'] = this.dateOfRelieving;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['photo'] = this.photo;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
