---
name: flutter-golden-testing
description: Create, run, debug, and review Flutter widget golden tests and visual regression tests.
---

# Flutter Golden Testing

## Before coding
- Inspect pubspec.yaml and the existing test directory.
- Identify the installed golden-testing package and version.
- Reuse existing project conventions and supported package APIs.
- Do not upgrade or replace packages unnecessarily.

## Test implementation
- Use flutter_test for widget tests.
- Test important screens and UI states: loading, success, empty, and error.
- Use deterministic fixtures and mock network requests.
- Fix themes, locale, text scale, device size, and fonts where appropriate.
- Wait for asynchronous UI work to settle; avoid arbitrary delays.
- Dispose controllers and other resources correctly.

## Golden comparison
- Capture approved baseline images and compare subsequent renders.
- When a test fails, inspect the mismatch and explain the visual difference.
- Never update baselines automatically just to hide a failure.
- Update a baseline only after reviewing and approving the intended UI change.
- Follow the installed package documentation for baseline generation commands.

## Verification
- Run the relevant test file first.
- Run flutter test.
- Run dart analyze.
- Report exact commands, results, failed tests, and unresolved issues.
