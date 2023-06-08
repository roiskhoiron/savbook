class Token {
  final String value;

  Token({required this.value});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Token &&
      other.value == value;
  }
}