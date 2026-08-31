import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_repair_service/domain/Repository/AuthRepository.dart';
import 'package:vehicle_repair_service/layer/Widget/Storage.dart';

void main() {
  late AuthRepository authRepository;
  late String baseUrl;

  setUpAll(() async {
    await dotenv.load(fileName: '.env');
    FlutterSecureStorage.setMockInitialValues({});

    baseUrl = dotenv.env['BASE_URL'].toString();

    print('======================================');
    print('BASE URL: $baseUrl');
    print('======================================');
  });

  setUp(() {
    authRepository = AuthRepository();
  });

  group('AuthRepository Register', () {
    test('register API should show result', () async {
      final result = await authRepository.register(
        url: '$baseUrl${dotenv.env['REGISTER']}',
        body: {
          'name': 'Abhinav Jadhav',
          'phone': '9887675778',
          'pass': 'abhinav@9870',
        },
      );
      print('\n ========== REGISTER RESULT ==========\n');
      result.fold((l)=>{}, (r){
        Storage.instance.setToken(r.result?.token.toString()??'');
        Storage.instance.setUId(r.result?.result?.id.toString()??"");
      });
      final output = JsonEncoder.withIndent(
        "  ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      if (kDebugMode) {
        print(output);
      }


    });
  });
  group('AuthRepository Login', () {
    test('login API should show result', () async {
      final result = await authRepository.login(
        url: '$baseUrl${dotenv.env['LOGIN']}',
        body: {'phone': '9887675778', 'pass': 'abhinav@9870'},
      );

      print('\n ========== LOGIN RESULT ==========\n');
      result.fold((l)=>{}, (r){
        Storage.instance.setToken(r.result?.token.toString()??'');
        Storage.instance.setUId(r.result?.result?.id.toString()??"");
      });
      final output = JsonEncoder.withIndent(
        "  ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      if (kDebugMode) {
        print(output);
      }
    });
  });

  group('AuthRepository Fetch Profile', () {
    test('fetchProfile API should show result', () async {
      String? id=await Storage.instance.getUID();
      String? token=await Storage.instance.getToken();
      final result = await authRepository.fetchProfile(
        url: '$baseUrl${dotenv.env['FETCH_PROFILE']}',
        header: {
          "Authorization": "Bearer $token",
        },
        body: {'id':id},
      );

      print('========== FETCH PROFILE RESULT ==========');
      final output = JsonEncoder.withIndent(
        "  ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      if (kDebugMode) {
        print(output);
      }

    });
  });


  group('AuthRepository Update Profile', () {
    test('updateProfile API should show result', () async {
      String? id=await Storage.instance.getUID();
      String? token=await Storage.instance.getToken();
      final body = FormData.fromMap({
        'id':id,
        'name': 'Sunil Shedge',
        'phone': '9887675759',
      });

      final result = await authRepository.updateProfile(
        url: '$baseUrl${dotenv.env['UPDATE_PROFILE']}',
        header: {'Authorization': 'Bearer $token'},
        body: body,
      );

      print('\n ========== UPDATE PROFILE RESULT ========== \n');

      final output = JsonEncoder.withIndent(
        "  ",
      ).convert(result.fold((l) => {'error': l.msg}, (r) => r.result));
      if (kDebugMode) {
        print(output);
      }
    });
  });
}
