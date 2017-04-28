#!/usr/bin/env bats

# recursive: true
# pattern: "*.{jpg}"

SITE=test/_site
FLAT="flat/index.html"
NONE="none/index.html"
RECURS="recursive/index.html"

_test() {
  result=$(xmllint --xpath "$1" "$SITE/$2")
}

##
# flat
##
@test "File exists: $FLAT (flat)" {
  [ -f "$SITE/$FLAT" ]
}
@test "$FLAT: <a> green.jpg" {
  _test 'string(//a[1]/@href)' "$FLAT"
  [ "$result" = '/flat/green.jpg' ]
}
@test "$FLAT: <a> green_upper.JPG" {
  _test 'string(//a[2]/@href)' "$FLAT"
  [ "$result" = '/flat/green_upper.JPG' ]
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
@test "$RECURS: <a>: level1" {
  _test 'string(//a[2]/@href)' "$RECURS"
  [ "$result" = '/recursive/level1/green.jpg' ]
}
@test "$RECURS: <a>: level2" {
  _test 'string(//a[3]/@href)' "$RECURS"
  [ "$result" = '/recursive/level1/level2/green.jpg' ]
}
@test "$RECURS: <a>: level3" {
  _test 'string(//a[4]/@href)' "$RECURS"
  [ "$result" = '/recursive/level1/level2/level3/green.jpg' ]
}
@test "$RECURS: <a>: level4" {
  _test 'string(//a[5]/@href)' "$RECURS"
  [ "$result" = '/recursive/level1/level2/level3/level4/green.jpg' ]
}
