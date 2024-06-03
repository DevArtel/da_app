#!/bin/bash

set -eo pipefail

# Delete all generated files
find . -type f \( -name \*.g.dart -o -name \*.freezed.dart -o -name \*.gen.dart -o -name \*.lock \) -delete

# If the script runs on macOS, clean pod cache
if [[ $OSTYPE == 'darwin'* ]]
then
  pod cache clean --all
fi

