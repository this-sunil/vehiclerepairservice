import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:vehicle_repair_service/domain/Repository/AuthRepository.dart';
class MockApi extends Mock implements AuthRepository{

}

void main() {
  late AuthRepository authRepository;
  late String baseUrl;

  final mockApi=MockApi();



  setUpAll(() async {
    await dotenv.load(fileName: '.env');

    baseUrl = dotenv.env['BASE_URL'].toString();

    print('======================================');
    print('BASE URL: $baseUrl');
    print('======================================');
  });

  setUp(() {
    authRepository = AuthRepository();
  });


  
  group('AuthRepository Login', () {
    test('login API should show result', () async {
      final result = await authRepository.login(
        url: '$baseUrl${dotenv.env['LOGIN']}',
        body: {'email': 'test@gmail.com', 'password': '123456'},
      );

      print('\n ========== LOGIN RESULT ==========\n');
      print(result);

      if (result.isRight) {
        print('LOGIN SUCCESS');
        print('Status: ${result.right.status}');
        print('Message: ${result.right.msg}');
        print('Data: ${result.right.result}');
      } else {
        print('LOGIN FAILED');
        print('Status: ${result.left.status}');
        print('Message: ${result.left.msg}');
      }

      expect(result.isRight, true);
    });
  });

  group('AuthRepository Register', () {
    test('register API should show result', () async {
      final result = await authRepository.register(
        url: '$baseUrl${dotenv.env['REGISTER']}',
        body: {
          'name': 'Test User',
          'email': 'test@gmail.com',
          'password': '123456',
        },
      );

      print('\n ========== REGISTER RESULT ==========\n');
      print(result);

      if (result.isRight) {
        print('REGISTER SUCCESS');
        print('Status: ${result.right.status}');
        print('Message: ${result.right.msg}');
        print('Data: ${result.right.result}');
      } else {
        print('REGISTER FAILED');
        print('Status: ${result.left.status}');
        print('Message: ${result.left.msg}');
      }

      expect(result.isRight, true);
    });
  });

  group('AuthRepository Fetch Profile', () {
    test('fetchProfile API should show result', () async {
      final result = await authRepository.fetchProfile(
        url: '$baseUrl${dotenv.env['FETCH_PROFILE']}',
        header: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlhdCI6MTc4NjM4NDUyOSwiZXhwIjoxNzg2Mzg1NzI5fQ.LUeppVIGa601V5XvgxQJz3OhIPMoUwLTzMo2YsJVMT4"
        },
        body: {'userId': '1'},
      );

      print('========== FETCH PROFILE RESULT ==========');
      print(result);

      if (result.isRight) {
        print('FETCH PROFILE SUCCESS');
        print('Status: ${result.right.status}');
        print('Message: ${result.right.msg}');
        print('Data: ${result.right.result}');
      } else {
        print('FETCH PROFILE FAILED');
        print('Status: ${result.left.status}');
        print('Message: ${result.left.msg}');
      }

      expect(result.isRight, true);
    });
  });

  group('AuthRepository Update Profile', () {
    test('updateProfile API should show result', () async {
      final body = FormData.fromMap({
        'name': 'Test User',
        'email': 'test@gmail.com',
      });

      final result = await authRepository.updateProfile(
        url: '$baseUrl${dotenv.env['UPDATE_PROFILE']}',
        header: {'Authorization': 'Bearer test-token'},
        body: body,
      );

      print('\n ========== UPDATE PROFILE RESULT ========== \n');
      print(result);

      if (result.isRight) {
        print('UPDATE PROFILE SUCCESS');
        print('Status: ${result.right.status}');
        print('Message: ${result.right.msg}');
        print('Data: ${result.right.result}');
      } else {
        print('UPDATE PROFILE FAILED');
        print('Status: ${result.left.status}');
        print('Message: ${result.left.msg}');
      }

      expect(result.isRight, true);
    });
  });
}
