# AI Assistant — Step by Step

You need **two terminals**: one runs the MCP server, one runs the Flutter app.

```
Terminal 1  →  MCP server (port 8080)  →  your REST API
Terminal 2  →  Flutter app             →  MCP server  →  Gemini
```

---

## Step 1 — Get a Gemini API key (2 minutes)

1. Open https://aistudio.google.com/apikey
2. Sign in with your Google account
3. Click **Create API key**
4. Copy the key (starts with `AIza...`)

---

## Step 2 — Start the MCP server

```bash
cd /Users/sunilshedge/StudioProjects/vehiclerepairservice/mcp_server
dart pub get
dart run bin/server.dart
```

No environment variables needed — the server reads `../.env` by itself.

✅ **Success looks like this:**

```
MCP server listening on http://0.0.0.0:8080/mcp
API base URL: https://vehicle-repair-service.vercel.app
Allowed hosts: 127.0.0.1, localhost, 10.0.2.2
Env file: ../.env
```

⚠️ **Leave this terminal open.** If you close it, the assistant stops working.

### Which API does it call?

`MCP_API_BASE_URL` in `.env` (line 38). It is set to your Vercel deployment.
To use your local backend instead, change that one line:

```
MCP_API_BASE_URL=http://10.247.141.213:4000
```

(`BASE_URL` on line 1 is what the app uses. It points at the local backend,
which must be running for the app to work.)

---

## Step 3 — Add your Gemini key

Open `/Users/sunilshedge/StudioProjects/vehiclerepairservice/.env`,
**line 35**:

```
GEMINI_API_KEY=AIzaSy...your-key-here
```

---

## Step 4 — `MCP_URL` is already set

Line 36:

```
MCP_URL=http://10.0.2.2:8080/mcp
```

That is correct **for the Android emulator only**:

| Running on | `MCP_URL` |
|---|---|
| Android emulator | `http://10.0.2.2:8080/mcp` ✅ already set |
| iOS simulator | `http://127.0.0.1:8080/mcp` |
| Real phone | `http://<your-Mac-IP>:8080/mcp` |

For a real phone, also add your Mac's IP to the allowlist:

```bash
MCP_ALLOWED_HOSTS="127.0.0.1,localhost,10.0.2.2,192.168.1.50" dart run bin/server.dart
```

---

## Step 5 — Run the app

Open a **second terminal**:

```bash
cd /Users/sunilshedge/StudioProjects/vehiclerepairservice
flutter run
```

---

## Step 6 — Sign in first

The assistant calls the API **as you**. The app forwards your session token to
the MCP server, so you must be logged in before asking anything.

---

## Step 7 — Open the AI Assistant

1. On the **Dashboard**, look at the top-right corner
2. Tap the **✨ sparkle icon** (next to the bell)

You'll see *"How can I help with your vehicle?"*.

---

## Step 8 — Ask a question

```
What does a brake pad replacement cost?
```

**What should happen:**

1. Your message appears on the right
2. A small spinner shows
3. Gemini calls `search_services`
4. The MCP server calls your REST API with your token
5. An answer appears on the left

**Check Terminal 1** — you should see:

```
MCP connected with 4 tools: search_services, list_vehicle_types, list_plans, book_appointment
```

---

## If something goes wrong

| Message you see | What it means | Fix |
|---|---|---|
| `MCP_URL is missing from .env` | Line 36 missing | Add `MCP_URL=http://10.0.2.2:8080/mcp` |
| `GEMINI_API_KEY is missing from .env` | Line 35 empty | Paste your key after `=` |
| `Could not reach the assistant service` | Server not running | Check Terminal 1; check `MCP_URL` |
| `SocketException` / connection refused | Emulator can't find the server | Use `10.0.2.2`, not `localhost` |
| `No Token Provided` | You are not signed in | Log out and log in again, reopen ✨ |
| `Please Re-Login token expired !!!` | Session expired | Log out and log in again |
| `HTTP 404 from /api/...` | Endpoint path differs | Check the `*_API` keys in `.env` |
| `Gemini 400` | Bad request | Usually a tool schema issue — check Terminal 1 logs |
| `The repair service did not respond in time` | API timeout (25 s) | Retry, or check the backend |

---

## Quick checklist

- [ ] Gemini key pasted into `.env` line 35
- [ ] MCP server running in Terminal 1
- [ ] Signed in inside the app
- [ ] Tapped ✨ on the dashboard
- [ ] Asked a question and got an answer

---

## What you built (for your resume/LinkedIn)

- **MCP server** in Dart exposing 4 tools over Streamable HTTP
- **Gemini 2.5 Flash** with automatic, multi-round function calling
- **Credential forwarding**: the app's bearer token reaches the REST API through
  the MCP layer without ever being exposed to the model
- **Flutter BLoC** chat architecture: `AiChatEvent` → `AiChatBloc` → `AiChatState`
- Clean separation: `lib/src/` = API logic, `lib/mcp/tools/` = thin adapters
