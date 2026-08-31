🚗 Vehicle Repair Service
A Flutter-based Vehicle Repair Service Application with authentication and user profile management.





🧪 Auth Repository Testing
The AuthRepository has been tested using Flutter's built-in testing framework.

APIs Covered
✅ Register API
✅ Login API
✅ Fetch Profile API
✅ Update Profile API
▶️ Run Tests
flutter test test/auth_repository_test.dart

📊 Test Results
#	Repository	API	Status
1	AuthRepository	Register API	✅ Passed
2	AuthRepository	Login API	✅ Passed
3	AuthRepository	Fetch Profile API	✅ Passed
4	AuthRepository	Update Profile API	✅ Passed

Result: 4/4 tests passed successfully — 100% 🎉

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

📈 Test Summary
Metric	Result
Repository	AuthRepository
#	Repository	API	Status
1	AuthRepository	Register API	✅ Passed
2	AuthRepository	Login API	✅ Passed
3	AuthRepository	Fetch Profile API	✅ Passed
4	AuthRepository	Update Profile API	✅ Passed

🌐 API Documentation
1. 📝 Register API
Response:

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
Response:

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
Response:

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
Response:

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
#	Repository	API	Status
1	AuthRepository	Register API	✅ Passed
2	AuthRepository	Login API	✅ Passed
3	AuthRepository	Fetch Profile API	✅ Passed
4	AuthRepository	Update Profile API	✅ Passed

🎯 Final Result
📈 Test Summary
Metric	Result
Repository	AuthRepository
Total APIs Tested	4
Passed	4 ✅
Failed	0
Success Rate	100% 🎉


✅ Conclusion
The AuthRepository API integration is working as expected.

All authentication APIs have been successfully tested:

✅ Register
✅ Login
✅ Fetch Profile
✅ Update Profile
Final Status: 🟢 All Tests Passed
