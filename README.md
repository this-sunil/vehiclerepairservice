🚗 Vehicle Repair Service

A Flutter-based vehicle repair service application.

🧪 Unit Testing — Auth Repository

The AuthRepository has been tested using Flutter's built-in testing framework to verify authentication API integration.

▶️ Run Tests
flutter test test/auth_repository_test.dart

📋 Test Coverage
✅ Register API
✅ Login API
✅ Fetch Profile API
✅ Update Profile API
📊 Test Results
#	Repository	Test Case	Status
1	AuthRepository	Register API	✅ Passed
2	AuthRepository	Login API	✅ Passed
3	AuthRepository	Fetch Profile API	✅ Passed
4	AuthRepository	Update Profile API	✅ Passed
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
Total APIs Tested	4
Passed	4 ✅
Failed	0
Success Rate	100% 🎉
🌐 API Response Examples
1. Register API
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

2. Login API
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

3. Fetch Profile API
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

4. Update Profile API
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

🎯 Final Result

[!NOTE]
4/4 authentication API tests passed successfully.

Repository	APIs Tested	Passed	Failed	Success Rate
AuthRepository	4	4 ✅	0	100%
✅ Conclusion

The AuthRepository API integration is working as expected.

All authentication APIs have been successfully tested:

Register
Login
Fetch Profile
Update Profile
<p align="center"> 🚗 <strong>Vehicle Repair Service</strong><br> Flutter Application · Auth Repository Testing · 2026 </p>
