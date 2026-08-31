<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Vehicle Repair Service - Auth Repository</title>

    <!-- Bootstrap 5 -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

    <style>
        body {
            background: #ffffff;
            color: #24292f;
            font-family:
                -apple-system,
                BlinkMacSystemFont,
                "Segoe UI",
                Helvetica,
                Arial,
                sans-serif;
            font-size: 16px;
            line-height: 1.6;
        }

        .github-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 40px 24px 80px;
        }

        /* GitHub Typography */

        h1 {
            font-size: 2rem;
            font-weight: 600;
            padding-bottom: 0.3em;
            border-bottom: 1px solid #d0d7de;
            margin-bottom: 24px;
        }

        h2 {
            font-size: 1.5rem;
            font-weight: 600;
            padding-bottom: 0.3em;
            border-bottom: 1px solid #d8dee4;
            margin-top: 35px;
            margin-bottom: 20px;
        }

        h3 {
            font-size: 1.25rem;
            font-weight: 600;
            margin-top: 25px;
            margin-bottom: 15px;
        }

        p {
            margin-bottom: 16px;
        }

        /* Hero */

        .project-title {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .project-description {
            color: #57606a;
            font-size: 18px;
            margin-bottom: 25px;
        }

        /* GitHub badges */

        .badge-github {
            display: inline-block;
            padding: 3px 10px;
            margin-right: 5px;
            margin-bottom: 5px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 500;
        }

        .badge-green {
            background: #dafbe1;
            color: #1a7f37;
            border: 1px solid #aceebb;
        }

        .badge-blue {
            background: #ddf4ff;
            color: #0969da;
            border: 1px solid #80ccff;
        }

        .badge-gray {
            background: #f6f8fa;
            color: #57606a;
            border: 1px solid #d0d7de;
        }

        /* Code */

        code {
            background: #afb8c133;
            color: #24292f;
            padding: 0.15em 0.3em;
            border-radius: 6px;
            font-size: 85%;
        }

        pre {
            background: #f6f8fa;
            border: 1px solid #d0d7de;
            border-radius: 6px;
            padding: 16px;
            overflow-x: auto;
            font-size: 14px;
            line-height: 1.45;
            margin-bottom: 20px;
        }

        pre code {
            background: transparent;
            padding: 0;
            color: #24292f;
            font-size: inherit;
        }

        .terminal {
            background: #161b22;
            color: #e6edf3;
            border: 1px solid #30363d;
        }

        .terminal code {
            color: #e6edf3;
        }

        /* Table */

        .github-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .github-table th,
        .github-table td {
            border: 1px solid #d0d7de;
            padding: 8px 13px;
            text-align: left;
        }

        .github-table th {
            background: #f6f8fa;
            font-weight: 600;
        }

        .github-table tr:nth-child(even) {
            background: #f6f8fa;
        }

        /* Alert */

        .github-alert {
            padding: 16px;
            border: 1px solid #aceebb;
            border-radius: 6px;
            background: #dafbe1;
            color: #1a7f37;
            margin: 20px 0;
        }

        /* API response */

        .api-section {
            margin-bottom: 30px;
        }

        .api-number {
            color: #0969da;
        }

        /* List */

        ul {
            padding-left: 2em;
        }

        li {
            margin-bottom: 6px;
        }

        /* Horizontal line */

        hr {
            border: 0;
            border-top: 1px solid #d8dee4;
            margin: 32px 0;
        }

        /* Summary cards */

        .summary {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
            margin: 20px 0;
        }

        .summary-item {
            border: 1px solid #d0d7de;
            border-radius: 6px;
            padding: 16px;
            text-align: center;
            background: #ffffff;
        }

        .summary-number {
            display: block;
            font-size: 24px;
            font-weight: 600;
        }

        .summary-label {
            color: #57606a;
            font-size: 13px;
        }

        .success {
            color: #1a7f37;
        }

        .danger {
            color: #cf222e;
        }

        /* Mobile */

        @media (max-width: 768px) {
            .github-container {
                padding: 25px 15px 50px;
            }

            .project-title {
                font-size: 26px;
            }

            h1 {
                font-size: 28px;
            }

            h2 {
                font-size: 22px;
            }

            .summary {
                grid-template-columns: repeat(2, 1fr);
            }

            .github-table {
                font-size: 14px;
            }

            pre {
                font-size: 12px;
            }
        }

        @media (max-width: 480px) {
            .summary {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
</head>

<body>

<div class="github-container">

    <!-- Project Header -->

    <h1 class="project-title">
        🚗 Vehicle Repair Service
    </h1>

    <p class="project-description">
        A Flutter-based vehicle repair service application.
    </p>

    <div class="mb-4">
        <span class="badge-github badge-blue">
            Flutter
        </span>

        <span class="badge-github badge-gray">
            Dart
        </span>

        <span class="badge-github badge-green">
            Tests Passing
        </span>

        <span class="badge-github badge-gray">
            AuthRepository
        </span>
    </div>


    <!-- Unit Testing -->

    <h2>🧪 Unit Testing — Auth Repository</h2>

    <p>
        The <code>AuthRepository</code> has been tested using
        Flutter's built-in testing framework to verify the
        authentication API integration.
    </p>


    <!-- Run Test -->

    <h2>▶️ Run Tests</h2>

    <pre class="terminal"><code>flutter test test/auth_repository_test.dart</code></pre>


    <!-- Coverage -->

    <h2>📋 Test Coverage</h2>

    <ul>
        <li>✅ Register API</li>
        <li>✅ Login API</li>
        <li>✅ Fetch Profile API</li>
        <li>✅ Update Profile API</li>
    </ul>


    <!-- Test Results -->

    <h2>📊 Test Results</h2>

    <div class="table-responsive">

        <table class="github-table">

            <thead>
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
                    <td><code>AuthRepository</code></td>
                    <td>Register API</td>
                    <td class="success">✅ Passed</td>
                </tr>

                <tr>
                    <td>2</td>
                    <td><code>AuthRepository</code></td>
                    <td>Login API</td>
                    <td class="success">✅ Passed</td>
                </tr>

                <tr>
                    <td>3</td>
                    <td><code>AuthRepository</code></td>
                    <td>Fetch Profile API</td>
                    <td class="success">✅ Passed</td>
                </tr>

                <tr>
                    <td>4</td>
                    <td><code>AuthRepository</code></td>
                    <td>Update Profile API</td>
                    <td class="success">✅ Passed</td>
                </tr>

            </tbody>

        </table>

    </div>


    <!-- Test Output -->

    <h2>🔍 Test Output</h2>

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


    <!-- Summary -->

    <h2>📈 Test Summary</h2>

    <div class="summary">

        <div class="summary-item">
            <span class="summary-number">4</span>
            <span class="summary-label">APIs Tested</span>
        </div>

        <div class="summary-item">
            <span class="summary-number success">4</span>
            <span class="summary-label">Passed</span>
        </div>

        <div class="summary-item">
            <span class="summary-number danger">0</span>
            <span class="summary-label">Failed</span>
        </div>

        <div class="summary-item">
            <span class="summary-number success">100%</span>
            <span class="summary-label">Success Rate</span>
        </div>

    </div>


    <!-- API Responses -->

    <h2>🌐 API Response Examples</h2>


    <div class="api-section">

        <h3>
            <span class="api-number">1.</span>
            Register API
        </h3>

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

    </div>


    <div class="api-section">

        <h3>
            <span class="api-number">2.</span>
            Login API
        </h3>

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

    </div>


    <div class="api-section">

        <h3>
            <span class="api-number">3.</span>
            Fetch Profile API
        </h3>

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

    </div>


    <div class="api-section">

        <h3>
            <span class="api-number">4.</span>
            Update Profile API
        </h3>

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

    </div>


    <!-- Final Result -->

    <h2>🎯 Final Result</h2>

    <div class="table-responsive">

        <table class="github-table">

            <tbody>

                <tr>
                    <th>Total APIs Tested</th>
                    <td>4</td>
                </tr>

                <tr>
                    <th>Passed</th>
                    <td class="success">
                        <strong>4</strong>
                    </td>
                </tr>

                <tr>
                    <th>Failed</th>
                    <td class="danger">
                        <strong>0</strong>
                    </td>
                </tr>

                <tr>
                    <th>Success Rate</th>
                    <td class="success">
                        <strong>100%</strong>
                    </td>
                </tr>

                <tr>
                    <th>Repository</th>
                    <td>
                        <code>AuthRepository</code>
                    </td>
                </tr>

            </tbody>

        </table>

    </div>


    <!-- Conclusion -->

    <h2>✅ Conclusion</h2>

    <div class="github-alert">

        The <strong>AuthRepository</strong> API integration is working
        correctly, and all <strong>4 authentication API tests</strong>
        passed successfully.

    </div>


    <hr>

    <p class="text-secondary text-center">
        Vehicle Repair Service © 2026
    </p>

</div>


<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>
