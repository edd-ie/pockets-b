#!/usr/bin/env bash
# exit on error
set -o errexit
# builds the back end code
bundle install
bundle exec rake db:migrate
#bundle exec rake db:seed # if you have seed data, run this command for the initial deploy only
