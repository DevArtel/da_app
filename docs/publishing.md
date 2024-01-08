// TODO: notes on publishing, not structured yet
- Create Firebase project manually
- Create Testers group (called `test-team` by default) in Firebase project
- Use Google provided signing key
- Enable Google Play Android Developer API (Fastlane will tell you about it) https://console.cloud.google.com/apis/library/androidpublisher.googleapis.com?project=da-app-407119
- Before uploading Android app to any track in Play Console, you must upload at least one release manually
- https://developer.apple.com/account/resources/identifiers/list Register bundle id.
- Once you generated certificates and profiles using fastlane match you must update signing settings. There are two ways:
    - With fastlane [update_project_provisioning](https://docs.fastlane.tools/actions/update_project_provisioning/)
    - Manually. Open XCode, select "Runner" in Targets section, then choose "Signing & Capabilities" tab and select your Team for each build type.