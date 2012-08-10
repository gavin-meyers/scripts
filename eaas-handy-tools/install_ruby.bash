#!/usr/bin/env bash

# Install git
curl -L https://get-git.rvm.io | sudo bash

# Install RVM
curl -L https://get.rvm.io | bash -s stable

# Install Ruby
source "/usr/local/rvm/scripts/rvm"
command rvm install 1.9.3
rvm use 1.9.3 --default