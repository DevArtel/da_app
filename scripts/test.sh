#!/bin/bash

set -eo pipefail

rootDir=$(pwd)
for pubspecFile in $(find . -name "pubspec.yaml" | grep -v ".dart_tool"); do
  cd "$(dirname "${pubspecFile}")"

  if [ -d test ]; then
    $rootDir/flutterw test --coverage
  fi

  cd "${rootDir}"
done
