// import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
//
// class PhonePeHandler {
//   static const String merchantId = "PGTESTPAYUAT";
//   static const String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
//   static const String saltIndex = "1";
//   static const String apiEndPoint = "/pg/v1/pay";
//
//   // Initialization
//   static Future<void> initSDK() async {
//     try {
//       bool isInitialized = await PhonePePaymentSdk.init(
//         "SANDBOX",
//         merchantId,
//         "", // appId can be empty for Sandbox
//         true, // enableLogs
//       );
//       print("PhonePe SDK Initialized: $isInitialized");
//     } catch (e) {
//       print("Init Error: $e");
//     }
//   }
//
//   // Start Transaction
//   static Future<void> startTransaction({
//     required String transactionId,
//     required double amount,
//   }) async {
//     // 1. Create Request Data (Amount is in Paisa, so 1 INR = 100 Paisa)
//     final requestData = {
//       "merchantId": merchantId,
//       "merchantTransactionId": transactionId,
//       "merchantUserId": "PGTESTPAYUAT86",
//       "amount": (amount * 100).toInt(),
//       "mobileNumber": "9999999999",
//       "callbackUrl": "https://webhook.site/your-unique-id",
//       "paymentInstrument": {"type": "PAY_PAGE"}
//     };
//
//     // 2. Encode to Base64
//     String base64Body = base64.encode(utf8.encode(json.encode(requestData)));
//
//     // 3. Generate Checksum
//     String config = base64Body + apiEndPoint + saltKey;
//     String checksum = "${sha256.convert(utf8.encode(config))}###$saltIndex";
//
//     try {
//       var response = await PhonePePaymentSdk.startTransaction(
//         base64Body,
//         "https://api-preprod.phonepe.com/apis/pg-sandbox",
//         checksum,
//         "", // App Schema (Needed for iOS/Intents)
//       );
//
//       print("Response: $response");
//     } catch (e) {
//       print("Transaction Error: $e");
//     }
//   }
// }