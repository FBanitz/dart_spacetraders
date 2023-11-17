/// Checks if [data] is of type [T], and throws a [FormatException] if it is not.
/// If [data] is of type [T], it is returned typed as [T].
T typeCheck<T>(dynamic data) {
  if (data is! T) {
    throw FormatException('Expected $T, got ${data.runtimeType}');
  }

  return data;
}

bool isList<T>() => T.toString().startsWith('List');
