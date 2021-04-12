class UnknownNetworkException implements Exception {
  String? cause = "";

  UnknownNetworkException({this.cause});

  @override
  String toString() => cause!;
}
