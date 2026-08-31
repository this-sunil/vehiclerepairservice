

# 🚗 Vehicle Repair Service

A Flutter-based vehicle repair service application for managing vehicle repair and service operations.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![REST API](https://img.shields.io/badge/REST_API-Integrated-blue?style=for-the-badge)
![Tests](https://img.shields.io/badge/Tests-4%2F4_Passed-brightgreen?style=for-the-badge)

---

## 📖 About The Project

**Vehicle Repair Service** is a Flutter application designed to manage vehicle repair and service-related operations.

The application uses a repository-based architecture for API communication and separates API handling from the UI and business logic.

### ✨ Features

- 👤 User Registration
- 🔐 User Login
- 📄 Fetch User Profile
- ✏️ Update User Profile
- 🌐 REST API Integration
- 🧪 Unit Testing
- 📱 Flutter-based Mobile Application

---

## 🛠️ Tech Stack

| Technology | Purpose |
|:---|:---|
| **Flutter** | Mobile Application Framework |
| **Dart** | Programming Language |
| **REST API** | Backend Communication |
| **AuthRepository** | Authentication API Layer |
| **Flutter Test** | Unit Testing |

---

## 📁 Project Structure

```text
vehicle_repair_service/
│
├── android/
├── ios/
│
├── lib/
│   ├── models/
│   ├── repositories/
│   │   └── auth_repository.dart
│   ├── services/
│   ├── screens/
│   └── main.dart
│
├── test/
│   └── auth_repository_test.dart
│
├── pubspec.yaml
└── README.md

🔐 Authentication

The AuthRepository is responsible for authentication and user profile API operations.

API Overview
#	API	Description	Status
1	Register	Create a new user account	✅
2	Login	Authenticate an existing user	✅
3	Fetch Profile	Retrieve user profile	✅
4	Update Profile	Update user profile	✅
🧪 Unit Testing

The AuthRepository has been tested using Flutter's built-in testing framework.

Test File
test/
└── auth_repository_test.dart

Run AuthRepository Tests
flutter test test/auth_repository_test.dart

Run All Tests
flutter test

📊 Test Results
#	Repository	Test Case	Status
01	AuthRepository	Register API	✅ Passed
02	AuthRepository	Login API	✅ Passed
03	AuthRepository	Fetch Profile API	✅ Passed
04	AuthRepository	Update Profile API	✅ Passed
Test Summary
Metric	Result
Total Tests	4
Passed	4 ✅
Failed	0 ❌
Success Rate	100% 🎉
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

🌐 API Documentation
1. 📝 Register API
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

2. 🔐 Login API
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

3. 👤 Fetch Profile API
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

4. ✏️ Update Profile API
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
🚀 Getting Started
Prerequisites

Before running the application, make sure the following are installed:

Flutter SDK
Dart SDK
Android Studio or VS Code
Android Emulator or Physical Android Device
Installation
1. Clone the Repository
git clone <repository-url>

2. Navigate to the Project
cd vehicle_repair_service

3. Install Dependencies
flutter pub get

4. Run the Application
flutter run

🏗️ Architecture

The project follows a repository-based architecture.

┌─────────────────────┐
│      Flutter UI     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│   AuthRepository    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│     REST API        │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│    Backend Server   │
└─────────────────────┘

AuthRepository Responsibilities
Handle authentication requests
Handle profile requests
Communicate with REST APIs
Process API responses
Keep API logic separate from UI
🔄 Authentication Flow
User
  │
  ▼
Flutter UI
  │
  ▼
AuthRepository
  │
  ▼
REST API
  │
  ▼
Backend
  │
  ▼
JSON Response
  │
  ▼
Flutter UI

📈 Current Test Status
Component	Status
Register API	🟢 Working
Login API	🟢 Working
Fetch Profile API	🟢 Working
Update Profile API	🟢 Working
AuthRepository	🟢 Working
Unit Tests	🟢 Passing
🎯 Final Result

AuthRepository API integration is working as expected.

All 4 authentication APIs have been successfully tested.

Result	Value
Total APIs Tested	4
Successful APIs	4
Failed APIs	0
Success Rate	100%
Overall Status	🟢 PASS
✅ Conclusion

The AuthRepository API integration has been successfully implemented and tested.

The following authentication operations are working correctly:

✅ Register API
✅ Login API
✅ Fetch Profile API
✅ Update Profile API
🎉 Final Test Result

4 / 4 Tests Passed

100% Success Rate

Authentication Integration: 🟢 Working

📌 Project Status
Module	Status
Authentication	🟢 Completed
Register	🟢 Completed
Login	🟢 Completed
Fetch Profile	🟢 Completed
Update Profile	🟢 Completed
Unit Testing	🟢 Completed
📄 License

This project is developed for the Vehicle Repair Service application.

⭐ Support

If you find this project useful, consider giving the repository a ⭐.

Vehicle Repair Service

Flutter • Dart • REST API • AuthRepository • Unit Testing
