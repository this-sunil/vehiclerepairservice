🚗 Vehicle Repair Service

A Flutter-based vehicle repair service application.

🧪 Unit Testing — Auth Repository

The authentication repository has been tested using Flutter's built-in testing framework.

Run Tests
flutter test test/auth_repository_test.dart

Test Coverage

The following authentication APIs are covered:

✅ Register API
✅ Login API
✅ Fetch Profile API
✅ Update Profile API
Test Results
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

API Response Examples
1. Register
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

2. Login
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

3. Fetch Profile
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

4. Update Profile
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

📊 Test Summary
#	Repository	Test	Status
1	AuthRepository	Register API	✅ Passed
2	AuthRepository	Login API	✅ Passed
3	AuthRepository	Fetch Profile API	✅ Passed
4	AuthRepository	Update Profile API	✅ Passed
🎉 Result

4/4 tests passed successfully.

The AuthRepository API integration is working as expected.
