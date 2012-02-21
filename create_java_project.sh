#!/usr/bin/env sh
ARTIFACT_ID=$1

mvn archetype:create -DgroupId=com.cisco.eaas.spike -DartifactId=$1 -Dpackagename=com.cisco.eaas.spike
