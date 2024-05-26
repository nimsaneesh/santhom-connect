class UpdatesTabContainerModel {
  String? status;
  UpdateData? data;

  UpdatesTabContainerModel({this.status, this.data});

  UpdatesTabContainerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? new UpdateData.fromJson(json['data']) : null;
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

class UpdateData {
  int? numberOfEvents;
  List<CalenderEvents>? events;

  UpdateData({this.numberOfEvents, this.events});

  UpdateData.fromJson(Map<String, dynamic> json) {
    numberOfEvents = json['number_of_events'];
    if (json['events'] != null) {
      events = <CalenderEvents>[];
      json['events'].forEach((v) {
        events!.add(new CalenderEvents.fromJson(v));
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

class CalenderEvents {
  dynamic type;
  List<EventList>? list;

  CalenderEvents({this.type, this.list});

  CalenderEvents.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['list'] != null) {
      list = <EventList>[];
      json['list'].forEach((v) {
        list!.add(new EventList.fromJson(v));
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

class EventList {
  int? id;
  String? heading;
  String? subHeading;
  String? date;
  String? image;
  int? familyId;
  String? familyName;
  String? familyHeadName;
  String? prayerGroupName;
  String? bloodGroupName;
  String? maritalStatusName;
  String? relationshipName;
  String? obituaryId;

  EventList(
      {this.id,
      this.heading,
      this.subHeading,
      this.date,
      this.image,
      this.familyId,
      this.familyName,
      this.familyHeadName,
      this.prayerGroupName,
      this.bloodGroupName,
      this.maritalStatusName,
      this.relationshipName,
      this.obituaryId});

  EventList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    subHeading = json['sub_heading'];
    date = json['date'];
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
    data['heading'] = this.heading;
    data['sub_heading'] = this.subHeading;
    data['date'] = this.date;
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
