# Vehicle Repair MCP Server

Exposes the Vehicle Repair Service REST API as MCP tools, so the Flutter app's
AI assistant can search services, list vehicle types, list plans and book
appointments.

## Tools

| Tool | Calls | Purpose |
|---|---|---|
| `search_services` | `POST /api/searchService` (multipart) | Search the catalogue by keyword |
| `list_vehicle_types` | `GET /api/getAllCategory` | Distinct `vehicle_type` values |
| `list_plans` | `POST /api/fetchPlan` | Subscription plans and pricing |
| `book_appointment` | `POST /api/bookAppointment` (multipart) | Create a real booking |

Endpoint paths and field names are copied from the app's own BLoCs
(`ServiceBloc`, `CategoryBloc`, `SubscriptionBloc`, `BookBloc`), not guessed.

## Run

```bash
cd mcp_server
dart pub get
dart run bin/server.dart
```

The server reads `../.env` automatically, so the API URLs match the app.

```
MCP server listening on http://0.0.0.0:8080/mcp
API base URL: https://your-api.example.com
Allowed hosts: 127.0.0.1, localhost, 10.0.2.2
Env file: ../.env
```

### Environment

Environment variables win over `.env`.

| Variable | Default | Notes |
|---|---|---|
| `REPAIR_API_BASE_URL` | `.env` `MCP_API_BASE_URL`, then `BASE_URL` | API host |
| `MCP_HOST` | `0.0.0.0` | `0.0.0.0` lets the emulator reach it |
| `MCP_PORT` | `8080` | |
| `MCP_ALLOWED_HOSTS` | `127.0.0.1,localhost,10.0.2.2` | DNS-rebinding allowlist |
| `ENV_FILE` | `../.env` | Path to the dotenv file |

The endpoint paths come from `.env` too: `SEARCH_SERVICE`, `FETCH_CAT_API`,
`FETCH_PLAN`, `BOOK_APPOINTMENT`.

## Authentication

The server is **not** an auth authority. It relays the signed-in user's
credentials to the REST API:

* the Flutter app sends `Authorization: Bearer <token>` and `X-User-Id: <uid>`
  on every MCP request (see `McpAiService`),
* `StreamableMcpServer.authenticator` copies them into `RequestContext`,
* `RepairApi` forwards them to the API.

No token configured means the API answers `401 No Token Provided`, which the
model receives as a normal tool error.

## Reaching it from the app

| Client | `MCP_URL` |
|---|---|
| Android emulator | `http://10.0.2.2:8080/mcp` |
| iOS simulator | `http://127.0.0.1:8080/mcp` |
| Real device | `http://<your-LAN-IP>:8080/mcp` (add the IP to `MCP_ALLOWED_HOSTS`) |

## Structure

```
bin/server.dart                 # config, .env loading, token capture, transport
lib/src/dot_env.dart            # .env parser (same rules as flutter_dotenv)
lib/src/request_context.dart    # token + uid forwarded from the app
lib/src/repair_api.dart         # HTTP client, no mcp_dart imports
lib/mcp/mcp.dart                # createMcpServer(api) — the only server factory
lib/mcp/tools/base_tool.dart    # BaseTool, registerBaseTool, guard()
lib/mcp/tools/*_tool.dart       # one adapter per tool
```

`guard()` converts every failure (domain error, timeout, unexpected exception)
into `CallToolResult(isError: true)` with a readable message. Without it the SDK
replaces the real cause with `Tool execution failed.`

## Verify

```bash
dart analyze          # must be clean
dart run bin/server.dart
```

Then in the app open **AI Assistant** and ask
*"What does a brake pad replacement cost?"*. The log should show:

```
MCP connected with 4 tools: search_services, list_vehicle_types, list_plans, book_appointment
```
