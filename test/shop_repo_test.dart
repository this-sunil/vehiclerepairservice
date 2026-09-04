import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_repair_service/domain/Repository/SearchShopRepository.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

void main() {
  late SearchShopRepo searchShopRepo;
  late String baseUrl;

  setUpAll(() async {
    await dotenv.load(fileName: ".env");
    FlutterSecureStorage.setMockInitialValues({
      'key': "35",
      'token':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODg1MDY5NDksImV4cCI6MTc4ODUwODc0OX0.NdnrDnHGukAdiiC5GVc8VwAYwIbhLIydy9O32x4R3WA",
    });
    print("==================================");
    baseUrl = dotenv.env["BASE_URL"].toString();
    print(baseUrl);
    print("==================================");
    searchShopRepo = SearchShopRepo();
  });

  group("Search city Api Response", () {
    test("Search City Api", () async {
      String? token = await Storage.instance.getToken();
      final result = await searchShopRepo.searchByCity(
        url: '$baseUrl${dotenv.env["SEARCH_BY_CITY"]}',
        header: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {"page": 1, "city": "Pune"},
      );

      print("============Fetch Service Api==============");
      final output = JsonEncoder.withIndent(
        " ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      print(output);
    });
  });
}
