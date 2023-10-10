import 'package:collection/collection.dart';

bool listsEqual(List? a, List? b) => const ListEquality().equals(a, b);

bool mapsEqual(Map? a, Map? b) => const MapEquality().equals(a, b);

bool setsEqual(Set? a, Set? b) => const SetEquality().equals(a, b);

bool shouldSerialize(String key, dynamic value, dynamic jsonValue,
    dynamic defaultValue, bool serializeDefaultValues) {
  if (value == null) return false;
  if (value is List && defaultValue is List) {
    return serializeDefaultValues || !listsEqual(value, defaultValue);
  } else if (value is Map && defaultValue is Map) {
    return serializeDefaultValues || !mapsEqual(value, defaultValue);
  } else if (value is Set && defaultValue is Set) {
    return serializeDefaultValues || !setsEqual(value, defaultValue);
  }
  return serializeDefaultValues || value != defaultValue;
}
