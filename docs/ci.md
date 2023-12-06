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
- `PLAY_STORE_DEPLOY_JSON` – credentials of Google Play Console service account. 
  - To obtain these credentials follow [this manual](https://docs.fastlane.tools/actions/upload_to_play_store/).

iOS:
- `IOS_BUNDLE_ID` – identifier of the iOS app (like `io.devartel.daapp`).
- `MATCH_USERNAME` – Apple ID Username (refer to [Match doc](https://docs.fastlane.tools/actions/match/) for more info).
- `MATCH_GITHUB_BASIC_AUTH` – GitHub Token for access to Profiles repository.  
- `MATCH_GIT_URL` – URL to the git repo containing all the certificates (refer to [Match doc](https://docs.fastlane.tools/actions/match/) for more info).
- `MATCH_PASSWORD` – passphrase to decrypt your profiles (refer to [Match doc](https://docs.fastlane.tools/actions/match/) for more info).
- `ITUNES_API_KEY_ID` – ID of App Store Connect API Key.
  - To obtain this key follow [this manual](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api).
- `ITUNES_API_KEY_ISSUER_ID` – ID of issuer for App Store Connect API Key.
- `ITUNES_API_KEY` – JWT for authorization in App Store Connect API. 
  - To obtain this key follow [this manual](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api).
- `FASTLANE_IOS_TEAM_ID` – Developer Portal Team ID.
  - [Here is a description](https://developer.apple.com/help/account/manage-your-team/locate-your-team-id/) how to get Team ID.
- `FASTLANE_IOS_ITC_TEAM_ID` – App Store Connect Team ID.

Firebase:
- `FIREBASE_TOKEN`
- `FIREBASE_SERVICE_ACCOUNT`
- `FIREBASE_APP_ID`

Misc:
- `SLACK_WEBHOOK_URL` – Slack Webhook URL to report job statuses.
  - To obtain this URL follow [this manual](https://api.slack.com/messaging/webhooks).