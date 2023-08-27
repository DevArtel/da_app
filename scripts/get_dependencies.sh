#!/bin/bash

set -eo pipefail

rootDir=$(pwd)
for pubspecFile in $(find . -name "pubspec.yaml" | grep -v ".dart_tool"); do
  cd "$(dirname "${pubspecFile}")"
  $rootDir/flutterw pub get
  cd "${rootDir}"
done
