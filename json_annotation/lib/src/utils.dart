/// Code from: https://github.com/google/quiver-dart/blob/master/lib/src/collection/utils.dart
bool listsEqual(List? a, List? b) {
  if (a == b) return true;
  if (a == null || b == null) return false;
  if (a.length != b.length) return false;

  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }

  return true;
}

/// Code from: https://github.com/google/quiver-dart/blob/master/lib/src/collection/utils.dart
bool mapsEqual(Map? a, Map? b) {
  if (a == b) return true;
  if (a == null || b == null) return false;
  if (a.length != b.length) return false;

  for (final k in a.keys) {
    var bValue = b[k];
    if (bValue == null && !b.containsKey(k)) return false;
    if (bValue != a[k]) return false;
  }

  return true;
}

/// Code from: https://github.com/google/quiver-dart/blob/master/lib/src/collection/utils.dart
bool setsEqual(Set? a, Set? b) {
  if (a == b) return true;
  if (a == null || b == null) return false;
  if (a.length != b.length) return false;

  return a.containsAll(b);
}

bool shouldSerialize(
    String key, dynamic value, dynamic jsonValue, dynamic defaultValue) {
  if (value == null) return false;
  if (value is List && defaultValue is List) {
    return !listsEqual(value, defaultValue);
  } else if (value is Map && defaultValue is Map) {
    return !mapsEqual(value, defaultValue);
  } else if (value is Set && defaultValue is Set) {
    return !setsEqual(value, defaultValue);
  }
  return value != defaultValue;
}
