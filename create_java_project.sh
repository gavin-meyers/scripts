#!/usr/bin/env sh
ARTIFACT_ID=$1

#Check the Program Arguments are Present
if [ $# -lt 1 ]; then
echo 1>&2 Usage: $0 ApplicationName
         exit 1
fi

#Check Program Argument is not Empty
if [ "$ARTIFACT_ID" == "" ]; then
echo 1>&2 Usage: $0 ApplicationName
         exit 1
fi

mvn archetype:create -DgroupId=com.cisco.eaas.spike -DartifactId=$1 -Dpackagename=com.cisco.eaas.spike
