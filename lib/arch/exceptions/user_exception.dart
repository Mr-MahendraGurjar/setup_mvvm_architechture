class UserException implements Exception {
  String? cause = "Connection exception";

  UserException({this.cause});

  @override
  String toString() => cause!;
}
