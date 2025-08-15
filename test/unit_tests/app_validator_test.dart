import 'package:flutter_test/flutter_test.dart';
import 'package:demo_qr_scanner/core/utils/app_validator.dart';

void main() {
  group('AppValidator', () {
    test('isNotEmpty returns error message for null value', () {
      expect(AppValidator.isNotEmpty(null, 'Error message'), 'Error message');
    });

    test('isNotEmpty returns error message for empty string', () {
      expect(AppValidator.isNotEmpty('', 'Error message'), 'Error message');
    });

    test('isNotEmpty returns null for non-empty string', () {
      expect(AppValidator.isNotEmpty('test', 'Error message'), null);
    });

    test('isNotEmpty returns null for string with spaces', () {
      expect(AppValidator.isNotEmpty('   ', 'Error message'), 'Error message');
    });
  });
}