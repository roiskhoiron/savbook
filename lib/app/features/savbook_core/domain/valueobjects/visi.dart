class Visi {
  final String value;

  Visi(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Visi && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
