class VikarsListDetailsRespo {
  String? status;
  List<Null>? metadata;
  Data? data;

  VikarsListDetailsRespo({this.status, this.metadata, this.data});

  VikarsListDetailsRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    // if (json['metadata'] != null) {
    //   metadata = <Null>[];
    //   json['metadata'].forEach((v) {
    //     metadata!.add(new Null.fromJson(v));
    //   });
    // }
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    // if (this.metadata != null) {
    //   data['metadata'] = this.metadata!.map((v) => v.toJson()).toList();
    // }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Vicar? vicar;
  List<PersonalDetails>? personalDetails;

  Data({this.vicar, this.personalDetails});

  Data.fromJson(Map<String, dynamic> json) {
    vicar = json['vicar'] != null ? new Vicar.fromJson(json['vicar']) : null;
    if (json['personal_details'] != null) {
      personalDetails = <PersonalDetails>[];
      json['personal_details'].forEach((v) {
        personalDetails!.add(new PersonalDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vicar != null) {
      data['vicar'] = this.vicar!.toJson();
    }
    if (this.personalDetails != null) {
      data['personal_details'] =
          this.personalDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vicar {
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

  Vicar(
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

  Vicar.fromJson(Map<String, dynamic> json) {
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

class PersonalDetails {
  int? memberId;
  String? gender;
  String? dob;
  String? email;
  String? image;
  String? familyCode;
  String? familyName;
  String? address1;
  int? familyId;
  String? familyHeadName;
  String? prayerGroupName;
  String? bloodGroupName;
  String? maritalStatusName;
  String? relationshipName;
  String? obituaryId;

  PersonalDetails(
      {this.memberId,
      this.gender,
      this.dob,
      this.email,
      this.image,
      this.familyCode,
      this.familyName,
      this.address1,
      this.familyId,
      this.familyHeadName,
      this.prayerGroupName,
      this.bloodGroupName,
      this.maritalStatusName,
      this.relationshipName,
      this.obituaryId});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    gender = json['gender'];
    dob = json['dob'];
    email = json['email'];
    image = json['image'];
    familyCode = json['family_code'];
    familyName = json['family_name'];
    address1 = json['address1'];
    familyId = json['family_id'];
    familyHeadName = json['family_head_name'];
    prayerGroupName = json['prayer_group_name'];
    bloodGroupName = json['blood_group_name'];
    maritalStatusName = json['marital_status_name'];
    relationshipName = json['relationship_name'];
    obituaryId = json['obituary_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['image'] = this.image;
    data['family_code'] = this.familyCode;
    data['family_name'] = this.familyName;
    data['address1'] = this.address1;
    data['family_id'] = this.familyId;
    data['family_head_name'] = this.familyHeadName;
    data['prayer_group_name'] = this.prayerGroupName;
    data['blood_group_name'] = this.bloodGroupName;
    data['marital_status_name'] = this.maritalStatusName;
    data['relationship_name'] = this.relationshipName;
    data['obituary_id'] = this.obituaryId;
    return data;
  }
}
