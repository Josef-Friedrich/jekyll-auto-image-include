#! /bin/sh

if [ ! -d ./test/_plugins/ ]; then
  mkdir ./test/_plugins/
fi

_clean() {
  rm -rf ./test/_site/
}

_config() {
  cp -f ./test/_config.yml_"$1" ./test/_config.yml
}

_build() {
  _clean
  if [ -z "$1" ]; then
    _config blank
  else
    _config "$1"
  fi

  cp -f ./lib/jekyll-auto-image-include.rb ./test/_plugins/
  bundle exec jekyll build --source ./test --destination ./test/_site
}

_build blank
bats ./bats/test_blank.bats

_build config
bats ./bats/test_config.bats
