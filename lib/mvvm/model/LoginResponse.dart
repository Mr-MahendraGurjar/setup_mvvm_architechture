class LoginResponse {
  final int? inactivityTimeOut;
  final int? noofDaysOffline;
  final String? token;
  final int? userID;
  final bool? invalidPassword;
  final String? userName;

  LoginResponse({
    this.inactivityTimeOut,
    this.noofDaysOffline,
    this.token,
    this.userID,
    this.invalidPassword,
    this.userName,
  });

  static fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      inactivityTimeOut: json['InactivityTimeOut'],
      noofDaysOffline: json['NoofDaysOffline'],
      token: json['Token'],
      userID: json['UserID'],
      invalidPassword: json['invalidPassword'],
      userName: json['UserName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InactivityTimeOut'] = this.inactivityTimeOut;
    data['NoofDaysOffline'] = this.noofDaysOffline;
    data['Token'] = this.token;
    data['UserID'] = this.userID;
    data['invalidPassword'] = this.invalidPassword;
    data['UserName'] = this.userName;
    return data;
  }

  @override
  String toString() {
    return "LoginResponse{token: $token, inactivityTimeOut: $inactivityTimeOut, noofDaysOffline: $noofDaysOffline, userID: $userID, invalidPassword: $invalidPassword}";
  }
}
