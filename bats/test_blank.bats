#!/usr/bin/env bats

# recursive: false
# pattern: "*.{jpg}"

SITE=test/_site
FLAT="flat/index.html"
NONE="none/index.html"
RECURS="recursive/index.html"

_test() {
  result=$(xmllint --xpath "$1" "$SITE/$2")
}

##
# Flat
##
@test "File exists: $FLAT (flat)" {
  [ -f "$SITE/$FLAT" ]
}
@test "$FLAT: <a> blue.gif" {
  _test 'string(//a[1]/@href)' "$FLAT"
  [ "$result" = '/flat/blue.gif' ]
}
@test "$FLAT: <a> blue_upper.GIF" {
  _test 'string(//a[2]/@href)' "$FLAT"
  [ "$result" = '/flat/blue_upper.GIF' ]
}
@test "$FLAT: <a> green.jpg" {
  _test 'string(//a[3]/@href)' "$FLAT"
  [ "$result" = '/flat/green.jpg' ]
}
@test "$FLAT: <a> green_upper.JPG" {
  _test 'string(//a[4]/@href)' "$FLAT"
  [ "$result" = '/flat/green_upper.JPG' ]
}
@test "$FLAT: <a> red.png" {
  _test 'string(//a[5]/@href)' "$FLAT"
  [ "$result" = '/flat/red.png' ]
}
@test "$FLAT: <a> red_upper.PNG" {
  _test 'string(//a[6]/@href)' "$FLAT"
  [ "$result" = '/flat/red_upper.PNG' ]
}
@test "$FLAT: <a> yellow.jpeg" {
  _test 'string(//a[7]/@href)' "$FLAT"
  [ "$result" = '/flat/yellow.jpeg' ]
}
@test "$FLAT: <a> yellow_upper.JPEG" {
  _test 'string(//a[8]/@href)' "$FLAT"
  [ "$result" = '/flat/yellow_upper.JPEG' ]
}

##
# none
##
@test "File exists: $NONE (none)" {
  [ -f "$SITE/$NONE" ]
}
@test "$NONE: no <a>" {
  _test 'string(//a[1]/@href)' "$NONE"
  [ "$result" = '' ]
}

##
# recursive
##
@test "File exists: $RECURS (recursive)" {
  [ -f "$SITE/$RECURS" ]
}
@test "$RECURS: <a> green.jpg" {
  _test 'string(//a[1]/@href)' "$RECURS"
  [ "$result" = '/recursive/green.jpg' ]
}
@test "$RECURS: <a> 2: empty" {
  _test 'string(//a[2]/@href)' "$RECURS"
  [ "$result" = '' ]
}
