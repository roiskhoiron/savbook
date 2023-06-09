class Foto {
  final String value;

  Foto(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Foto && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
