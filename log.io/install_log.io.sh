#!/usr/bin/env sh
git config --global http.proxy http://64.102.255.40:8080
git config --global https.proxy http://64.102.255.40:8080

git clone https://github.com/creationix/nvm.git ~/nvm
source ~/nvm/nvm.sh
nvm install v0.6.11
nvm use v0.6.11

npm config set proxy http://64.102.255.40:8080
npm config set registry "http://registry.npmjs.org/"
npm config set unsafe-perm true 

# Follow Steps 
# npm install -g --prefix=/usr/local log.io == To Ensure forever got installed with error

# Fix forever Error
# ~/.npm/forever/0.8.2/package/package.json then EDIT this line
# "node-fork": "git://github.com/bm eck/node-fork.git" --> change to "node-fork" : "0.4.0"
# Refer https://github.com/NarrativeScience/Log.io/wiki/v0.2.5-Build-Recipe-(Ubuntu-11.10)
# ===============

#npm install -g --prefix=/usr/local log.io
