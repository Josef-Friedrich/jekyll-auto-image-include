#!/usr/bin/env bats

SITE=test/_site
PAGE="page/index.html"

_test() {
  result=$(xmllint --xpath "$1" "$SITE/$2")
}

@test "File exists: /index.html" {
  [ -f "$SITE/index.html" ]
}

@test "File exists: $PAGE" {
  [ -f "$SITE/$PAGE" ]
}

@test "$PAGE: <a> blue.gif" {
  _test 'string(//a[1]/@href)' "$PAGE"
  [ "$result" = '/page//blue.gif' ]
}
@test "$PAGE: <a> blue_upper.GIF" {
  _test 'string(//a[2]/@href)' "$PAGE"
  [ "$result" = '/page//blue_upper.GIF' ]
}
@test "$PAGE: <a> green.jpg" {
  _test 'string(//a[3]/@href)' "$PAGE"
  [ "$result" = '/page//green.jpg' ]
}
@test "$PAGE: <a> green_upper.JPG" {
  _test 'string(//a[4]/@href)' "$PAGE"
  [ "$result" = '/page//green_upper.JPG' ]
}
@test "$PAGE: <a> red.png" {
  _test 'string(//a[5]/@href)' "$PAGE"
  [ "$result" = '/page//red.png' ]
}
@test "$PAGE: <a> red_upper.PNG" {
  _test 'string(//a[6]/@href)' "$PAGE"
  [ "$result" = '/page//red_upper.PNG' ]
}
@test "$PAGE: <a> yellow.jpeg" {
  _test 'string(//a[7]/@href)' "$PAGE"
  [ "$result" = '/page//yellow.jpeg' ]
}
@test "$PAGE: <a> yellow_upper.JPEG" {
  _test 'string(//a[8]/@href)' "$PAGE"
  [ "$result" = '/page//yellow_upper.JPEG' ]
}
