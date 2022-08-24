Future<String> getProfileUserName(String comp) async {
  await Future.delayed(const Duration(seconds: 5));
  return '$comp = GEG509';
}

Future<String> getCountry() async {
  await Future.delayed(const Duration(seconds: 5));
  return 'Nebraska';
}

Stream<String> getSessionTime(String units) {
  return Stream.periodic(
      const Duration(seconds: 1), (sessionTime) => '${sessionTime++} $units');
}
