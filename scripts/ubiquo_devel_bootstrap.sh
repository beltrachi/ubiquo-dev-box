#!/bin/bash
# Script to initialize an environment to develop ubiquo and it's plugins
# Requires rvm and git already installed 

UBIQUO_FOLDER=$PWD
UBIQUO_GEMS_FOLDER="$UBIQUO_FOLDER/gems"
PROJECT_NAME="sample_project" # Replace with script param
UBIQUO_REPO="git://github.com/gnuine/ubiquo.git"

# To develop on Ubiquo edge:
#
# 1. Create a folder for all this (~/workspace/ubiquo/)
#

mkdir -p $UBIQUO_FOLDER

# 2. Clone github repo on ~/workspace/ubiquo/gems/ubiquo

mkdir -p $UBIQUO_GEMS_FOLDER
cd $UBIQUO_GEMS_FOLDER 
git clone $UBIQUO_REPO

# 3. Create a Gemfile on ~/workspace/ubiquo/Gemfile with
BUNDLER_FILE=$UBIQUO_FOLDER/Gemfile

echo "source \"https://rubygems.org\"" >> $BUNDLER_FILE
echo "gem \"ubiquo\", :path => \"$UBIQUO_GEMS_FOLDER/ubiquo\"" >> $BUNDLER_FILE

# 4. Bundle install on this folder
cd $UBIQUO_FOLDER
bundle install 

# 5. Build a sample project
echo "Building sample project..."
bundle exec ubiquo --edge --devel --rvm --gem-path $UBIQUO_GEMS_FOLDER/ubiquo --clone-gems $PROJECT_NAME

# 6. Init app -- Optional steps or steps that should be done in ubiquo binary
cd $PROJECT_NAME
rvm @$PROJECT_NAME do bundle exec rake ubiquo:db:init
echo "Go to http://localhost:3000/ubiquo and create a user"
rvm @$PROJECT_NAME do bundle exec rails s

