#!/bin/bash -e

mkdir $(pwd)/.test

test_app_name="test-app-$(date +%s)"

git clone https://github.com/mfojtik/sinatra-app-example .test/app
cd .test/app

function run_clean_build() {
  docker run --cidfile="app.cid" -v $(pwd):/tmp/src openshift/centos-ruby-builder
  docker commit $(cat app.cid) $test_app_name
  rm -f app.cid
}

function run_inc_build() {
  docker run --rm --entrypoint="/opt/ruby/bin/save-artifacts" $test_app_name > ../archive.tgz
  docker run --cidfile="app.cid" -i -v $(pwd):/tmp/src openshift/centos-ruby-builder < ../archive.tgz
  docker commit $(cat app.cid) $test_app_name
  rm -f app.cid
}

time run_clean_build
echo "gem 'nokogiri'" >> Gemfile
bundle install
time run_inc_build
echo "gem 'therubyracer'" >> Gemfile
bundle install
time run_inc_build
echo "gem 'rails'" >> Gemfile
bundle install
time run_inc_build

cd ../.. && rm -rf .test
