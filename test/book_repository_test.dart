import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_repair_service/domain/Repository/BookRepository.dart';

void main() {
  late BookRepository bookRepository;
  late String baseUrl;

  setUpAll(() async {
    await dotenv.load(fileName: '.env');

    baseUrl = dotenv.env['BASE_URL']!;

    print('======================================');
    print('BASE URL: $baseUrl');
    print('BOOK APPOINTMENT: ${dotenv.env['BOOK_APPOINTMENT']}');
    print('FETCH SLOT HISTORY: ${dotenv.env['FETCH_SLOT_HISTORY']}');
    print('======================================');
  });

  setUp(() {
    bookRepository = BookRepository();
  });

  group('BookRepository', () {
    test('bookAppointment API should show result', () async {
      final url = '$baseUrl${dotenv.env['BOOK_APPOINTMENT']!}';

      final body = FormData.fromMap({
        'vehicleId': '1',
        'serviceId': '1',
        'slotId': '1',
        'date': '2026-08-10',
      });

      final result = await bookRepository.bookAppointment(
        url: url,
        header: {'Authorization': 'Bearer test-token'},
        body: body,
      );

      print('========== BOOK APPOINTMENT ==========');
      print('URL: $url');
      print('RESULT: $result');

      if (result.isRight) {
        print('BOOK APPOINTMENT SUCCESS');
        print('Status: ${result.right.status}');
        print('Message: ${result.right.msg}');
      } else {
        print('BOOK APPOINTMENT FAILED');
        print('Status: ${result.left.status}');
        print('Message: ${result.left.msg}');
      }

      expect(result, isNotNull);
    });

    test('fetchSlotHistory API should show result', () async {
      final url = '$baseUrl${dotenv.env['FETCH_SLOT_HISTORY']!}';

      final result = await bookRepository.fetchSlotHistory(
        url: url,
        header: {'Authorization': 'Bearer test-token'},
        body: {'page': 1},
      );

      print('========== FETCH SLOT HISTORY ==========');
      print('URL: $url');
      print('RESULT: $result');

      if (result.isRight) {
        print('FETCH SLOT HISTORY SUCCESS');
        print('Status: ${result.right.status}');
        print('Message: ${result.right.msg}');
        print('Data: ${result.right.result}');
      } else {
        print('FETCH SLOT HISTORY FAILED');
        print('Status: ${result.left.status}');
        print('Message: ${result.left.msg}');
      }

      expect(result, isNotNull);
    });
  });
}
