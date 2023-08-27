#!/bin/bash

EXIT_STATUS=0

./flutterw analyze --fatal-infos || EXIT_STATUS=$?
./flutterw pub run dart_code_metrics:metrics analyze lib --fatal-warnings --fatal-style --fatal-performance || EXIT_STATUS=$?

./flutterw pub run dart_code_metrics:metrics check-unused-code lib --fatal-unused || EXIT_STATUS=$?
./flutterw pub run dart_code_metrics:metrics check-unused-files lib --exclude="lib/common/api/generated/*.dart" --fatal-unused || EXIT_STATUS=$?

exit $EXIT_STATUS
