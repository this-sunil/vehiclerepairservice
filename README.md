

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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Repair Service - README Documentation</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        pre { background-color: #f8f9fa; padding: 1rem; border-radius: 0.375rem; border: 1px solid #dee2e6; }
        code { color: #d63384; }
    </style>
</head>
<body class="bg-light text-dark py-4">

<div class="container bg-white p-4 p-md-5 rounded shadow-sm border">

    <pre><code>vehicle_repair_service/
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
└── README.md</code></pre>

    <h2 class="mt-4">🔐 Authentication</h2>
    <p>The <code>AuthRepository</code> is responsible for authentication and user profile API operations.</p>

    <h3 class="h4 mt-4">API Overview</h3>
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">API</th>
                    <th scope="col">Description</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Register</td>
                    <td>Create a new user account</td>
                    <td><span class="badge bg-success">✅</span></td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Login</td>
                    <td>Authenticate an existing user</td>
                    <td><span class="badge bg-success">✅</span></td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Fetch Profile</td>
                    <td>Retrieve user profile</td>
                    <td><span class="badge bg-success">✅</span></td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>Update Profile</td>
                    <td>Update user profile</td>
                    <td><span class="badge bg-success">✅</span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <h2 class="mt-4">🧪 Unit Testing</h2>
    <p>The <code>AuthRepository</code> has been tested using Flutter's built-in testing framework.</p>

    <h3 class="h5">Test File</h3>
    <pre><code>test/
└── auth_repository_test.dart</code></pre>

    <h3 class="h5">Run AuthRepository Tests</h3>
    <pre><code>flutter test test/auth_repository_test.dart</code></pre>

    <h3 class="h5">Run All Tests</h3>
    <pre><code>flutter test</code></pre>

    <h2 class="mt-4">📊 Test Results</h2>
    <div class="table-responsive">
        <table class="table table-hover table-bordered align-middle">
            <thead class="table-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Repository</th>
                    <th scope="col">Test Case</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">01</th>
                    <td>AuthRepository</td>
                    <td>Register API</td>
                    <td><span class="badge bg-success">✅ Passed</span></td>
                </tr>
                <tr>
                    <th scope="row">02</th>
                    <td>AuthRepository</td>
                    <td>Login API</td>
                    <td><span class="badge bg-success">✅ Passed</span></td>
                </tr>
                <tr>
                    <th scope="row">03</th>
                    <td>AuthRepository</td>
                    <td>Fetch Profile API</td>
                    <td><span class="badge bg-success">✅ Passed</span></td>
                </tr>
                <tr>
                    <th scope="row">04</th>
                    <td>AuthRepository</td>
                    <td>Update Profile API</td>
                    <td><span class="badge bg-success">✅ Passed</span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <h3 class="h4 mt-4">Test Summary</h3>
    <div class="table-responsive">
        <table class="table table-bordered align-middle" style="max-width: 400px;">
            <thead class="table-secondary">
                <tr>
                    <th scope="col">Metric</th>
                    <th scope="col">Result</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Total Tests</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>Passed</td>
                    <td class="text-success font-weight-bold">4 ✅</td>
                </tr>
                <tr>
                    <td>Failed</td>
                    <td class="text-danger font-weight-bold">0 ❌</td>
                </tr>
                <tr>
                    <td>Success Rate</td>
                    <td class="text-primary font-weight-bold">100% 🎉</td>
                </tr>
            </tbody>
        </table>
    </div>

    <h3 class="h4 mt-4">🔍 Test Output</h3>
    <pre><code>00: AuthRepository Register
    ✓ register API should show result

01: AuthRepository Login
    ✓ login API should show result

02: AuthRepository Fetch Profile
    ✓ fetchProfile API should show result

03: AuthRepository Update Profile
    ✓ updateProfile API should show result

────────────────────────────────────────────

✓ All tests passed!</code></pre>

    <h2 class="mt-4">🌐 API Documentation</h2>

    <h3 class="h5 mt-3">1. 📝 Register API</h3>
    <p><strong>Response</strong></p>
    <pre><code>{
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
}</code></pre>
    <p><strong>Status:</strong> <span class="badge bg-success">✅ Passed</span></p>

    <h3 class="h5 mt-3">2. 🔐 Login API</h3>
    <p><strong>Response</strong></p>
    <pre><code>{
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
}</code></pre>
    <p><strong>Status:</strong> <span class="badge bg-success">✅ Passed</span></p>

    <h3 class="h5 mt-3">3. 👤 Fetch Profile API</h3>
    <p><strong>Response</strong></p>
    <pre><code>{
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
}</code></pre>
    <p><strong>Status:</strong> <span class="badge bg-success">✅ Passed</span></p>

    <h3 class="h5 mt-3">4. ✏️ Update Profile API</h3>
    <p><strong>Response</strong></p>
    <pre><code>{
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
}</code></pre>
    <p><strong>Status:</strong> <span class="badge bg-success">✅ Passed</span></p>

    <h3 class="h4 mt-4">📋 API Test Matrix</h3>
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-dark">
                <tr>
                    <th scope="col">API</th>
                    <th scope="col">Response Status</th>
                    <th scope="col">Result</th>
                    <th scope="col">Test</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Register</td>
                    <td><code>true</code></td>
                    <td>User registered successfully</td>
                    <td><span class="badge bg-success">✅ Passed</span></td>
                </tr>
                <tr>
                    <td>Login</td>
                    <td><code>true</code></td>
                    <td>Login successful</td>
                    <td><span class="badge bg-success">✅ Passed</span></td>
                </tr>
                <tr>
                    <td>Fetch Profile</td>
                    <td><code>true</code></td>
                    <td>User profile fetched successfully</td>
                    <td><span class="badge bg-success">✅ Passed</span></td>
                </tr>
                <tr>
                    <td>Update Profile</td>
                    <td><code>true</code></td>
                    <td>User profile updated successfully</td>
                    <td><span class="badge bg-success">✅ Passed</span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <h2 class="mt-4">🚀 Getting Started</h2>
    
    <h3 class="h5">Prerequisites</h3>
    <p>Before running the application, make sure the following are installed:</p>
    <ul>
        <li>Flutter SDK</li>
        <li>Dart SDK</li>
        <li>Android Studio or VS Code</li>
        <li>Android Emulator or Physical Android Device</li>
    </ul>

    <h3 class="h5 mt-3">Installation</h3>
    <p><strong>1. Clone the Repository</strong></p>
    <pre><code>git clone &lt;repository-url&gt;</code></pre>

    <p><strong>2. Navigate to the Project</strong></p>
    <pre><code>cd vehicle_repair_service</code></pre>

    <p><strong>3. Install Dependencies</strong></p>
    <pre><code>flutter pub get</code></pre>

    <p><strong>4. Run the Application</strong></p>
    <pre><code>flutter run</code></pre>

    <h2 class="mt-4">🏗️ Architecture</h2>
    <p>The project follows a repository-based architecture.</p>
    <pre><code>┌─────────────────────┐
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
│       REST API      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│    Backend Server   │
└─────────────────────┘</code></pre>

    <h3 class="h5 mt-3">AuthRepository Responsibilities</h3>
    <ul>
        <li>Handle authentication requests</li>
        <li>Handle profile requests</li>
        <li>Communicate with REST APIs</li>
        <li>Process API responses</li>
        <li>Keep API logic separate from UI</li>
    </ul>

    <h2 class="mt-4">🔄 Authentication Flow</h2>
    <pre><code>User
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
Flutter UI</code></pre>

    <h2 class="mt-4">📈 Current Test Status</h2>
    <div class="table-responsive">
        <table class="table table-bordered align-middle" style="max-width: 500px;">
            <thead class="table-secondary">
                <tr>
                    <th scope="col">Component</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Register API</td>
                    <td><span class="badge bg-success">🟢 Working</span></td>
                </tr>
                <tr>
                    <td>Login API</td>
                    <td><span class="badge bg-success">🟢 Working</span></td>
                </tr>
                <tr>
                    <td>Fetch Profile API</td>
                    <td><span class="badge bg-success">🟢 Working</span></td>
                </tr>
                <tr>
                    <td>Update Profile API</td>
                    <td><span class="badge bg-success">🟢 Working</span></td>
                </tr>
                <tr>
                    <td>AuthRepository</td>
                    <td><span class="badge bg-success">🟢 Working</span></td>
                </tr>
                <tr>
                    <td>Unit Tests</td>
                    <td><span class="badge bg-success">🟢 Passing</span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <h2 class="mt-4">🎯 Final Result</h2>
    <p><code>AuthRepository</code> API integration is working as expected.</p>
    <p>All 4 authentication APIs have been successfully tested.</p>

    <div class="table-responsive">
        <table class="table table-bordered align-middle" style="max-width: 400px;">
            <thead class="table-secondary">
                <tr>
                    <th scope="col">Result</th>
                    <th scope="col">Value</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Total APIs Tested</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>Successful APIs</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>Failed APIs</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>Success Rate</td>
                    <td>100%</td>
                </tr>
                <tr>
                    <td>Overall Status</td>
                    <td><span class="badge bg-success">🟢 PASS</span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <h2 class="mt-4">✅ Conclusion</h2>
    <p>The <code>AuthRepository</code> API integration has been successfully implemented and tested.</p>
    <p>The following authentication operations are working correctly:</p>
    <ul>
        <li>✅ Register API</li>
        <li>✅ Login API</li>
        <li>✅ Fetch Profile API</li>
        <li>✅ Update Profile API</li>
    </ul>

    <h2 class="mt-4">🎉 Final Test Result</h2>
    <p><strong>4 / 4 Tests Passed</strong></p>
    <p><strong>100% Success Rate</strong></p>
    <p>Authentication Integration: <span class="badge bg-success">🟢 Working</span></p>

    <h2 class="mt-4">📌 Project Status</h2>
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle" style="max-width: 500px;">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Module</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Authentication</td>
                    <td><span class="badge bg-success">🟢 Completed</span></td>
                </tr>
                <tr>
                    <td>Register</td>
                    <td><span class="badge bg-success">🟢 Completed</span></td>
                </tr>
                <tr>
                    <td>Login</td>
                    <td><span class="badge bg-success">🟢 Completed</span></td>
                </tr>
                <tr>
                    <td>Fetch Profile</td>
                    <td><span class="badge bg-success">🟢 Completed</span></td>
                </tr>
                <tr>
                    <td>Update Profile</td>
                    <td><span class="badge bg-success">🟢 Completed</span></td>
                </tr>
                <tr>
                    <td>Unit Testing</td>
                    <td><span class="badge bg-success">🟢 Completed</span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <h2 class="mt-4">📄 License</h2>
    <p>This project is developed for the Vehicle Repair Service application.</p>

    <h2 class="mt-4">⭐ Support</h2>
    <p>If you find this project useful, consider giving the repository a ⭐.</p>

    <hr class="my-4">

    <p class="h5 text-center text-muted">Vehicle Repair Service</p>
    <p class="text-center text-secondary small">Flutter • Dart • REST API • AuthRepository • Unit Testing</p>

</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

If you find this project useful, consider giving the repository a ⭐.

Vehicle Repair Service

Flutter • Dart • REST API • AuthRepository • Unit Testing
