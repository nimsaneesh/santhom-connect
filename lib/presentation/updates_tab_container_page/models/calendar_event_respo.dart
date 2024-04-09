class CalendarEventsRespo {
  String? status;
  List<Null>? metadata;
  List<Data>? data;

  CalendarEventsRespo({this.status, this.metadata, this.data});

  CalendarEventsRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    // if (json['metadata'] != null) {
    //   metadata = <Null>[];
    //   json['metadata'].forEach((v) {
    //     metadata!.add(new Null.fromJson(v));
    //   });
    // }
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
      // data['metadata'] = this.metadata!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? date;
  int? totalEvents;
  int? birthdayEvents;
  int? deathAnniversaryEvents;

  Data(
      {this.date,
      this.totalEvents,
      this.birthdayEvents,
      this.deathAnniversaryEvents});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    totalEvents = json['total_events'];
    birthdayEvents = json['birthday_events'];
    deathAnniversaryEvents = json['death_anniversary_events'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['total_events'] = this.totalEvents;
    data['birthday_events'] = this.birthdayEvents;
    data['death_anniversary_events'] = this.deathAnniversaryEvents;
    return data;
  }
}
