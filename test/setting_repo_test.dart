import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_repair_service/domain/Repository/SettingRepository.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

void main() {
  late SettingRepository repository;
  late String baseUrl;
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
    baseUrl = dotenv.env['BASE_URL'].toString();
    FlutterSecureStorage.setMockInitialValues({
      'key': "35",
      'token':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODg1MDY5NDksImV4cCI6MTc4ODUwODc0OX0.NdnrDnHGukAdiiC5GVc8VwAYwIbhLIydy9O32x4R3WA",
    });
    print("===================");
    print(baseUrl);
    print("===================");
    repository = SettingRepository();
  });

  group("Setting Api Response", () {
    test("Fetch Setting Data", () async {
      String? id = await Storage.instance.getUID();
      String? token = await Storage.instance.getToken();

      final result = await repository.fetchSetting(
        url: '$baseUrl${dotenv.env["FETCH_SETTING"]}',
        header: {"Authorization": "Bearer $token"},
        body: {"id": id},
      );
      print("=============Fetch Setting==============");
      final output = const JsonEncoder.withIndent(
        "  ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      print(output);
    });
  });
}
