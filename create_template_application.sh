#!/bin/sh

#Check the Program Arguments are Present
if [ $# -lt 1 ]; then
         echo 1>&2 Usage: $0 ApplicationName
         exit 1
fi

APP_NAME=$1

#Check Program Argument is not Empty
if [ "$APP_NAME" == "" ]; then
         echo 1>&2 Usage: $0 ApplicationName
         exit 1
fi

## Refer https://github.com/RailsApps/rails3-subdomains/wiki/Tutorial ##
rails new $APP_NAME -m https://github.com/RailsApps/rails3-application-templates/raw/master/rails3-mongoid-devise-template.rb -T -O
