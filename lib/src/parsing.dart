part of weatherapi_library;

// Unpack an integer value from a Map object.
int? _unpackInteger(Map<String, dynamic>? map, String key)
{
    if (map == null || !map.containsKey(key) || key.isEmpty)
    {
        return null;
    }

    return map[key];
}
