class UserProfileModel {
  bool? success;
  String? message;
  Data? data;

  UserProfileModel({this.success, this.message, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? contact;
  String? profilePicture;
  List<dynamic>? document;
  String? role;
  String? fcmToken;
  bool? isActive;
  bool? isDelete;
  String? status;
  Validation? validation;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<dynamic>? shifts;

  Data(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.contact,
      this.profilePicture,
      this.document,
      this.role,
      this.fcmToken,
      this.isActive,
      this.isDelete,
      this.status,
      this.validation,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.shifts});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    contact = json['contact'];
    profilePicture = json['profilePicture'];

    document =
        json['document'] != null ? List<dynamic>.from(json['document']) : null;

    role = json['role'];
    fcmToken = json['fcmToken'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    status = json['status'];
    validation = json['validation'] != null
        ? Validation.fromJson(json['validation'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];

    shifts = json['shifts'] != null ? List<dynamic>.from(json['shifts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['contact'] = contact;
    data['profilePicture'] = profilePicture;

    if (document != null) {
      data['document'] = document;
    }

    data['role'] = role;
    data['fcmToken'] = fcmToken;
    data['isActive'] = isActive;
    data['isDelete'] = isDelete;
    data['status'] = status;

    if (validation != null) {
      data['validation'] = validation!.toJson();
    }

    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;

    if (shifts != null) {
      data['shifts'] = shifts;
    }

    return data;
  }
}

class Validation {
  bool? isVerified;

  Validation({this.isVerified});

  Validation.fromJson(Map<String, dynamic> json) {
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isVerified'] = isVerified;
    return data;
  }
}
