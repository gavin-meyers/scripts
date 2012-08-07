#!/bin/bash
#


tomcat_pid() {
  echo `ps aux | grep org.apache.catalina.startup.Bootstrap | grep -v grep | awk '{ print $2 }'`
}


tstatus() {
  pid=$(tomcat_pid)
  echo "Tomcat is running with PID $pid"
  return 0
}

case $1 in
	tstatus)
  		pid=$(tomcat_pid)
  		if [ -n "$pid" ]
  		then
			echo "Tomcat is running with pid: $pid"
  		else
			echo "Tomcat is not running"
  		fi
		;;
	help)
	  	help
		;;	
esac
exit 0