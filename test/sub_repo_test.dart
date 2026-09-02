import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_repair_service/domain/Repository/SubscriptionRepo.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

void main(){
  late SubscriptionRepo subscriptionRepo;
  late String baseUrl;

  setUpAll(() async{
    await dotenv.load(fileName: ".env");
    FlutterSecureStorage.setMockInitialValues({
     // 'key': "23",
     // 'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3ODgzNDExMjgsImV4cCI6MTc4ODM0MjMyOH0.uUq6gBE04yoDTR3BQ6i5whoxoWU3f1RBnlUEGhMwUX4"
    });
    print("==================================");
    baseUrl = dotenv.env["BASE_URL"].toString();
    print(baseUrl);
    print("==================================");
    subscriptionRepo=SubscriptionRepo();
  });

  group("Subscription Plan Api Response", (){
    test("Subscription Plan Api", () async{
      String? token=await Storage.instance.getToken();
      final result=await subscriptionRepo.fetchSubscription(url: '$baseUrl${dotenv.env["FETCH_PLAN"]}',header: {
        "Accept":"application/json",
        "Authorization":"Bearer $token"
      },body:{});

      print("============Fetch Service Api==============");
      final output = JsonEncoder.withIndent(" ").convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      print(output);
    });
  });
}