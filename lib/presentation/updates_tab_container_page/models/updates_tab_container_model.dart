class UpdatesTabContainerModel {
  String? status;
  Metadata? metadata;
  Data? data;

  UpdatesTabContainerModel({this.status, this.metadata, this.data});

  UpdatesTabContainerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  BirthdaysMetadata? birthdaysMetadata;
  ObituaryMetadata? obituaryMetadata;

  Metadata({this.birthdaysMetadata, this.obituaryMetadata});

  Metadata.fromJson(Map<String, dynamic> json) {
    birthdaysMetadata = json['birthdays_metadata'] != null
        ? new BirthdaysMetadata.fromJson(json['birthdays_metadata'])
        : null;
    obituaryMetadata = json['obituary_metadata'] != null
        ? new ObituaryMetadata.fromJson(json['obituary_metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.birthdaysMetadata != null) {
      data['birthdays_metadata'] = this.birthdaysMetadata!.toJson();
    }
    if (this.obituaryMetadata != null) {
      data['obituary_metadata'] = this.obituaryMetadata!.toJson();
    }
    return data;
  }
}

class BirthdaysMetadata {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  Null? nextPageUrl;
  Null? prevPageUrl;
  int? from;
  int? to;

  BirthdaysMetadata(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to});

  BirthdaysMetadata.fromJson(Map<String, dynamic> json) {
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

class ObituaryMetadata {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? nextPageUrl;
  String? prevPageUrl;
  Null? from;
  Null? to;

  ObituaryMetadata(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to});

  ObituaryMetadata.fromJson(Map<String, dynamic> json) {
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
  int? numberOfEvents;
  List<Events>? events;

  Data({this.numberOfEvents, this.events});

  Data.fromJson(Map<String, dynamic> json) {
    numberOfEvents = json['number_of_events'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number_of_events'] = this.numberOfEvents;
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? type;
  List<Lists>? list;

  Events({this.type, this.list});

  Events.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['list'] != null) {
      list = <Lists>[];
      json['list'].forEach((v) {
        list!.add(new Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  int? id;
  String? name;
  String? dob;
  int? familyId;
  String? familyName;
  String? familyHeadName;
  String? prayerGroupName;
  String? bloodGroupName;
  String? maritalStatusName;
  String? relationshipName;
  String? obituaryId;

  Lists(
      {this.id,
      this.name,
      this.dob,
      this.familyId,
      this.familyName,
      this.familyHeadName,
      this.prayerGroupName,
      this.bloodGroupName,
      this.maritalStatusName,
      this.relationshipName,
      this.obituaryId});

  Lists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dob = json['dob'];
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
    data['dob'] = this.dob;
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
