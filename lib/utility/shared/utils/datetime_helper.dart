extension DateTimeExstention on DateTime {
  String get asHHmmString =>
      '${hour < 10 ? '0$hour' : hour}.${minute < 10 ? '0$minute' : minute}';
}
