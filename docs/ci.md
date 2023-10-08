Continuous integration
===

### Tools used

The project contains GitHub Actions scripts to build artifacts for bot Android and iOS and distribute them.
We use Fastlane to upload Android app to Firebase App Distribution and to Play Store, and to install profiles, 
sign iOS app and upload it to Firebase App Distribution and iTunes Connect.

### Build environment

To enable CI you should add few variables to GitHub secrets.

Android:
- `ANDROID_RELEASE_KEY` – base64 of [Signing key](https://developer.android.com/studio/publish/app-signing#certificates-keystores). It must be Upload key.
  - To generate this key follow [this manual](https://developer.android.com/studio/publish/app-signing#generate-key). 
- `ANDROID_KEYSTORE_PASSWORD` – a password for App signing keystore.
- `ANDROID_KEY_PASSWORD` – a password for App signing key (key alias inside keystore).
- `PLAYSTORE_DEPLOY_JSON` – credentials of Google Play Console service account. 
  - To obtain these credentials follow [this manual](https://docs.fastlane.tools/actions/upload_to_play_store/).

iOS:
- `IOS_BUNDLE_ID`
- `IOS_CERT_USERNAME`
- `IOS_CERT_GIT_URL`
- `MATCH_PASSWORD`
- `ITUNES_API_KEY`
- `FASTLANE_IOS_TEAM_ID`
- `FASTLANE_IOS_ITC_TEAM_ID`

- `GITHUB_TOKEN`

- `SLACK_WEBHOOK_URL`

- `FIREBASE_TOKEN`
- `FIREBASE_SERVICE_ACCOUNT`
- `FIREBASE_APP_ID`
- `FIREBASE_CLI_TOKEN`
