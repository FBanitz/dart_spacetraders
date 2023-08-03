extension CreditIntExtension on int {
  String toCredits() {
    final String credits = toString();
    final int length = credits.length;
    final int remainder = length % 3;
    final int groups = (length / 3).floor();
    final List<String> parts = [];

    if (remainder != 0) {
      parts.add(credits.substring(0, remainder));
    }

    for (int i = 0; i < groups; i++) {
      final int start = remainder + (i * 3);
      parts.add(credits.substring(start, start + 3));
    }

    return 'C ${parts.join(',')}';
  }
}
