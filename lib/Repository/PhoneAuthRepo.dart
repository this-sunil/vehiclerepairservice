// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:either_dart/either.dart';
//
// import 'package:vehicle_repair_service/Bloc/PhoneAuthBloc/PhoneAuthBloc.dart';
// import 'package:vehicle_repair_service/Model/Failure.dart';
// import 'package:vehicle_repair_service/Model/Success.dart';
//
// abstract class BasePhoneAuthRepo {
//   Future<Either<Failure, Success>> sendOtp({required String phone});
//   Future<Either<Failure, Success>> verifyOtp({required String otp});
// }
//
// class PhoneAuthRepo implements BasePhoneAuthRepo {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   String? _verificationId;
//
//   // ================= SEND OTP =================
//   @override
//   Future<Either<Failure, Success>> sendOtp({required String phone}) async {
//     try {
//       await _auth.verifyPhoneNumber(
//         phoneNumber: '+91$phone',
//         timeout: const Duration(seconds: 60),
//
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           // Auto-verification (Android only)
//           _verificationId=credential.verificationId;
//           log('Auto verification completed=>$credential');
//         },
//
//         verificationFailed: (FirebaseAuthException e) {
//           throw e;
//         },
//
//         codeSent: (String verificationId, int? resendToken) {
//           _verificationId = verificationId;
//           log('OTP sent: $verificationId');
//         },
//
//         codeAutoRetrievalTimeout: (String verificationId) {
//           _verificationId = verificationId;
//         },
//       );
//
//       return Right(
//         Success(
//           status: PhoneAuthStatus.send,
//           msg: 'OTP sent successfully',
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       log('Firebase Auth Error: ${e.message}');
//       return Left(
//         Failure(
//           status: PhoneAuthStatus.error,
//           msg: e.message ?? 'Firebase auth error',
//         ),
//       );
//     } catch (e) {
//       return Left(
//         Failure(
//           status: PhoneAuthStatus.error,
//           msg: e.toString(),
//         ),
//       );
//     }
//   }
//
//   // ================= VERIFY OTP =================
//   @override
//   Future<Either<Failure, Success>> verifyOtp({required String otp}) async {
//     try {
//       if (_verificationId == null) {
//         return Left(
//           Failure(
//             status: PhoneAuthStatus.error,
//             msg: 'Verification ID not found',
//           ),
//         );
//       }
//
//       final credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId.toString(),
//         smsCode: otp,
//       );
//
//       final userCredential =
//       await _auth.signInWithCredential(credential);
//
//       if (userCredential.user == null) {
//         return Left(
//           Failure(
//             status: PhoneAuthStatus.error,
//             msg: 'OTP verification failed',
//           ),
//         );
//       }
//
//       return Right(
//         Success(
//           status: PhoneAuthStatus.verify,
//           msg: 'OTP verified successfully',
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       return Left(
//         Failure(
//           status: PhoneAuthStatus.error,
//           msg: e.message ?? 'Invalid OTP',
//         ),
//       );
//     } catch (e) {
//       return Left(
//         Failure(
//           status: PhoneAuthStatus.error,
//           msg: e.toString(),
//         ),
//       );
//     }
//   }
// }
