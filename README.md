

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Vehicle Repair Service - Auth Repository Testing</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <style>
        body {
            background: #f5f7fb;
        }

        .hero {
            background: linear-gradient(135deg, #0d6efd, #084298);
            color: #fff;
            border-radius: 18px;
        }

        .hero-icon {
            font-size: 45px;
        }

        .section-card {
            border: 0;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.06);
        }

        .stat-card {
            border: 0;
            border-radius: 14px;
            transition: 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-3px);
        }

        .stat-number {
            font-size: 30px;
            font-weight: 700;
        }

        .code-box {
            background: #212529;
            color: #f8f9fa;
            border-radius: 10px;
            padding: 18px;
            font-size: 14px;
            overflow-x: auto;
            white-space: pre-wrap;
        }

        .terminal {
            background: #111827;
            color: #22c55e;
            border-radius: 10px;
            padding: 18px;
            font-family: monospace;
            overflow-x: auto;
        }

        .table > :not(caption) > * > * {
            padding: 14px;
        }

        .api-title {
            border-left: 4px solid #0d6efd;
            padding-left: 12px;
        }

        .success-box {
            background: #d1e7dd;
            border: 1px solid #a3cfbb;
            color: #0f5132;
            border-radius: 12px;
        }

        footer {
            color: #6c757d;
        }
    </style>
</head>

<body>

    <div class="container py-4">

        <!-- HERO -->
        <div class="hero p-4 p-md-5 mb-4 shadow-sm">
            <div class="row align-items-center">

                <div class="col-md-8">
                    <div class="hero-icon mb-2">🚗</div>

                    <h1 class="fw-bold">
                        Vehicle Repair Service
                    </h1>

                    <p class="lead mb-0">
                        Flutter-based Vehicle Repair Service Application
                    </p>
                </div>

                <div class="col-md-4 text-md-end mt-4 mt-md-0">
                    <span class="badge bg-success fs-6 px-3 py-2">
                        ✓ 4/4 Tests Passed
                    </span>
                </div>

            </div>
        </div>


        <!-- AUTH REPOSITORY -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h2 class="fw-bold mb-3">
                    🧪 Auth Repository Testing
                </h2>

                <p class="text-muted mb-0">
                    The <strong>AuthRepository</strong> has been tested using
                    Flutter's built-in testing framework to verify the
                    authentication API integration.
                </p>

            </div>
        </div>


        <!-- RUN TEST -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h4 class="fw-bold mb-3">
                    ▶️ Run Tests
                </h4>

                <div class="terminal">
                    flutter test test/auth_repository_test.dart
                </div>

            </div>
        </div>


        <!-- TEST COVERAGE -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h4 class="fw-bold mb-4">
                    📋 Test Coverage
                </h4>

                <div class="row g-3">

                    <div class="col-md-3 col-sm-6">
                        <div class="border rounded-3 p-3 bg-light">
                            <span class="text-success fs-5">✓</span>
                            Register API
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="border rounded-3 p-3 bg-light">
                            <span class="text-success fs-5">✓</span>
                            Login API
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="border rounded-3 p-3 bg-light">
                            <span class="text-success fs-5">✓</span>
                            Fetch Profile API
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="border rounded-3 p-3 bg-light">
                            <span class="text-success fs-5">✓</span>
                            Update Profile API
                        </div>
                    </div>

                </div>

            </div>
        </div>


        <!-- TEST RESULTS -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h4 class="fw-bold mb-4">
                    📊 Test Results
                </h4>

                <div class="table-responsive">

                    <table class="table table-hover align-middle">

                        <thead class="table-dark">
                            <tr>
                                <th>#</th>
                                <th>Repository</th>
                                <th>API</th>
                                <th>Status</th>
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
                                <td>1</td>
                                <td>AuthRepository</td>
                                <td>Register</td>
                                <td>
                                    <span class="badge bg-success">
                                        ✓ Passed
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td>AuthRepository</td>
                                <td>Login</td>
                                <td>
                                    <span class="badge bg-success">
                                        ✓ Passed
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>3</td>
                                <td>AuthRepository</td>
                                <td>Fetch Profile</td>
                                <td>
                                    <span class="badge bg-success">
                                        ✓ Passed
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>4</td>
                                <td>AuthRepository</td>
                                <td>Update Profile</td>
                                <td>
                                    <span class="badge bg-success">
                                        ✓ Passed
                                    </span>
                                </td>
                            </tr>

                        </tbody>

                    </table>

                </div>

            </div>
        </div>


        <!-- TEST OUTPUT -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h4 class="fw-bold mb-4">
                    🔍 Test Output
                </h4>

                <div class="terminal">

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

                </div>

            </div>
        </div>


        <!-- SUMMARY -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h4 class="fw-bold mb-4">
                    📈 Test Summary
                </h4>

                <div class="row g-3">

                    <div class="col-lg-3 col-md-6">
                        <div class="card stat-card bg-primary text-white">
                            <div class="card-body">
                                <small>Total APIs Tested</small>
                                <div class="stat-number">4</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card stat-card bg-success text-white">
                            <div class="card-body">
                                <small>Passed</small>
                                <div class="stat-number">4</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card stat-card bg-danger text-white">
                            <div class="card-body">
                                <small>Failed</small>
                                <div class="stat-number">0</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card stat-card bg-dark text-white">
                            <div class="card-body">
                                <small>Success Rate</small>
                                <div class="stat-number">100%</div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>


        <!-- API RESPONSE -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h4 class="fw-bold mb-4">
                    🌐 API Response Examples
                </h4>


                <!-- Register -->
                <h5 class="api-title mb-3">
                    1. Register API
                </h5>

                <div class="code-box mb-4">
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
                </div>


                <!-- Login -->
                <h5 class="api-title mb-3">
                    2. Login API
                </h5>

                <div class="code-box mb-4">
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
                </div>


                <!-- Fetch Profile -->
                <h5 class="api-title mb-3">
                    3. Fetch Profile API
                </h5>

                <div class="code-box mb-4">
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
                </div>


                <!-- Update Profile -->
                <h5 class="api-title mb-3">
                    4. Update Profile API
                </h5>

                <div class="code-box">
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
                </div>

            </div>
        </div>


        <!-- FINAL RESULT -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h4 class="fw-bold mb-4">
                    🎯 Final Result
                </h4>

                <div class="table-responsive">

                    <table class="table table-bordered align-middle">

                        <tbody>

                            <tr>
                                <th class="bg-light">Total APIs Tested</th>
                                <td>4</td>
                            </tr>

                            <tr>
                                <th class="bg-light">Passed</th>
                                <td>
                                    <span class="badge bg-success">
                                        4
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <th class="bg-light">Failed</th>
                                <td>
                                    <span class="badge bg-danger">
                                        0
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <th class="bg-light">Success Rate</th>
                                <td>
                                    <span class="badge bg-success">
                                        100%
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <th class="bg-light">Repository</th>
                                <td>
                                    <code>AuthRepository</code>
                                </td>
                            </tr>

                        </tbody>

                    </table>

                </div>

            </div>
        </div>


        <!-- CONCLUSION -->
        <div class="card section-card mb-4">
            <div class="card-body p-4">

                <h4 class="fw-bold mb-3">
                    ✅ Conclusion
                </h4>

                <div class="success-box p-4">
                    The <strong>AuthRepository</strong> API integration is
                    working correctly, and all <strong>4 authentication
                    API tests</strong> passed successfully.
                </div>

            </div>
        </div>


        <!-- FOOTER -->
        <footer class="text-center py-3">
            Vehicle Repair Service © 2026
        </footer>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>


Is design mein Bootstrap 5 + responsive layout + professional cards + badges + API code blocks + test summary hai. Mobile, tablet aur desktop teeno par properly adjust hoga.
