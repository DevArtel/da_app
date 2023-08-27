#!/bin/bash

# will make your script exit if any command in a pipeline errors.
set -eo pipefail

rootDir=$(pwd)

echo "Generating icons..."
cd packages/ui_kit

$rootDir/dartw pub global activate spider
$rootDir/dartw pub global run spider build

# I did everything according to doc https://spider.birju.dev/package-assets/ but `spider build` shows
# `no such file` error.
# so at `spider.yaml` I replaced `packages/ui_kit/assets/images` with `assets/images` and with the following script
# I add `packages/ui_kit/` to every generated path.
for file in lib/temp/*; do
  # for mac
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s|'assets/|'packages/ui_kit/assets/|g" $file
  # for linux
  else
    sed -i "s|'assets/|'packages/ui_kit/assets/|g" $file
  fi
done

$rootDir/dartw format -l 120 lib/temp

mv lib/temp/* lib/src/res/
rm -rf lib/temp
