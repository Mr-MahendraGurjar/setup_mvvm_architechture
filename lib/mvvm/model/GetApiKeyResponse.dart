class GetApiKeyResponse {
  String? aPIkey;
  String? endPoint;

  GetApiKeyResponse({this.aPIkey, this.endPoint});

  static fromJson(Map<String, dynamic> json) {
    return GetApiKeyResponse(
      aPIkey: json['APIKey'],
      endPoint: json['EndPoint'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['APIKey'] = this.aPIkey;
    data['EndPoint'] = this.endPoint;
    return data;
  }
}
