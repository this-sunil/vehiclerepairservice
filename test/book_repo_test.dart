import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_repair_service/domain/Repository/BookRepository.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

void main() {
  late BookRepository bookRepository;
  late String baseUrl;
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
    print("=============================");
    baseUrl = dotenv.env["BASE_URL"].toString();
    print(baseUrl);
    print("=============================");
    FlutterSecureStorage.setMockInitialValues({
      'key': "35",
      'token':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlhdCI6MTc4ODUyNTI2NiwiZXhwIjoxNzg4NTI3MDY2fQ.5oFWIzhoXo2h6NG1lD8yhWzv2SPpEj1RpralNcusv9Y",
    });
    bookRepository = BookRepository();
  });

  group("Book Slot History Response", () {
    test('bookAppointment API should show result', () async {
      final url = '$baseUrl${dotenv.env['BOOK_APPOINTMENT']}';
      String? token = await Storage.instance.getToken();
      String? id = await Storage.instance.getUID();

      final result = await bookRepository.bookAppointment(
        url: url,
        header: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "multipart/form-data",
        },
        body: FormData.fromMap({
          "id": id,
          "vehicle_name": "Suzuki",
          "registration_no": "MH 12 PT 9868",
          "vehicle_type": "Bike",
          "service_name": "Bike Service",
          "slot_date": "2026-09-08",
          "slot_time": "21:00",
        }),
      );

      print('========== BOOK APPOINTMENT ===========');
      final output = const JsonEncoder.withIndent(
        "  ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      print(output);
    });

    test("Fetch Slot History", () async {
      String? token = await Storage.instance.getToken();
      String? id = await Storage.instance.getUID();
      final result = await bookRepository.fetchSlotHistory(
        url: '$baseUrl${dotenv.env['FETCH_SLOT_HISTORY']}',
        header: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: FormData.fromMap({"uid": id, "page": 1}),
      );
      print("==========Fetch Book Repository =========");
      final output = JsonEncoder.withIndent(
        " ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      print(output);
    });
  });
}
