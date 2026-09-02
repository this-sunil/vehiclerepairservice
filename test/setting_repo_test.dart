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
      //'key': "23",
      //'token':"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgzMjg2MTQsImV4cCI6MTc4ODMyOTgxNH0.EvG8d7jk19PKxCN8ZML2wiX3K9jYX-G1NK1GtvPnpb4",
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
        "  "
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      print(output);
    });
  });
}
