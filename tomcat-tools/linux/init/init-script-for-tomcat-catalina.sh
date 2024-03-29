#!/bin/sh
#
# "$Id: catalina ,v 1.0 2010/08/10 Chris_g Exp $"
#
#   Startup/shutdown script for tomcat(Catalina) Application server.
#
#   Linux chkconfig stuff:
#
#   chkconfig: 2345 56 10
#   description: Startup/shutdown script for the tomcat application server.
######

# Source function library.
######
. /etc/init.d/functions

# Define where the catalina.sh script is located.
######
CATALINA_BIN='/u01/tomcat/bin/catalina.sh 1> /dev/null';

# Find the catalina process using ps / awk.
# The match function will return 0 when no match is found with the string "java".
# Position $9 should contain the path to the Java executable used by catalina.
######
PROC=`ps -efc | grep apache.catalina | awk 'BEGIN { FS=" "}; { if( match($9, "java") != 0 ) print $9;}'`

# Replace a potential empty string with a fake process so the RH daemon functions are able to parse
# it properly
######
if [[ "$PROC" == '' ]]; then
    PROC='Tomcat_JVM';
fi

# Define the application name that is listed in the daemonize step.
PROG='Tomcat JVM';

# LOCKFILE
LOCK='/var/lock/subsys/tomcat';

start () {
        echo -n $"Starting $PROG: "

        # start daemon
        daemon $CATALINA_BIN start
        RETVAL=$?
        echo
        [ $RETVAL = 0 ] && touch $LOCK
        return $RETVAL
}

stop () {
        # stop daemon
        echo -n $"Stopping $PROG: "
        killproc $PROC
        RETVAL=$?
        echo
        [ $RETVAL = 0 ] && rm -f $LOCK
}

restart() {
        stop
        start
}

case $1 in
        start)
                start
        ;;
        stop)
                stop
        ;;
        restart)
                restart
        ;;
        status)
                status $PROC
                RETVAL=$?
        ;;
        *)

        echo $"Usage: $prog {start|stop|restart|status}"
        exit 3
esac

exit $RETVAL

