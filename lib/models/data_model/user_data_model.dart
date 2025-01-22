class UserDataModel {
  String? accessToken;
  int? id;
  String? fullName;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  String? gender;
  String? countryCode;
  String? countryShortCode;
  String? dob;
  String? planType;
  int? isVerified;
  dynamic phoneNumber;
  dynamic address;
  dynamic zipCode;

  UserDataModel(
      {this.accessToken,
        this.id,
        this.fullName,
        this.firstName,
        this.dob,
        this.lastName,
        this.image,
        this.planType,
        this.isVerified,
        this.countryCode,
        this.countryShortCode,
        this.gender,
        this.phoneNumber,
        this.address,
        this.zipCode,
        this.email});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    id = json['id'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    countryCode = json['country_code'];
    countryShortCode = json['country_short_code'];
    lastName = json['last_name'];
    planType = json['plan_type'];
    email = json['email'];
    dob = json['dob'];
    isVerified = json['is_verified'];
    image = json['profile'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['gender'] = this.gender;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country_code'] = this.countryCode;
    data['plan_type'] = this.planType;
    data['country_short_code'] = this.countryShortCode;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['profile'] = this.image;
    data['is_verified'] = this.isVerified;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['zip_code'] = this.zipCode;
    return data;
  }
}