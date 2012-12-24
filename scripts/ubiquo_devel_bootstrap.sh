#!/bin/bash
# Script to initialize an environment to develop ubiquo and it's plugins
# Requires rvm and git already installed 

UBIQUO_FOLDER=$PWD
UBIQUO_GEMS_FOLDER="$UBIQUO_FOLDER/gems"
PROJECT_NAME="PROJECT_NAME" # Replace with script param
BUNDLER_VERSION="1.2.3" # TODO: Fix ubiquo to not require old 1.1.5 bundler"
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
gem install bundler -v $BUNDLER_VERSION --no-ri --no-rdoc
bundle install 

# 5. Build a project
echo "bundle exec ubiquo --edge --devel --rvm --gem-path $UBIQUO_GEMS_FOLDER/ubiquo --clone-gems PROJECT_NAME" 

# 6. Init app -- Optional steps or steps that should be done in ubiquo binary
echo "
cd $PROJECT_NAME
bundle exec rake ubiquo:db:init
"

