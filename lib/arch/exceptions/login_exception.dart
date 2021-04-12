class LoginException implements Exception {
  String? cause = "Connection exception";

  LoginException({this.cause});

  @override
  String toString() => cause!;
}
