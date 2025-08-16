import 'package:flutter_test/flutter_test.dart';
import 'package:demo_qr_scanner/core/utils/date_time_formatter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('ja_JP', null);
  });

  group('DateTimeFormatter', () {
    final testDateTime = DateTime(2025, 8, 16, 10, 30, 0);

    test('formatDate returns date in correct format', () {
      // The expected day of the week for 2025-08-16 is Saturday, which is '土' in Japanese.
      expect(DateTimeFormatter.formatDate(testDateTime), '2025年8月16日(土)');
    });

    test('formatTime returns time in correct format', () {
      expect(DateTimeFormatter.formatTime(testDateTime), '10時30分0秒');
    });
  });
}
