import 'package:collection/collection.dart';

bool listsEqual(List? a, List? b) => const ListEquality().equals(a, b);

bool mapsEqual(Map? a, Map? b) => const MapEquality().equals(a, b);

bool setsEqual(Set? a, Set? b) => const SetEquality().equals(a, b);

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
