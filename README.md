🚗 Vehicle Repair Service

A modern Flutter application for managing vehicle repair services, user authentication, profiles, and service-related operations.

<p align="center">

Flutter • Dart • REST API • Unit Testing

</p>
✨ Authentication Repository

The AuthRepository handles all authentication and user-profile related API operations.

🔐 Tested APIs
#	API	Description	Status
01	📝 Register	Create a new user account	✅ Passed
02	🔑 Login	Authenticate existing user	✅ Passed
03	👤 Fetch Profile	Retrieve user profile	✅ Passed
04	✏️ Update Profile	Update user information	✅ Passed
🧪 Unit Testing

Tests are written using the Flutter testing framework.

▶️ Run Auth Repository Tests
flutter test test/auth_repository_test.dart

📋 Test Execution
╭──────────────────────────────────────────────────╮
│           AUTH REPOSITORY TEST SUITE             │
├──────────────────────────────────────────────────┤
│                                                  │
│  ✓ Register API          PASSED                  │
│  ✓ Login API             PASSED                  │
│  ✓ Fetch Profile API     PASSED                  │
│  ✓ Update Profile API    PASSED                  │
│                                                  │
├──────────────────────────────────────────────────┤
│  Result: 4 / 4 Tests Passed 🎉                   │
╰──────────────────────────────────────────────────╯

📡 API Response
📝 Register
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

🔑 Login
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

👤 Fetch Profile
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

✏️ Update Profile
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

🏗️ Repository Responsibilities
AuthRepository
│
├── 📝 register()
│   └── Create new user account
│
├── 🔑 login()
│   └── Authenticate user
│
├── 👤 fetchProfile()
│   └── Get logged-in user details
│
└── ✏️ updateProfile()
    └── Update user information

📊 Testing Summary
╭───────────────────────────────╮
│       TEST SUMMARY            │
├───────────────────────────────┤
│                               │
│  Total Tests       : 4        │
│  Passed            : 4  ✅    │
│  Failed            : 0  ❌    │
│  Success Rate      : 100%     │
│                               │
╰───────────────────────────────╯

🎯 Result

All AuthRepository tests passed successfully.

The following operations have been verified:

✅ User registration
✅ User login
✅ Profile retrieval
✅ Profile update
🛠️ Tech Stack
Flutter
Dart
REST API
JSON
Unit Testing
Repository Pattern
📁 Test File
test/
└── auth_repository_test.dart


Run the complete authentication test suite with:

flutter test test/auth_repository_test.dart

🔒 Security Note

⚠️ Never commit JWT tokens, passwords, API keys, or other sensitive credentials to GitHub.

API responses shown above intentionally exclude authentication tokens.

🎉 Final Result
╔══════════════════════════════════════╗
║                                      ║
║       🚗 VEHICLE REPAIR SERVICE      ║
║                                      ║
║       AUTH REPOSITORY TESTS          ║
║                                      ║
║          ██████████ 100%             ║
║                                      ║
║          4 / 4 PASSED ✅             ║
║                                      ║
╚══════════════════════════════════════╝


Clean code • Tested APIs • Reliable authentication
