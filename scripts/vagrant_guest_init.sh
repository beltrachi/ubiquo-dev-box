#!/bin/bash
TARGET_RUBY_VERSION="ruby-1.9.3-p327"
sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev git-core sqlite3 libsqlite3-dev curl

curl -L https://get.rvm.io | bash -s stable

echo "source /home/vagrant/.rvm/scripts/rvm " >> ~/.bashrc

source /home/vagrant/.rvm/scripts/rvm

rvm install $TARGET_RUBY_VERSION # Update version when required

rvm --default use $TARGET_RUBY_VERSION@global

# Install execjs engine - nodejs
sudo apt-get -y install nodejs
