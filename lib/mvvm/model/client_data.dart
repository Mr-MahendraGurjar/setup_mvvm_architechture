class ClientData {
  int? clientID;
  String? firstName;
  String? lastName;
  String? dOB;
  String? age;
  dynamic? gender;
  dynamic? genderName;
  dynamic? ethnicity;
  dynamic? race;
  String? maritalStatus;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? zipCode;
  String? ssn;

  String? startDateTime;
  var appointmentID;
  var photo;
  var formData;
  bool? isSelected = false;
  bool? isVisitEnd = false;

  ClientData(
      {this.clientID,
      this.firstName,
      this.lastName,
      this.dOB,
      this.age,
      this.gender,
      this.genderName,
      this.ethnicity,
      this.race,
      this.maritalStatus,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.startDateTime,
      this.appointmentID,
      this.photo,
      this.zipCode,
      this.ssn,
      this.formData,});

  ClientData.fromJson(Map<String, dynamic> json) {
    clientID = json['ClientID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    dOB = json['DOB'];
    age = json['Age'];
    gender = json['Gender'];
    genderName = json['GenderName'];
    ethnicity = json['Ethnicity'];
    race = json['Race'];
    maritalStatus = json['MaritalStatus'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    city = json['City'];
    state = json['State'];
    startDateTime = json['StartDateTime'];
    appointmentID = json['AppointmentID'];
    photo = json['Photo'];
    zipCode = json['ZipCode'];
    ssn = json['SSN'];
    formData = json['FormList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClientID'] = this.clientID;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['DOB'] = this.dOB;
    data['Age'] = this.age;
    data['Gender'] = this.gender;
    data['GenderName'] = this.genderName;
    data['Ethnicity'] = this.ethnicity;
    data['Race'] = this.race;
    data['MaritalStatus'] = this.maritalStatus;
    data['Address1'] = this.address1;
    data['Address2'] = this.address2;
    data['City'] = this.city;
    data['State'] = this.state;
    data['StartDateTime'] = this.startDateTime;
    data['AppointmentID'] = this.appointmentID;
    data['Photo'] = this.photo;
    data['ZipCode'] = this.zipCode;
    data['SSN'] = this.ssn;
    data['FormList'] = this.formData;
    return data;
  }

  String get userFullName => "$firstName $lastName";
}
