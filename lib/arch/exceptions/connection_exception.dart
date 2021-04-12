class ConnectionException implements Exception {
  String? cause = "Connection exception";

  ConnectionException({this.cause});

  @override
  String toString() => cause!;
}
