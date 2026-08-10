fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios build_ipa_release

```sh
[bundle exec] fastlane ios build_ipa_release
```

Builds the iOS app for release (IPA file)

### ios deploy_to_testflight

```sh
[bundle exec] fastlane ios deploy_to_testflight
```

Deploys the built iOS app to TestFlight

### ios ci_cd_ios

```sh
[bundle exec] fastlane ios ci_cd_ios
```

Complete CI/CD lane: Builds IPA and deploys to TestFlight

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
