🚗 Vehicle Repair Service

A Flutter-based vehicle repair service application for managing vehicle repair and service operations.

📌 Project Overview

The Vehicle Repair Service application is built using Flutter and follows a repository-based architecture for API integration.

The authentication module provides:

User registration
User login
User profile retrieval
User profile update
🛠️ Tech Stack
Technology	Purpose
Flutter	Mobile Application
Dart	Programming Language
REST API	Backend Integration
Repository Pattern	API & Data Layer
Flutter Test	Unit Testing
🔐 Authentication

The AuthRepository handles all authentication-related API operations.

Available APIs
#	API	Description
1	Register	Create a new user account
2	Login	Authenticate an existing user
3	Fetch Profile	Retrieve user profile information
4	Update Profile	Update user profile information
🧪 Unit Testing

The authentication repository has been tested using Flutter's built-in testing framework.

Test File
test/
└── auth_repository_test.dart

Run Tests
flutter test test/auth_repository_test.dart

📊 Test Results
#	Test Case	API	Status
01	Register	Register API	✅ Passed
02	Login	Login API	✅ Passed
03	Fetch Profile	Fetch Profile API	✅ Passed
04	Update Profile	Update Profile API	✅ Passed
Test Summary
Metric	Result
Total Tests	4
Passed	4
Failed	0
Success Rate	100%
🔍 Test Output
00: AuthRepository Register
    ✓ register API should show result

01: AuthRepository Login
    ✓ login API should show result

02: AuthRepository Fetch Profile
    ✓ fetchProfile API should show result

03: AuthRepository Update Profile
    ✓ updateProfile API should show result

────────────────────────────────────────────

✓ All tests passed!

🌐 API Response Examples
1. Register API
Response
{
    "status": true,
    "msg": "User register Successfully !!!",
    "result": {
        "id": 27,
        "name": "Abhinav Jadhav",
        "phone": "9887675778",
        "photo": "",
        "role": "user",
        "created_at": "2026-08-31T11:18:43.344Z"
    }
}


Status: ✅ Passed

2. Login API
Response
{
    "status": true,
    "msg": "Login Successfully !!!",
    "result": {
        "id": 27,
        "name": "Abhinav Jadhav",
        "phone": "9887675778",
        "photo": "",
        "role": "user",
        "created_at": "2026-08-31T11:18:43.344Z"
    }
}


Status: ✅ Passed

3. Fetch Profile API
Response
{
    "status": true,
    "msg": "Fetch User Successfully",
    "result": {
        "id": 27,
        "name": "Abhinav Jadhav",
        "phone": "9887675778",
        "photo": "",
        "role": "user",
        "created_at": "2026-08-31T11:18:43.344Z"
    }
}


Status: ✅ Passed

4. Update Profile API
Response
{
    "status": true,
    "msg": "Update Profile Successfully !!!",
    "result": {
        "id": 27,
        "name": "Sunil Shedge",
        "phone": "9887675759",
        "photo": "",
        "role": "user",
        "created_at": "2026-08-31T11:18:43.344Z"
    }
}


Status: ✅ Passed

📋 API Test Matrix
API	Response Status	Result	Test
Register	true	User registered successfully	✅ Passed
Login	true	Login successful	✅ Passed
Fetch Profile	true	User profile fetched successfully	✅ Passed
Update Profile	true	User profile updated successfully	✅ Passed
📁 Project Structure
vehicle_repair_service/
│
├── lib/
│   ├── models/
│   ├── repositories/
│   ├── services/
│   ├── screens/
│   └── main.dart
│
├── test/
│   └── auth_repository_test.dart
│
├── android/
├── ios/
├── pubspec.yaml
└── README.md

🚀 Getting Started
Prerequisites

Make sure the following are installed:

Flutter SDK
Dart SDK
Android Studio / VS Code
Android Emulator or Physical Device
Installation

Clone the repository:

git clone <repository-url>


Navigate to the project:

cd vehicle_repair_service


Install dependencies:

flutter pub get


Run the application:

flutter run

🧪 Testing

Run all Flutter tests:

flutter test


Run only AuthRepository tests:

flutter test test/auth_repository_test.dart

📈 Current Test Status
Component	Status
Register API	✅
Login API	✅
Fetch Profile API	✅
Update Profile API	✅
AuthRepository	🟢 Working
Unit Tests	🟢 Passing
🎯 Final Result

AuthRepository API integration is working as expected.

All 4 authentication APIs have been successfully tested.

4/4 Tests Passed — 100% Success Rate 🎉

👨‍💻 Development

This project uses a repository-based approach to separate API communication from the application UI and business logic.

The AuthRepository is responsible for handling authentication and profile-related API operations.

📄 License

This project is developed for the Vehicle Repair Service application.

⭐ Status

Project Status: 🟢 Active Development

Authentication Module: 🟢 Completed & Tested

Test Status: 🟢 4/4 Passed
