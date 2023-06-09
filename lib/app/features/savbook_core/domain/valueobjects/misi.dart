class Misi {
  final String value;

  Misi(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Misi && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
