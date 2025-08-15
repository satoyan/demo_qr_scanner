class AppValidator {
  static String? isNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty'; // TODO: Localize this
    }
    return null;
  }
}