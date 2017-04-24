#!/usr/bin/env bats

SITE=test/_site

_test() {
  result=$(xmllint --xpath "$1" "$SITE/$2")
}

@test "File exists: /index.html" {
  [ -f "$SITE/index.html" ]
}
