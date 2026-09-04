import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_repair_service/domain/Repository/CategoryRepository.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

void main() {
  late CategoryRepository categoryRepository;
  late String baseUrl;

  setUpAll(() async {
    await dotenv.load(fileName: '.env');
    FlutterSecureStorage.setMockInitialValues({
      'key': "35",
      'token':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODg1MDY5NDksImV4cCI6MTc4ODUwODc0OX0.NdnrDnHGukAdiiC5GVc8VwAYwIbhLIydy9O32x4R3WA",
    });
    baseUrl = dotenv.env['BASE_URL'].toString();
    print('======================================');
    print('BASE URL: $baseUrl');
    print('======================================');
  });

  setUp(() {
    categoryRepository = CategoryRepository();
  });

  group('CategoryRepository Fetch Category', () {
    test('category API should show result', () async {
      String? token = await Storage.instance.getToken();
      final result = await categoryRepository.fetchCat(
        url: '${dotenv.env['BASE_URL']}${dotenv.env['FETCH_CAT_API']}',
        header: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      print('\n ========== CATEGORY RESULT ==========\n');

      final output = JsonEncoder.withIndent(
        "  ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));

      if (kDebugMode) {
        print(output);
      }
    });
  });
}
