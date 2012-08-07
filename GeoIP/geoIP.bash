#!/usr/bin/env bash
 
#set -x
traceroute -n -T $1 > vtrace.tmp
 
let LINES=`awk 'END { print NR }' vtrace.tmp`
 
FIRSTLINE=`head -n 1 vtrace.tmp`
echo $FIRSTLINE
echo 1 `sed -n 2p vtrace.tmp | awk '{print $2}'` `lynx -dump http://www.geoiptool.com/en/?IP= | sed -n '/Host Name/,/Postal code/p' | awk 'BEGIN { FS = "\n" ; RS = "" } { print $4 }' | awk '{print $3}'`
 
for ((c=3;c<=$LINES;c++))
do
        LINE=`sed -n $c\p vtrace.tmp | awk '{print $2}'`
        if [ "$LINE" != "*" ]
                then
                        IP=`lynx -dump "http://www.geoiptool.com/en/?IP=$LINE" | sed -n '/Host Name/,/Postal code/p'`
                        COUNTRY=`echo "$IP" | awk 'BEGIN { FS = "\n" ; RS = "" } { print $4 }' | awk '{print $3}'`
                        CITY=`echo "$IP" | awk 'BEGIN { FS = "\n" ; RS = "" } { print $5 }' | sed -e 's/\(Region:\|Region:.\[15\]\)//g'`
                        echo $c $LINE $COUNTRY $CITY
                else
                        echo \*
        fi
done
rm vtrace.tmp

