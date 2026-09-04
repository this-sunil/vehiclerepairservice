import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_repair_service/domain/Repository/NotificationRepo.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

void main() {
  late NotificationRepository notificationRepository;
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
    notificationRepository = NotificationRepository();
  });

  group("Notification Api Response", () {
    test("Notification Api", () async {
      String? token = await Storage.instance.getToken();
      Map<String, String> header = {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      };
      String url = "$baseUrl${dotenv.env["FETCH_NOTIFICATION"]}";
      final result = await notificationRepository.fetchNotification(
        url: url,
        header: header,
        body: {},
      );
      print("============Notification Api=>==============");
      final output = JsonEncoder.withIndent(
        " ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      print(output);
    });
  });
}
