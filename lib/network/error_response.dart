class ErrorResponse {
  final String? message;
  final String? messageCode;
  final String? messageType;

  ErrorResponse({this.message, this.messageCode, this.messageType});

  static fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['Message'],
      messageCode: json['MessageCode'],
      messageType: json['MessageType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['MessageCode'] = this.messageCode;
    data['MessageType'] = this.messageType;
    return data;
  }
}
