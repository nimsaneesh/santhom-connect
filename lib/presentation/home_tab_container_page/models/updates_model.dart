class UpdatesModel {
  String? status;
  Metadata? metadata;
  List<Data>? data;
  DailyDigest? dailyDigest;

  UpdatesModel({this.status, this.metadata, this.data, this.dailyDigest});

  UpdatesModel.fromJson(Map<String, dynamic> json) {
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
    dailyDigest = json['DailyDigest'] != null
        ? new DailyDigest.fromJson(json['DailyDigest'])
        : null;
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
    if (this.dailyDigest != null) {
      data['DailyDigest'] = this.dailyDigest!.toJson();
    }
    return data;
  }
}

class Metadata {
  DaiySchedulesMetadata? daiySchedulesMetadata;
  EventsMetadata? eventsMetadata;
  EventsMetadata? birthdaysMetadata;
  EventsMetadata? obituaryMetadata;

  Metadata(
      {this.daiySchedulesMetadata,
      this.eventsMetadata,
      this.birthdaysMetadata,
      this.obituaryMetadata});

  Metadata.fromJson(Map<String, dynamic> json) {
    daiySchedulesMetadata = json['daiy_schedules_metadata'] != null
        ? new DaiySchedulesMetadata.fromJson(json['daiy_schedules_metadata'])
        : null;
    eventsMetadata = json['events_metadata'] != null
        ? new EventsMetadata.fromJson(json['events_metadata'])
        : null;
    birthdaysMetadata = json['birthdays_metadata'] != null
        ? new EventsMetadata.fromJson(json['birthdays_metadata'])
        : null;
    obituaryMetadata = json['obituary_metadata'] != null
        ? new EventsMetadata.fromJson(json['obituary_metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.daiySchedulesMetadata != null) {
      data['daiy_schedules_metadata'] = this.daiySchedulesMetadata!.toJson();
    }
    if (this.eventsMetadata != null) {
      data['events_metadata'] = this.eventsMetadata!.toJson();
    }
    if (this.birthdaysMetadata != null) {
      data['birthdays_metadata'] = this.birthdaysMetadata!.toJson();
    }
    if (this.obituaryMetadata != null) {
      data['obituary_metadata'] = this.obituaryMetadata!.toJson();
    }
    return data;
  }
}

class DaiySchedulesMetadata {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? nextPageUrl;
  String? prevPageUrl;
  int? from;
  int? to;

  DaiySchedulesMetadata(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.nextPageUrl,
      this.prevPageUrl,
      this.from,
      this.to});

  DaiySchedulesMetadata.fromJson(Map<String, dynamic> json) {
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
  List<ItemList>? list;

  Data({this.category, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['list'] != null) {
      list = <ItemList>[];
      json['list'].forEach((v) {
        list!.add(new ItemList.fromJson(v));
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

class ItemList {
  int? id;
  String? heading;
  String? subHeading;
  String? date;
  String? image;
  String? memoryDayTypeName;

  ItemList(
      {this.id,
      this.heading,
      this.subHeading,
      this.date,
      this.image,
      this.memoryDayTypeName});

  ItemList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    subHeading = json['sub_heading'];
    date = json['date'];
    image = json['image'];
    memoryDayTypeName = json['memory_day_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['sub_heading'] = this.subHeading;
    data['date'] = this.date;
    data['image'] = this.image;
    data['memory_day_type_name'] = this.memoryDayTypeName;
    return data;
  }
}

class DailyDigest {
  int? id;
  String? heading;
  String? subHeading;

  DailyDigest({this.id, this.heading, this.subHeading});

  DailyDigest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    subHeading = json['sub_heading'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['sub_heading'] = this.subHeading;
    return data;
  }
}
