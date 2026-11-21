/// Gate for smoke tests that call a real backend.
///
/// These tests read BASE_URL from .env (a private LAN address locally), so they
/// cannot run on GitHub Actions. They are skipped by default and only run when
/// explicitly enabled with:
///
///   flutter test --dart-define=RUN_LIVE_API_TESTS=true
///
/// Regenerate coverage with the default command as usual:
///
///   flutter test --coverage
const bool runLiveApiTests = bool.fromEnvironment(
  'RUN_LIVE_API_TESTS',
  defaultValue: false,
);
