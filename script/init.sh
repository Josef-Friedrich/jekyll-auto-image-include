#! /bin/sh

rm -rf ./test/_site/

if [ ! -d ./test/_plugins/ ]; then
  mkdir ./test/_plugins/
fi
cp ./lib/jekyll-auto-image-include.rb ./test/_plugins/

cd test
bundle exec jekyll build
