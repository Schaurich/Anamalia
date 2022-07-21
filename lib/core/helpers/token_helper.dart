const tokenExceptionMessage = 'Invalid argument value, try a date as string';

/// Knows how to handle all Token types.
class TokenHelper {
  static bool isActive(String value) {
    try {
      final tokenEndTimeAsDate = DateTime.parse(value);
      return tokenEndTimeAsDate.difference(DateTime.now()).inSeconds > 0;
    } on Exception catch (_) {
      throw Exception(tokenExceptionMessage);
    }
  }
}
