#!/bin/sh

if ! which swiftlint > /dev/null; then
  echo "error: Carthage is not installed. Visit https://github.com/Carthage/Carthage to learn more."
  exit 1
fi

carthage bootstrap \
  --platform iOS \
  --no-use-binaries \
  --cache-builds
