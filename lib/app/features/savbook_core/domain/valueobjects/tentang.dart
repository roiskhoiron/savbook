class Tentang {
  final String value;

  Tentang(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tentang &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
